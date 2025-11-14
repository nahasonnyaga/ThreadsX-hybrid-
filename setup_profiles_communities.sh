#!/bin/bash
echo "Creating profiles, communities, and spaces components and services..."

# Directories
mkdir -p src/components/profile
mkdir -p src/components/community
mkdir -p src/components/space
mkdir -p src/services

# Profile component
cat << 'EOF2' > src/components/profile/ProfileCard.tsx
import React from 'react';

type Props = { username: string; avatarUrl?: string; bio?: string };

const ProfileCard: React.FC<Props> = ({ username, avatarUrl, bio }) => {
  return (
    <div className="border p-3 rounded-lg flex items-center gap-3 bg-white dark:bg-gray-800">
      <img src={avatarUrl || '/assets/icons/default-avatar.png'} alt="avatar" className="w-12 h-12 rounded-full" />
      <div>
        <p className="font-bold">{username}</p>
        <p className="text-sm text-gray-500">{bio || 'No bio yet.'}</p>
      </div>
    </div>
  );
};

export default ProfileCard;
EOF2

# Community component
cat << 'EOF2' > src/components/community/CommunityCard.tsx
import React from 'react';

type Props = { name: string; members: number; description?: string };

const CommunityCard: React.FC<Props> = ({ name, members, description }) => {
  return (
    <div className="border rounded p-3 mb-2 bg-gray-50 dark:bg-gray-800">
      <h3 className="font-bold">{name}</h3>
      <p className="text-sm text-gray-500">{description || 'No description.'}</p>
      <span className="text-xs text-gray-400">{members} members</span>
    </div>
  );
};

export default CommunityCard;
EOF2

# Space component
cat << 'EOF2' > src/components/space/SpaceRoom.tsx
import React from 'react';

type Props = { title: string; host: string; participants?: string[] };

const SpaceRoom: React.FC<Props> = ({ title, host, participants = [] }) => {
  return (
    <div className="border p-3 rounded-lg bg-white dark:bg-gray-800">
      <h3 className="font-bold">{title}</h3>
      <p className="text-sm text-gray-500">Host: {host}</p>
      <p className="text-xs text-gray-400">Participants: {participants.join(', ')}</p>
    </div>
  );
};

export default SpaceRoom;
EOF2

# Services for profiles, communities, spaces
cat << 'EOF2' > src/services/profileService.ts
export const profileService = {
  getProfile: async (username: string) => {
    return { username, bio: 'This is my bio', avatarUrl: '/assets/icons/default-avatar.png' };
  }
};
EOF2

cat << 'EOF2' > src/services/communityService.ts
export const communityService = {
  getCommunities: async () => [
    { name: 'React Devs', members: 120, description: 'All about React' },
    { name: 'Flutter Fans', members: 85, description: 'Mobile dev community' },
  ]
};
EOF2

cat << 'EOF2' > src/services/spaceService.ts
export const spaceService = {
  getSpaces: async () => [
    { title: 'Daily Dev Talk', host: 'Alice', participants: ['Bob','Charlie'] },
    { title: 'TikTok Creators', host: 'Dreez', participants: ['Eve','Frank'] },
  ]
};
EOF2

echo "Profiles, communities, and spaces components/services created!"
