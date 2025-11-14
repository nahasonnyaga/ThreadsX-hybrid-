#!/bin/bash
echo "Setting up threads and nested replies UI..."

# 1️⃣ ThreadCard component
cat << 'EOT' > src/components/thread-card.tsx
import { useState } from 'react';

export default function ThreadCard({ thread }: any) {
  const [open, setOpen] = useState(false);

  return (
    <div className="border-b border-gray-700 p-4 cursor-pointer hover:bg-gray-900 transition-all">
      <div className="flex gap-3" onClick={() => setOpen(!open)}>
        <img
          src={thread.user?.avatar || '/assets/images/react.svg'}
          alt={thread.user?.username || 'user'}
          className="w-10 h-10 rounded-full object-cover"
        />
        <div className="flex-1">
          <div className="flex justify-between items-center">
            <span className="font-semibold text-sm">@{thread.user?.username || thread.username}</span>
            <span className="text-xs text-gray-400">{thread.timestamp}</span>
          </div>
          <p className="mt-1 text-sm">{thread.content}</p>
        </div>
      </div>

      {open && thread.replies && thread.replies.length > 0 && (
        <div className="ml-12 mt-2 space-y-2">
          {thread.replies.map((reply: any, idx: number) => (
            <div key={idx} className="flex gap-3 p-2 border-l border-gray-600">
              <img
                src={reply.user?.avatar || '/assets/images/react.svg'}
                alt={reply.user?.username || 'user'}
                className="w-8 h-8 rounded-full object-cover"
              />
              <div className="flex-1">
                <span className="font-semibold text-sm">@{reply.user?.username || reply.username}</span>
                <p className="text-sm">{reply.content}</p>
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}
EOT

# 2️⃣ Update UnifiedFeed to use ThreadCard
cat << 'EOT' > src/components/unified-feed.tsx
import { useEffect, useState } from 'react';
import { UnifiedFeedService } from '@/services/unifiedFeedService';
import ThreadCard from './thread-card';

export default function UnifiedFeed() {
  const [feed, setFeed] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    let mounted = true;
    async function loadFeed() {
      const data = await UnifiedFeedService.fetchUnifiedFeed();
      if (mounted) {
        setFeed(data);
        setLoading(false);
      }
    }
    loadFeed();
    const interval = setInterval(loadFeed, 15000);
    return () => {
      mounted = false;
      clearInterval(interval);
    };
  }, []);

  if (loading) return (
    <div className="flex justify-center items-center py-10 text-gray-400">
      Loading feed...
    </div>
  );

  return (
    <div className="divide-y divide-gray-800">
      {feed.length === 0 && (
        <p className="text-center py-8 text-gray-400">No posts yet.</p>
      )}
      {feed.map((post, i) => (
        <ThreadCard key={i} thread={post} />
      ))}
    </div>
  );
}
EOT

echo "Threads UI with nested replies is set up!"
