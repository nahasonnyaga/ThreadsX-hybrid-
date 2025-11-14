#!/bin/bash
echo "Creating Spaces and Communities pages..."

mkdir -p src/components/space
mkdir -p src/components/community

# SpaceCard.tsx
cat << 'EOL' > src/components/space/SpaceCard.tsx
import React from 'react';

export function SpaceCard({ space }: any) {
  return (
    <div style={{ border: '1px solid #ccc', padding: '10px', marginBottom: '10px', borderRadius: '10px' }}>
      <h3>{space.name}</h3>
      <p>Host: {space.host}</p>
      <p>Scheduled: {space.schedule}</p>
    </div>
  );
}
EOL

# CommunityCard.tsx
cat << 'EOL' > src/components/community/CommunityCard.tsx
import React from 'react';

export function CommunityCard({ community }: any) {
  return (
    <div style={{ border: '1px solid #ccc', padding: '10px', marginBottom: '10px', borderRadius: '10px' }}>
      <h3>{community.name}</h3>
      <p>{community.description}</p>
      <p>Members: {community.members}</p>
    </div>
  );
}
EOL

# Spaces.tsx
cat << 'EOL' > src/pages/Spaces.tsx
import React from 'react';
import { SpaceCard } from '../components/space/SpaceCard';
import { SpaceService } from '../services/spaceService';

export default function Spaces() {
  const spaces = SpaceService.fetchSpaces();

  return (
    <div style={{ maxWidth: '600px', margin: '0 auto', padding: '10px' }}>
      <h1 style={{ textAlign: 'center', margin: '20px 0' }}>Spaces</h1>
      {spaces.map((space: any, index: number) => (
        <SpaceCard key={index} space={space} />
      ))}
    </div>
  );
}
EOL

# Community.tsx
cat << 'EOL' > src/pages/Community.tsx
import React from 'react';
import { CommunityCard } from '../components/community/CommunityCard';
import { CommunityService } from '../services/communityService';

export default function Community() {
  const communities = CommunityService.fetchCommunities();

  return (
    <div style={{ maxWidth: '600px', margin: '0 auto', padding: '10px' }}>
      <h1 style={{ textAlign: 'center', margin: '20px 0' }}>Communities</h1>
      {communities.map((comm: any, index: number) => (
        <CommunityCard key={index} community={comm} />
      ))}
    </div>
  );
}
EOL

echo "Spaces and Communities pages created!"
