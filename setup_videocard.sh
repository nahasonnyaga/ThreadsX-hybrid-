#!/bin/bash
echo "Creating VideoCard Component..."

mkdir -p src/components/feed

# VideoCard.tsx
cat << 'EOL' > src/components/feed/VideoCard.tsx
import React from 'react';

export function VideoCard({ title, url, thumbnail }: any) {
  return (
    <div style={{ border: '1px solid #ccc', padding: '10px', margin: '10px 0' }}>
      <h4>{title}</h4>
      <video src={url} poster={thumbnail} width={300} controls />
    </div>
  );
}
EOL

echo "VideoCard Component created!"
