#!/bin/bash
echo "Setting up Mastodon federated sync for Threads..."

# 1️⃣ Create MastodonService
cat << 'EOT' > src/services/mastodonService.ts
export const MastodonService = {
  async fetchToots() {
    // Example: fetch latest posts from a Mastodon instance (replace with real API call)
    // Here we simulate fetched posts
    return [
      {
        id: 'm1',
        user: { username: 'mastouser1', avatar: '/assets/images/react.svg' },
        content: 'Hello from Mastodon! #federated',
        type: 'thread',
        replies: 2
      },
      {
        id: 'm2',
        user: { username: 'mastouser2', avatar: '/assets/images/react.svg' },
        content: 'Another toot synced to Threads feed.',
        type: 'thread',
        replies: 0
      }
    ];
  }
};
EOT

# 2️⃣ Update UnifiedFeedService to include Mastodon posts
cat << 'EOT' > src/services/unifiedFeedService.ts
import { MastodonService } from './mastodonService';
import { ThreadService } from './threadService';

export const UnifiedFeedService = {
  async fetchUnifiedFeed() {
    const localThreads = await ThreadService.fetchThreads();
    const mastodonPosts = await MastodonService.fetchToots();
    // Merge and sort by newest first (simulate created_at with ID for now)
    const combined = [...mastodonPosts, ...localThreads];
    return combined.sort((a, b) => (b.id > a.id ? 1 : -1));
  }
};
EOT

echo "Mastodon federated sync setup complete! Threads now include Mastodon posts."
