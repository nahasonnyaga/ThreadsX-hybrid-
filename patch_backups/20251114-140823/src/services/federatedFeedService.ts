import { createClient } from '@supabase/supabase-js';
import { MASTODON_INSTANCE } from './mastodonService';

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL!;
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY!;
const supabase = createClient(supabaseUrl, supabaseAnonKey);

export const FederatedFeedService = {
  // 🔹 Fetch local posts from Supabase
  async getLocalPosts(limit = 20) {
    const { data, error } = await supabase
      .from('posts')
      .select('id, content, media_url, created_at, user_id, like_count, reply_count')
      .order('created_at', { ascending: false })
      .limit(limit);
    if (error) throw error;
    return data || [];
  },

  // 🔹 Fetch federated timeline from Mastodon
  async getFederatedPosts(limit = 20) {
    try {
      const res = await fetch(`${MASTODON_INSTANCE}/api/v1/timelines/public?limit=${limit}`, {
        headers: { Authorization: `Bearer ${import.meta.env.VITE_MASTODON_TOKEN}` },
      });
      const data = await res.json();
      return data.map((post: any) => ({
        id: post.id,
        content: post.content,
        media_url: post.media_attachments?.[0]?.url || null,
        created_at: post.created_at,
        user_id: post.account?.acct || 'federated',
        like_count: post.favourites_count,
        reply_count: post.replies_count,
        federated: true,
      }));
    } catch (error) {
      console.error('Failed to fetch federated posts:', error);
      return [];
    }
  },

  // 🔹 Merge and sort local + federated posts
  async getUnifiedFeed(limit = 50) {
    try {
      const [local, federated] = await Promise.all([
        this.getLocalPosts(limit / 2),
        this.getFederatedPosts(limit / 2),
      ]);

      const merged = [...local, ...federated].sort(
        (a, b) => new Date(b.created_at).getTime() - new Date(a.created_at).getTime()
      );

      return merged;
    } catch (error) {
      console.error('Unified feed error:', error);
      return [];
    }
  },
};
