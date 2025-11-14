#!/bin/bash
echo "Creating Feed, PostCard, VideoCard, and ThreadCard components..."

mkdir -p src/components/feed
mkdir -p src/components/post
mkdir -p src/components/video

# Feed.tsx
cat << 'EOL' > src/components/feed/Feed.tsx
import React, { useEffect, useState } from 'react';
import { PostCard } from '../post/PostCard';
import { ThreadCard } from '../post/ThreadCard';
import { VideoCard } from './VideoCard';
import { PostService } from '../../services/postService';
import { ThreadService } from '../../services/threadService';

export function Feed() {
  const [posts, setPosts] = useState<any[]>([]);
  const [threads, setThreads] = useState<any[]>([]);

  useEffect(() => {
    PostService.fetchPosts().then(setPosts);
    ThreadService.fetchThreads().then(setThreads);
  }, []);

  return (
    <div>
      {posts.map(post => <PostCard key={post.id} post={post} />)}
      {threads.map(thread => <ThreadCard key={thread.id} thread={thread} />)}
      <VideoCard />
    </div>
  );
}
EOL

# PostCard.tsx
cat << 'EOL' > src/components/post/PostCard.tsx
import React from 'react';

export function PostCard({ post }: any) {
  return (
    <div style={{ border: '1px solid #eee', borderRadius: '10px', padding: '10px', margin: '10px 0' }}>
      <div style={{ display: 'flex', gap: '10px', alignItems: 'center' }}>
        <img src={post.avatar} alt={post.user} width={40} height={40} style={{ borderRadius: '50%' }} />
        <strong>{post.user}</strong>
      </div>
      <p>{post.content}</p>
      <div style={{ display: 'flex', gap: '15px', fontSize: '12px' }}>
        <span>Likes: {post.likes}</span>
        <span>Replies: {post.replies}</span>
        <span>Retweets: {post.retweets}</span>
      </div>
    </div>
  );
}
EOL

# ThreadCard.tsx
cat << 'EOL' > src/components/post/ThreadCard.tsx
import React from 'react';

export function ThreadCard({ thread }: any) {
  return (
    <div style={{ border: '1px solid #ccc', borderRadius: '10px', padding: '10px', margin: '10px 0', background: '#f9f9f9' }}>
      <div style={{ display: 'flex', gap: '10px', alignItems: 'center' }}>
        <img src={thread.avatar} alt={thread.user} width={40} height={40} style={{ borderRadius: '50%' }} />
        <strong>{thread.user}</strong>
      </div>
      <p>{thread.content}</p>
      <div style={{ display: 'flex', gap: '10px', fontSize: '12px' }}>
        <span>Replies: {thread.replies}</span>
        <span>Likes: {thread.likes}</span>
        <span>Retweets: {thread.retweets}</span>
      </div>
    </div>
  );
}
EOL

# VideoCard.tsx
cat << 'EOL' > src/components/video/VideoCard.tsx
import React from 'react';

export function VideoCard() {
  return (
    <div style={{ border: '1px solid #eee', borderRadius: '10px', margin: '10px 0', padding: '10px' }}>
      <video width="100%" controls>
        <source src="/assets/react.svg" type="video/mp4" />
        Your browser does not support the video tag.
      </video>
      <p>Sample Video</p>
    </div>
  );
}
EOL

echo "Feed, PostCard, VideoCard, and ThreadCard components created!"
