#!/bin/bash
echo "Creating Community Components..."
mkdir -p src/components/community

# CommunityCard.tsx
cat << 'EOL' > src/components/community/CommunityCard.tsx
import React from 'react';
export function CommunityCard({ community }: { community: any }) {
  return (
    <div style={{ border: '1px solid #ccc', margin: '10px 0', padding: '10px' }}>
      <h3>{community.name}</h3>
      <p>{community.description}</p>
      <small>{community.members} Members</small>
    </div>
  );
}
EOL

echo "Community Components created!"
