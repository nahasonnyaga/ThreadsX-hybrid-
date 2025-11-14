#!/bin/bash
echo "Creating Profile Page..."

# Profile.tsx
cat << 'EOL' > src/pages/Profile.tsx
import React, { useEffect, useState } from 'react';
import { ProfileService } from '../services/profileService';
import { Sidebar } from '../components/ui/Sidebar';
import { Navbar } from '../components/ui/Navbar';

export function Profile({ username = 'JaneDoe' }) {
  const [profile, setProfile] = useState<any>(null);

  useEffect(() => {
    ProfileService.fetchProfile(username).then(setProfile);
  }, [username]);

  if (!profile) return <div>Loading...</div>;

  return (
    <div style={{ display: 'flex' }}>
      <Sidebar />
      <div style={{ flex: 1, padding: '20px' }}>
        <Navbar />
        <h1>{profile.username}</h1>
        <img src={profile.avatar} alt="avatar" width={80} />
        <p>{profile.bio}</p>
        <p>Followers: {profile.followers} | Following: {profile.following}</p>
        <p>Posts: {profile.posts}</p>
      </div>
    </div>
  );
}
EOL

echo "Profile Page created!"
