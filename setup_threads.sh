#!/bin/bash
echo "Creating ThreadCard and ThreadPreview components..."

mkdir -p src/components/post

# ThreadCard.tsx
cat << 'EOF2' > src/components/post/ThreadCard.tsx
import React from 'react';

interface ThreadCardProps {
  id: number;
  author: string;
  content: string;
  repliesCount?: number;
  likesCount?: number;
}

const ThreadCard: React.FC<ThreadCardProps> = ({ id, author, content, repliesCount = 0, likesCount = 0 }) => {
  return (
    <div className="border rounded-lg p-4 shadow-md hover:shadow-xl transition mb-4">
      <h4 className="font-bold">{author}</h4>
      <p className="text-gray-700 mt-2">{content}</p>
      <div className="flex justify-between text-gray-500 mt-3 text-sm">
        <span>{repliesCount} replies</span>
        <span>{likesCount} likes</span>
      </div>
    </div>
  );
};

export default ThreadCard;
EOF2

# ThreadPreview.tsx
cat << 'EOF2' > src/components/post/ThreadPreview.tsx
import React from 'react';
import ThreadCard from './ThreadCard';

interface ThreadPreviewProps {
  thread: { id: number; author: string; content: string; replies?: any[]; likes?: number }[];
}

const ThreadPreview: React.FC<ThreadPreviewProps> = ({ thread }) => {
  return (
    <div className="space-y-3">
      {thread.map((t) => (
        <ThreadCard
          key={t.id}
          id={t.id}
          author={t.author}
          content={t.content}
          repliesCount={t.replies?.length || 0}
          likesCount={t.likes || 0}
        />
      ))}
    </div>
  );
};

export default ThreadPreview;
EOF2

echo "ThreadCard and ThreadPreview components created at src/components/post!"
