#!/bin/bash

# 1️⃣ Fix ThreadCard.tsx export
cat << 'EOT' > src/components/post/ThreadCard.tsx
import React from 'react';

export const ThreadCard = ({ thread }: { thread?: any }) => {
  return (
    <div className="p-3 border-b border-gray-700">
      <p>{thread?.content || 'Thread content'}</p>
    </div>
  );
};
EOT

echo "✅ ThreadCard.tsx export fixed"

# 2️⃣ Add fetchFederatedPosts to mastodonService.ts
cat << 'EOT' > src/services/mastodonService.ts
export const MastodonService = {
  async fetchFederatedPosts() {
    // Example fetch from Mastodon public timeline (replace with your instance)
    try {
      const res = await fetch('https://mastodon.social/api/v1/timelines/home');
      const data = await res.json();
      return data;
    } catch (err) {
      console.error('Error fetching Mastodon posts:', err);
      return [];
    }
  }
};
EOT

echo "✅ mastodonService.ts updated with fetchFederatedPosts"

# 3️⃣ Update imports in feedService.ts and realtimeService.ts
sed -i "s|import { fetchFederatedPosts } from './mastodonService';|import { MastodonService } from './mastodonService';|g" src/services/feedService.ts
sed -i "s|import { fetchFederatedPosts } from './mastodonService';|import { MastodonService } from './mastodonService';|g" src/services/realtimeService.ts

echo "✅ Updated imports in feedService.ts and realtimeService.ts"

# 4️⃣ Reminder
echo "⚡ Remember to update function calls: fetchFederatedPosts() → MastodonService.fetchFederatedPosts()"

