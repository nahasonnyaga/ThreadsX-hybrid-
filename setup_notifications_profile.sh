#!/bin/bash
echo "Creating Notifications and Profile pages..."

mkdir -p src/components/notifications
mkdir -p src/components/profile

# NotificationCard.tsx
cat << 'EOL' > src/components/notifications/NotificationCard.tsx
import React from 'react';

export function NotificationCard({ notification }: any) {
  return (
    <div style={{ borderBottom: '1px solid #ccc', padding: '10px' }}>
      <strong>{notification.user}</strong> {notification.action} {notification.target}
    </div>
  );
}
EOL

# Notifications.tsx
cat << 'EOL' > src/pages/Notifications.tsx
import React from 'react';
import { NotificationCard } from '../components/notifications/NotificationCard';
import { NotificationService } from '../services/notificationService';

export default function Notifications() {
  const notifications = NotificationService.fetchNotifications();

  return (
    <div style={{ maxWidth: '600px', margin: '0 auto', padding: '10px' }}>
      <h1 style={{ textAlign: 'center', margin: '20px 0' }}>Notifications</h1>
      {notifications.map((notif, index) => (
        <NotificationCard key={index} notification={notif} />
      ))}
    </div>
  );
}
EOL

# ProfileCard.tsx
cat << 'EOL' > src/components/profile/ProfileCard.tsx
import React from 'react';

export function ProfileCard({ profile }: any) {
  return (
    <div style={{ border: '1px solid #ccc', borderRadius: '10px', padding: '15px', marginBottom: '15px' }}>
      <img src={profile.avatar} alt="avatar" style={{ width: '50px', borderRadius: '50%' }} />
      <h2>{profile.username}</h2>
      <p>{profile.bio}</p>
      <p>Followers: {profile.followers} | Following: {profile.following} | Posts: {profile.posts}</p>
    </div>
  );
}
EOL

# Profile.tsx
cat << 'EOL' > src/pages/Profile.tsx
import React from 'react';
import { ProfileCard } from '../components/profile/ProfileCard';
import { ProfileService } from '../services/profileService';

export default function Profile() {
  const profile = ProfileService.fetchProfile('JaneDoe');

  return (
    <div style={{ maxWidth: '600px', margin: '0 auto', padding: '10px' }}>
      <h1 style={{ textAlign: 'center', margin: '20px 0' }}>Profile</h1>
      <ProfileCard profile={profile} />
    </div>
  );
}
EOL

echo "Notifications and Profile pages created!"
