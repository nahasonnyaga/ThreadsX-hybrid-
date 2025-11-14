#!/bin/bash
echo "Creating Feed & Post Components..."
mkdir -p src/components/feed
mkdir -p src/components/post

# Feed.tsx
cat << 'EOL' > src/components/feed/Feed.tsx
import React from 'react';
import { useFetchFeed } from '../../hooks/useFetchFeed';
import { PostCard } from './PostCard';

export function Feed() {
  const { posts } = useFetchFeed();
  return (
    <div>
      {posts.map((post: any) => (
        <PostCard key={post.id} post={post} />
      ))}
    </div>
  );
}
EOL

# PostCard.tsx
cat << 'EOL' > src/components/feed/PostCard.tsx
import React from 'react';
export function PostCard({ post }: { post: any }) {
  return (
    <div style={{ border: '1px solid #ccc', margin: '10px', padding: '10px' }}>
      <h3>{post.user}</h3>
      <p>{post.content}</p>
      <small>{post.likes} Likes | {post.replies} Replies</small>
    </div>
  );
}
EOL

echo "Feed & Post Components created!"
