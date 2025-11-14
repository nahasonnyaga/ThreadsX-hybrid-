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
