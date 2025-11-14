#!/bin/bash
echo "Setting up Mastodon federation integration..."

# Mastodon client
cat << 'EOT' > src/services/backend/mastodonClient.ts
import Mastodon from 'mastodon-api';

export const MastodonClient = new Mastodon({
  access_token: 'YOUR_MASTODON_ACCESS_TOKEN',
  api_url: 'https://mastodon.social/api/v1/' // replace with your instance if different
});
EOT

# UnifiedFeedService to combine Supabase + Mastodon
cat << 'EOT' > src/services/unifiedFeedService.ts
import { supabase } from './backend/supabaseClient';
import { MastodonClient } from './backend/mastodonClient';

export const UnifiedFeedService = {
  async fetchUnifiedFeed() {
    // 1️⃣ Fetch Supabase posts
    const { data: supabasePosts } = await supabase
      .from('posts')
      .select('*')
      .order('created_at', { ascending: false });

    // 2️⃣ Fetch Mastodon posts (latest 20)
    const mastoRes = await MastodonClient.get('timelines/public', { limit: 20 });
    const mastodonPosts = mastoRes.data.map((p: any) => ({
      id: p.id,
      username: p.account.username,
      avatar: p.account.avatar,
      content: p.content,
      created_at: p.created_at,
      federated: true
    }));

    // Combine & sort by date
    const combined = [...(supabasePosts || []), ...mastodonPosts];
    combined.sort((a, b) => new Date(b.created_at).getTime() - new Date(a.created_at).getTime());

    return combined;
  },

  async postToSupabaseAndMastodon(post: any) {
    // Post to Supabase
    const { data } = await supabase.from('posts').insert([post]);

    // Post to Mastodon if flagged
    if (post.federate) {
      await MastodonClient.post('statuses', {
        status: post.content,
        visibility: 'public'
      });
    }

    return data ? data[0] : null;
  }
};
EOT

echo "Mastodon federation setup complete! Unified feed now includes Supabase + Mastodon posts."
