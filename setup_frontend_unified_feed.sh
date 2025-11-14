#!/bin/bash
echo "Setting up front-end unified feed, threads, and bottom menu..."

# 1️⃣ UnifiedFeed component
cat << 'EOT' > src/components/unified-feed.tsx
import { useEffect, useState } from 'react';
import { UnifiedFeedService } from '@/services/unifiedFeedService';

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
    const interval = setInterval(loadFeed, 15000); // auto-refresh every 15s
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
      {feed.map((p, i) => (
        <div
          key={i}
          className="flex gap-3 p-4 hover:bg-gray-900 transition-all cursor-pointer"
        >
          <img
            src={p.user?.avatar || p.avatar || '/assets/images/react.svg'}
            alt={p.user?.username || 'user'}
            className="w-10 h-10 rounded-full object-cover"
          />
          <div className="flex-1">
            <div className="flex justify-between items-center">
              <span className="font-semibold text-sm">
                @{p.user?.username || p.username || 'anonymous'}
              </span>
              {p.federated && (
                <span className="text-xs text-blue-400">🌐</span>
              )}
            </div>
            <p className="mt-1 text-sm" dangerouslySetInnerHTML={{ __html: p.content || p.text || '' }} />
          </div>
        </div>
      ))}
    </div>
  );
}
EOT

# 2️⃣ Collapsible Bottom Menu
cat << 'EOT' > src/components/bottom-menu.tsx
import { useEffect, useState } from 'react';

export default function BottomMenu() {
  const [visible, setVisible] = useState(true);
  let lastScroll = 0;

  useEffect(() => {
    const handleScroll = () => {
      const currentScroll = window.scrollY;
      if (currentScroll > lastScroll && currentScroll > 100) {
        setVisible(false); // scrolling down -> hide
      } else {
        setVisible(true); // scrolling up -> show
      }
      lastScroll = currentScroll;
    };
    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  return (
    <div className={`fixed bottom-0 left-0 w-full bg-gray-900 p-3 transition-transform duration-300 ${visible ? 'translate-y-0' : 'translate-y-full'}`}>
      <div className="flex justify-around text-white">
        <button>Home</button>
        <button>Search</button>
        <button>Upload</button>
        <button>Profile</button>
      </div>
    </div>
  );
}
EOT

echo "Front-end unified feed and bottom menu setup complete!"
