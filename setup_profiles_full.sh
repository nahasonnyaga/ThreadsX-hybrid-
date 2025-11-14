#!/bin/bash
echo "Creating full X-style Profile components..."

# Profile Header
cat << 'EOL' > src/components/profile/ProfileHeader.tsx
import React from 'react';
import { ProfileService } from '../../services/profileService';
import './ProfileHeader.css';

export const ProfileHeader = ({ username }: { username: string }) => {
  const [profile, setProfile] = React.useState<any>(null);

  React.useEffect(() => {
    ProfileService.fetchProfile(username).then(setProfile);
  }, [username]);

  if (!profile) return <div>Loading...</div>;

  return (
    <div className="profile-header">
      <img src={profile.avatar} alt={profile.username} className="avatar" />
      <h2>{profile.username}</h2>
      <p>{profile.bio}</p>
      <div className="follow-stats">
        <span><strong>{profile.followers}</strong> Followers</span>
        <span><strong>{profile.following}</strong> Following</span>
      </div>
      <button>{profile.isFollowing ? 'Following' : 'Follow'}</button>
    </div>
  );
};
EOL

# Profile Tabs
cat << 'EOL' > src/components/profile/ProfileTabs.tsx
import React, { useState } from 'react';
import './ProfileTabs.css';

export const ProfileTabs = ({ tabs, onSelect }: { tabs: string[], onSelect: (tab: string) => void }) => {
  const [active, setActive] = useState(tabs[0]);

  const handleClick = (tab: string) => {
    setActive(tab);
    onSelect(tab);
  };

  return (
    <div className="profile-tabs">
      {tabs.map(tab => (
        <button
          key={tab}
          className={tab === active ? 'active' : ''}
          onClick={() => handleClick(tab)}
        >
          {tab}
        </button>
      ))}
    </div>
  );
};
EOL

# Update Profile Page
cat << 'EOL' > src/pages/Profile.tsx
import React, { useState } from 'react';
import { ProfileHeader } from '../components/profile/ProfileHeader';
import { ProfileTabs } from '../components/profile/ProfileTabs';
import { PostCard } from '../components/feed/PostCard';
import { postService } from '../services/postService';

export const ProfilePage = ({ username }: { username: string }) => {
  const tabs = ['Tweets', 'Replies', 'Media', 'Likes'];
  const [selectedTab, setSelectedTab] = useState(tabs[0]);
  const [posts, setPosts] = useState<any[]>([]);

  React.useEffect(() => {
    postService.fetchPostsByUser(username).then(setPosts);
  }, [username, selectedTab]);

  return (
    <div className="profile-page">
      <ProfileHeader username={username} />
      <ProfileTabs tabs={tabs} onSelect={setSelectedTab} />
      <div className="posts-feed">
        {posts.map(post => <PostCard key={post.id} post={post} />)}
      </div>
    </div>
  );
};
EOL

echo "Full X-style Profile components created!"
