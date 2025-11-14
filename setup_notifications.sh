#!/bin/bash
echo "Creating Notifications Page..."

# Notifications.tsx
cat << 'EOL' > src/pages/Notifications.tsx
import React from 'react';
import { Sidebar } from '../components/ui/Sidebar';
import { Navbar } from '../components/ui/Navbar';
import { NotificationCard } from '../components/feed/NotificationCard';

export function Notifications() {
  const notifications = [
    { id: 1, content: 'Jane liked your post' },
    { id: 2, content: 'John started following you' }
  ];

  return (
    <div style={{ display: 'flex' }}>
      <Sidebar />
      <div style={{ flex: 1, padding: '20px' }}>
        <Navbar />
        <h1>Notifications</h1>
        {notifications.map(n => <NotificationCard key={n.id} content={n.content} />)}
      </div>
    </div>
  );
}
EOL

echo "Notifications Page created!"
