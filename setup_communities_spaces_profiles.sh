#!/bin/bash
echo "Creating Communities, Spaces, and Profile components..."

mkdir -p src/components/community
mkdir -p src/components/space
mkdir -p src/components/profile

# CommunityCard.tsx
cat << 'EOL' > src/components/community/CommunityCard.tsx
import React from 'react';

export function CommunityCard({ community }: any) {
  return (
    <div style={{ border: '1px solid #ccc', padding: '10px', borderRadius: '10px', marginBottom: '10px' }}>
      <h3>{community.name}</h3>
      <p>{community.description}</p>
      <small>{community.members} members</small>
    </div>
  );
}
EOL

# SpaceCard.tsx
cat << 'EOL' > src/components/space/SpaceCard.tsx
import React from 'react';

export function SpaceCard({ space }: any) {
  return (
    <div style={{ border: '1px solid #ddd', padding: '10px', borderRadius: '10px', marginBottom: '10px' }}>
      <h4>{space.title}</h4>
      <p>{space.description}</p>
      <small>Hosted by {space.host} • {space.participants} participants</small>
    </div>
  );
}
EOL

# SpaceRoom.tsx
cat << 'EOL' > src/components/space/SpaceRoom.tsx
import React from 'react';

export function SpaceRoom({ space }: any) {
  return (
    <div style={{ padding: '10px', border: '1px solid #ccc', borderRadius: '10px', marginBottom: '10px' }}>
      <h4>{space.title}</h4>
      <p>Live Now • {space.participants} participants</p>
    </div>
  );
}
EOL

# SpaceSchedule.tsx
cat << 'EOL' > src/components/space/SpaceSchedule.tsx
import React from 'react';

export function SpaceSchedule({ schedule }: any) {
  return (
    <div style={{ padding: '5px 10px', borderBottom: '1px solid #eee' }}>
      <strong>{schedule.title}</strong> at {schedule.time}
    </div>
  );
}
EOL

# ProfileCard.tsx
cat << 'EOL' > src/components/profile/ProfileCard.tsx
import React from 'react';

export function ProfileCard({ profile }: any) {
  return (
    <div style={{ border: '1px solid #ccc', borderRadius: '10px', padding: '10px', marginBottom: '10px' }}>
      <img src={profile.avatar} alt="avatar" style={{ width: '50px', borderRadius: '50%' }} />
      <h4>{profile.username}</h4>
      <p>{profile.bio}</p>
      <small>{profile.followers} Followers • {profile.following} Following • {profile.posts} Posts</small>
    </div>
  );
}
EOL

echo "Communities, Spaces, and Profile components created!"
