#!/bin/bash
echo "Creating ThreadCard Component..."

mkdir -p src/components/feed

# ThreadCard.tsx
cat << 'EOL' > src/components/feed/ThreadCard.tsx
import React from 'react';

export function ThreadCard({ user, avatar, content, replies, likes, retweets }: any) {
  return (
    <div style={{ border: '1px dashed #aaa', padding: '10px', margin: '10px 0' }}>
      <img src={avatar} alt="avatar" width={40} />
      <strong>{user}</strong>
      <p>{content}</p>
      <p>Likes: {likes} | Replies: {replies} | Retweets: {retweets}</p>
    </div>
  );
}
EOL

echo "ThreadCard Component created!"
