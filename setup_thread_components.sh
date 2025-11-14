#!/bin/bash
echo "Creating Thread Components..."
mkdir -p src/components/post

# ThreadCard.tsx
cat << 'EOL' > src/components/post/ThreadCard.tsx
import React from 'react';
export function ThreadCard({ thread }: { thread: any }) {
  return (
    <div style={{ border: '1px dashed #aaa', margin: '10px', padding: '10px' }}>
      <h4>{thread.user}</h4>
      <p>{thread.content}</p>
      <small>{thread.likes} Likes | {thread.replies} Replies | {thread.retweets} Retweets</small>
    </div>
  );
}
EOL

# ThreadPreview.tsx
cat << 'EOL' > src/components/post/ThreadPreview.tsx
import React from 'react';
import { ThreadCard } from './ThreadCard';

export function ThreadPreview({ threads }: { threads: any[] }) {
  return (
    <div>
      {threads.map(thread => <ThreadCard key={thread.id} thread={thread} />)}
    </div>
  );
}
EOL

echo "Thread Components created!"
