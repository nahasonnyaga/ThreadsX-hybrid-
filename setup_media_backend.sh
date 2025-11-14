#!/bin/bash
echo "Setting up media upload services with Cloudinary + BunnyNet..."

# Cloudinary client
cat << 'EOT' > src/services/backend/cloudinaryClient.ts
import { v2 as cloudinary } from 'cloudinary';

cloudinary.config({
  cloud_name: 'YOUR_CLOUDINARY_NAME',
  api_key: 'YOUR_CLOUDINARY_API_KEY',
  api_secret: 'YOUR_CLOUDINARY_API_SECRET'
});

export const CloudinaryClient = cloudinary;
EOT

# BunnyNet client
cat << 'EOT' > src/services/backend/bunnyNetClient.ts
import axios from 'axios';

export const BunnyNetClient = {
  storageZone: 'YOUR_BUNNY_STORAGE_ZONE',
  apiKey: 'YOUR_BUNNY_API_KEY',
  async uploadFile(filePath: string, remotePath: string) {
    const url = `https://storage.bunnycdn.com/${this.storageZone}/${remotePath}`;
    const data = await axios.put(url, require('fs').createReadStream(filePath), {
      headers: { 'AccessKey': this.apiKey }
    });
    return url;
  }
};
EOT

# Update PostService for media upload
cat << 'EOT' > src/services/postService.ts
import { supabase } from './backend/supabaseClient';
import { CloudinaryClient } from './backend/cloudinaryClient';
import { BunnyNetClient } from './backend/bunnyNetClient';

export const PostService = {
  async fetchPosts() {
    const { data } = await supabase.from('posts').select('*').order('created_at', { ascending: false });
    return data || [];
  },

  async createPost(post: any, mediaFile?: any) {
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
EOT

# Update ThreadService for media upload
cat << 'EOT' > src/services/threadService.ts
import { supabase } from './backend/supabaseClient';
import { CloudinaryClient } from './backend/cloudinaryClient';
import { BunnyNetClient } from './backend/bunnyNetClient';

export const ThreadService = {
  async fetchThreads() {
    const { data } = await supabase.from('threads').select('*').order('created_at', { ascending: false });
    return data || [];
  },

  async postThread(thread: any, mediaFile?: any) {
    if (mediaFile) {
      const cloudinaryRes = await CloudinaryClient.uploader.upload(mediaFile.path, { resource_type: 'auto' });
      thread.media = cloudinaryRes.secure_url;
      await BunnyNetClient.uploadFile(mediaFile.path, `threads/${mediaFile.name}`);
    }

    const { data } = await supabase.from('threads').insert([thread]);
    return data ? data[0] : null;
  }
};
EOT

echo "Media backend setup completed! Posts and Threads now support video/image uploads via Cloudinary + BunnyNet."
