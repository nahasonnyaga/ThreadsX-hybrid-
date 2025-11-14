import { supabase } from './backend/supabaseClient';
import { CloudinaryClient } from './backend/cloudinaryClient';
import { BunnyNetClient } from './backend/bunnyNetClient';
export const PostService = {
    async fetchPosts() {
        const { data } = await supabase.from('posts').select('*').order('created_at', { ascending: false });
        return data || [];
    },
    async createPost(post, mediaFile) {
        if (mediaFile) {
            // Upload to Cloudinary first
            const cloudinaryRes = await CloudinaryClient.uploader.upload(mediaFile.path, { resource_type: 'auto' });
            post.media = cloudinaryRes.secure_url;
            // Optionally upload to BunnyNet storage
            await BunnyNetClient.uploadFile(mediaFile.path, `posts/${mediaFile.name}`);
        }
        const { data } = await supabase.from('posts').insert([post]);
        return data ? data[0] : null;
    }
};
