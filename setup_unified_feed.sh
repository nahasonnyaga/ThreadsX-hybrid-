#!/bin/bash
echo "Setting up Unified Feed with federated content..."

# 1️⃣ UnifiedFeedService fetching from Supabase, Mastodon, and Cloudinary
cat << 'EOT' > src/services/unifiedFeedService.ts
import { ThreadService } from './threadService';

// Mock Supabase, Mastodon, Firebase/Cloudinary integration
export const UnifiedFeedService = {
  async fetchUnifiedFeed() {
    // Threads
    const threads = await ThreadService.fetchThreads();

    // Placeholder for Supabase fetch
    const supabasePosts = [
      { id: 101, user: { username: 'SupabaseUser', avatar: '/assets/images/react.svg' }, content: 'Supabase post #1' }
    ];

    // Placeholder for Mastodon fetch
    const mastodonPosts = [
      { id: 201, user: { username: 'MastodonUser', avatar: '/assets/images/react.svg' }, content: 'Mastodon post #1' }
    ];

    // Placeholder for Cloudinary media posts
    const cloudinaryPosts = [
      { id: 301, user: { username: 'CloudUser', avatar: '/assets/images/react.svg' }, content: 'Cloudinary image post', mediaUrl: '/assets/images/react.svg' }
    ];

    // Combine all sources
    const unified = [...threads.map(t => ({ ...t, type: 'thread' })), 
                     ...supabasePosts.map(p => ({ ...p, type: 'supabase' })),
                     ...mastodonPosts.map(p => ({ ...p, type: 'mastodon' })),
                     ...cloudinaryPosts.map(p => ({ ...p, type: 'cloudinary' }))];

    // Sort by id descending (newest first)
    unified.sort((a,b) => b.id - a.id);

    return unified;
  }
};
EOT

# 2️⃣ Update UnifiedFeed component
cat << 'EOT' > src/components/UnifiedFeed.tsx
import { useEffect, useState } from 'react';
import { UnifiedFeedService } from '@/services/unifiedFeedService';

export default function UnifiedFeed() {
  const [feed, setFeed] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    let mounted = true;
    async function loadFeed() {
      const data = await UnifiedFeedService.fetchUnifiedFeed();
      if(mounted) {
        setFeed(data);
        setLoading(false);
      }
    }
    loadFeed();
    const interval = setInterval(loadFeed, 15000); // auto-refresh 15s
    return () => { mounted = false; clearInterval(interval); }
  }, []);

  if(loading) return <div className="flex justify-center items-center py-10 text-gray-400">Loading feed...</div>;

  return (
    <div className="divide-y divide-gray-800">
      {feed.length === 0 && <p className="text-center py-8 text-gray-400">No posts yet.</p>}
      {feed.map((p,i) => (
        <div key={i} className="flex gap-3 p-4 hover:bg-gray-900 cursor-pointer">
          <img src={p.user?.avatar || '/assets/images/react.svg'} alt={p.user?.username || 'user'} className="w-10 h-10 rounded-full object-cover" />
          <div className="flex-1">
            <div className="flex justify-between items-center">
              <span className="font-semibold text-sm">@{p.user?.username || p.username || 'anonymous'}</span>
              <span className="text-xs text-gray-400">{p.likes || 0} Likes • {p.retweets || 0} Retweets</span>
            </div>
            <p className="mt-1">{p.content || p.status || p.text}</p>
            {p.mediaUrl && <img src={p.mediaUrl} alt="media" className="mt-2 rounded max-h-60 object-cover" />}
          </div>
        </div>
      ))}
    </div>
  );
}
EOT

echo "Unified Feed with federated content setup complete!"
