import React from 'react';

export function Sidebar() {
  return (
    <aside style={{ width: '220px', padding: '20px', borderRight: '1px solid #ccc', height: '100vh', background: '#f9f9f9' }}>
      <ul style={{ listStyle: 'none', padding: 0 }}>
        <li style={{ margin: '10px 0' }}>Home</li>
        <li style={{ margin: '10px 0' }}>Explore</li>
        <li style={{ margin: '10px 0' }}>Notifications</li>
        <li style={{ margin: '10px 0' }}>Messages</li>
        <li style={{ margin: '10px 0' }}>Profile</li>
      </ul>
    </aside>
  );
}
