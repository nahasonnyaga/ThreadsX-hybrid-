#!/bin/bash
echo "Setting up Threads page with inline thread view..."

# 1️⃣ Create ThreadsPage component
cat << 'EOT' > src/pages/Threads.tsx
import { useEffect, useState } from 'react';
import { UnifiedFeedService } from '@/services/unifiedFeedService';

export default function Threads() {
  const [threads, setThreads] = useState<any[]>([]);
  const [selectedThread, setSelectedThread] = useState<any | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    let mounted = true;
    async function loadThreads() {
      const data = await UnifiedFeedService.fetchUnifiedFeed();
      if (mounted) {
        setThreads(data.filter(p => p.type === 'thread'));
        setLoading(false);
      }
    }
    loadThreads();
    const interval = setInterval(loadThreads, 15000);
    return () => { mounted = false; clearInterval(interval); }
  }, []);

  if (loading) return <div className="flex justify-center items-center py-10 text-gray-400">Loading threads...</div>;

  return (
    <div className="flex flex-col divide-y divide-gray-800">
      {selectedThread ? (
        <div className="p-4">
          <button className="mb-4 text-sm text-blue-400" onClick={() => setSelectedThread(null)}>← Back to threads</button>
          <div className="flex gap-3">
            <img src={selectedThread.user?.avatar || '/assets/images/react.svg'} alt="avatar" className="w-10 h-10 rounded-full object-cover" />
            <div className="flex-1">
              <p className="font-semibold">@{selectedThread.user?.username}</p>
              <p className="mt-1">{selectedThread.content}</p>
              {selectedThread.replies && <p className="mt-2 text-sm text-gray-400">{selectedThread.replies} Replies</p>}
            </div>
          </div>
        </div>
      ) : (
        threads.map((t, i) => (
          <div key={i} className="p-4 hover:bg-gray-900 cursor-pointer" onClick={() => setSelectedThread(t)}>
            <div className="flex gap-3">
              <img src={t.user?.avatar || '/assets/images/react.svg'} alt="avatar" className="w-10 h-10 rounded-full object-cover" />
              <div className="flex-1">
                <p className="font-semibold">@{t.user?.username}</p>
                <p className="mt-1">{t.content}</p>
              </div>
            </div>
          </div>
        ))
      )}
    </div>
  );
}
EOT

echo "Threads page setup complete with inline thread view!"
