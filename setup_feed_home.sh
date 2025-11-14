#!/bin/bash
echo "Creating Feed and Home page integration..."

mkdir -p src/components/feed

# Feed.tsx
cat << 'EOL' > src/components/feed/Feed.tsx
import React from 'react';
import { PostCard } from '../post/PostCard';
import { ThreadCard } from '../post/ThreadCard';
import { BottomMenu } from '../ui/BottomMenu';
import { PostService } from '../../services/postService';
import { ThreadService } from '../../services/threadService';

export function Feed() {
  const posts = PostService.fetchPosts();
  const threads = ThreadService.threads;

  return (
    <div style={{ paddingBottom: '70px' }}>
      {[...threads, ...posts].map((item, index) => 
        item.content && <PostCard key={index} post={item} /> ||
        item.thread && <ThreadCard key={index} thread={item} />
      )}
      <BottomMenu />
    </div>
  );
}
EOL

# Home.tsx
cat << 'EOL' > src/pages/Home.tsx
import React from 'react';
import { Feed } from '../components/feed/Feed';

export default function Home() {
  return (
    <div style={{ maxWidth: '600px', margin: '0 auto', padding: '10px' }}>
      <h1 style={{ textAlign: 'center', margin: '20px 0' }}>Flutter-TikTok Feed</h1>
      <Feed />
    </div>
  );
}
EOL

echo "Feed and Home page integration created!"
