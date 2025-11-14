import { MastodonService } from './mastodonService';
import { SupabaseService } from './supabaseService';
import { FirebaseService } from './firebaseService';
export const UnifiedFeedService = {
    async fetchUnifiedFeed() {
        // local/mock threads
        const local = [
            { id: 3, type: 'thread', user: { username: 'JaneDoe', avatar: '/assets/images/react.svg' }, content: 'Local thread post', timestamp: new Date().toISOString() }
        ];
        // supabase stub
        const supa = (await SupabaseService.from('posts').select()).data || [];
        // firebase stub
        const firebaseSnap = await FirebaseService.db.collection('posts').get();
        const firebasePosts = (firebaseSnap.docs || []).map((d) => d.data ? d.data() : {});
        // mastodon
        const mastodon = await MastodonService.fetchFederatedPosts();
        const unified = [...local, ...supa, ...firebasePosts, ...mastodon];
        unified.sort((a, b) => (b.timestamp || 0) > (a.timestamp || 0) ? 1 : -1);
        return unified;
    },
    async postContent(user, content, mediaFile) {
        const post = {
            id: `${Date.now()}`,
            username: user?.username || 'anon',
            avatar: user?.avatar || '/assets/images/react.svg',
            content,
            mediaUrl: mediaFile ? '/mock/video/url.mp4' : '',
            timestamp: new Date().toISOString()
        };
        await SupabaseService.from('posts').insert([post]);
        await FirebaseService.db.collection('posts').doc(post.id).set(post);
        return post;
    }
};
