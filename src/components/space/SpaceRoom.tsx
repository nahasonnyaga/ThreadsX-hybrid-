import React from 'react';

export function SpaceRoom({ room }: any) {
  return (
    <div style={{ border: '1px solid #ccc', borderRadius: '10px', padding: '10px', margin: '10px 0' }}>
      <h4>{room.title}</h4>
      <p>Speaker: {room.speaker}</p>
      <p>Listeners: {room.listeners}</p>
    </div>
  );
}
