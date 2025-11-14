#!/bin/bash
echo "Creating Community components and pages..."

mkdir -p src/components/feed
mkdir -p src/pages

# CommunityCard.tsx
cat << 'EOF2' > src/components/feed/CommunityCard.tsx
import React from 'react';

interface CommunityCardProps {
  id: number;
  name: string;
  description?: string;
  membersCount?: number;
}

const CommunityCard: React.FC<CommunityCardProps> = ({ id, name, description = '', membersCount = 0 }) => {
  return (
    <div className="border rounded-lg p-4 shadow-md hover:shadow-xl transition mb-4">
      <h3 className="font-bold text-lg">{name}</h3>
      <p className="text-gray-600 mt-1">{description}</p>
      <p className="text-gray-500 text-sm mt-2">{membersCount} members</p>
    </div>
  );
};

export default CommunityCard;
EOF2

# Community.tsx page
cat << 'EOF2' > src/pages/Community.tsx
import React from 'react';
import CommunityCard from '../components/feed/CommunityCard';

const dummyCommunities = [
  { id: 1, name: 'Tech Talks', description: 'All about tech', membersCount: 1200 },
  { id: 2, name: 'Music Lovers', description: 'Share music', membersCount: 800 },
  { id: 3, name: 'Fitness Hub', description: 'Health & fitness', membersCount: 450 },
];

const Community: React.FC = () => {
  return (
    <div className="p-6">
      <h2 className="text-2xl font-bold mb-4">Communities</h2>
      <div className="space-y-4">
        {dummyCommunities.map((c) => (
          <CommunityCard
            key={c.id}
            id={c.id}
            name={c.name}
            description={c.description}
            membersCount={c.membersCount}
          />
        ))}
      </div>
    </div>
  );
};

export default Community;
EOF2

echo "CommunityCard component and Community page created!"
