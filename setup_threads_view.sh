#!/bin/bash
echo "Setting up threads view with collapsible replies..."

# 1️⃣ Update ThreadService to include replies
cat << 'EOT' > src/services/threadService.ts
export const ThreadService = {
  threads: [
    {
      id: 1,
      user: 'JaneDoe',
      avatar: '/assets/images/react.svg',
      content: 'Just started learning React! #100DaysOfCode',
      replies: [
        { id: 1, user: 'JohnSmith', content: 'Good luck!' },
        { id: 2, user: 'Alice', content: 'You got this!' }
      ],
      likes: 12,
      retweets: 3
    },
    {
      id: 2,
      user: 'JohnSmith',
      avatar: '/assets/images/react.svg',
      content: 'TikTok algorithm is wild 🤯',
      replies: [],
      likes: 20,
      retweets: 5
    }
  ],

  async fetchThreads() {
    return this.threads;
  },

  async postThread(thread: any) {
    this.threads.unshift(thread);
    return thread;
  }
};
EOT

# 2️⃣ Create ThreadCard component with collapsible replies
cat << 'EOT' > src/components/post/ThreadCard.tsx
import { useState } from 'react';

export default function ThreadCard({ thread }: { thread: any }) {
  const [open, setOpen] = useState(false);

  return (
    <div className="p-4 border-b border-gray-700 hover:bg-gray-900 cursor-pointer">
      <div className="flex gap-3">
        <img src={thread.avatar || '/assets/images/react.svg'} alt={thread.user} className="w-10 h-10 rounded-full" />
        <div className="flex-1">
          <div className="flex justify-between items-center">
            <span className="font-semibold text-sm">@{thread.user}</span>
            <span className="text-xs text-gray-400">{thread.likes} Likes • {thread.retweets} Retweets</span>
          </div>
          <p className="mt-1">{thread.content}</p>
          {thread.replies.length > 0 && (
            <button
              onClick={() => setOpen(!open)}
              className="text-blue-500 text-sm mt-2"
            >
              {open ? 'Hide Replies' : `View Replies (${thread.replies.length})`}
            </button>
          )}
          {open && (
            <div className="mt-2 ml-4 divide-y divide-gray-700">
              {thread.replies.map((r:any,i:number) => (
                <div key={i} className="py-2">
                  <span className="font-semibold text-sm">@{r.user}</span>: {r.content}
                </div>
              ))}
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
EOT

# 3️⃣ Create ThreadsPage to render all threads
cat << 'EOT' > src/pages/Threads.tsx
import { useEffect, useState } from 'react';
import { ThreadService } from '@/services/threadService';
import ThreadCard from '@/components/post/ThreadCard';

export default function Threads() {
  const [threads, setThreads] = useState<any[]>([]);

  useEffect(() => {
    async function loadThreads() {
      const data = await ThreadService.fetchThreads();
      setThreads(data);
    }
    loadThreads();
  }, []);

  return (
    <div className="divide-y divide-gray-800">
      {threads.length === 0 && <p className="text-center py-6 text-gray-400">No threads yet.</p>}
      {threads.map((t,i) => <ThreadCard key={i} thread={t} />)}
    </div>
  );
}
EOT

echo "Thread view with collapsible replies has been set up!"
