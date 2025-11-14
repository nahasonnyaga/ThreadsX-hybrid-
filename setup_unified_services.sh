mkdir -p src/services

cat << 'CODE' > src/services/unifiedFeedService.ts
import { SupabaseService } from './supabaseService';
import { FirebaseService } from './firebaseService';
import { MastodonService } from './mastodonService';

export const UnifiedFeedService = {
  async fetchUnifiedFeed() {
    const [localPosts, firebaseFeed, federatedPosts] = await Promise.all([
      SupabaseService.fetchPosts(),
      new Promise(resolve => {
        let done = false;
        FirebaseService.subscribeToFeed((data) => {
          if (!done) {
            done = true;
            resolve(Object.values(data || {}));
          }
        });
        setTimeout(() => resolve([]), 4000);
      }),
      MastodonService.fetchFederatedPosts().catch(() => []),
    ]);

    const all = [
      ...(localPosts || []),
      ...(firebaseFeed || []),
      ...(federatedPosts || []),
    ];

    // sort newest first
    return all.sort((a: any, b: any) =>
      new Date(b.created_at || b.createdAt || 0).getTime() -
      new Date(a.created_at || a.createdAt || 0).getTime()
    );
  },
};
CODE

cat << 'CODE' > src/services/unifiedProfileService.ts
import { SupabaseService } from './supabaseService';
import { MastodonService } from './mastodonService';

export const UnifiedProfileService = {
  async fetchUserProfile(username: string) {
    const local = await SupabaseService.fetchUserProfile(username);
    let federated = null;
    try {
      const res = await fetch(\`\${MastodonService.instance}/api/v1/accounts/search?q=\${username}&limit=1\`);
      const data = await res.json();
      federated = data[0] || null;
    } catch (_) {}

    return {
      username: local?.username || federated?.username || username,
      avatar: federated?.avatar || local?.avatar || '/assets/images/react.svg',
      bio: federated?.note || local?.bio || 'No bio available',
      followers: federated?.followers_count || 0,
      following: federated?.following_count || 0,
      posts: local?.posts || [],
      federated,
      local,
    };
  },
};
CODE

echo "✅ Unified Feed + Profile Services created successfully!"
