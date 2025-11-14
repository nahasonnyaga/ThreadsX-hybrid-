#!/bin/bash
echo "Creating PostCard Component..."

mkdir -p src/components/feed

# PostCard.tsx
cat << 'EOL' > src/components/feed/PostCard.tsx
import React from 'react';

export function PostCard({ user, avatar, content, likes, replies, retweets }: any) {
  return (
    <div style={{ border: '1px solid #ddd', padding: '10px', margin: '10px 0' }}>
      <img src={avatar} alt="avatar" width={40} />
      <strong>{user}</strong>
      <p>{content}</p>
      <p>Likes: {likes} | Replies: {replies} | Retweets: {retweets}</p>
    </div>
  );
}
EOL

echo "PostCard Component created!"
