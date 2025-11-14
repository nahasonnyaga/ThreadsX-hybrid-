import React from 'react';

export function CommunityCard({ name, description, members }: any) {
  return (
    <div style={{ border: '1px solid #888', padding: '10px', margin: '10px 0' }}>
      <h4>{name}</h4>
      <p>{description}</p>
      <p>Members: {members}</p>
    </div>
  );
}
