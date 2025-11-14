import React from 'react';
export function NotificationCard({ notification }) {
    return (<div style={{ borderBottom: '1px solid #ccc', padding: '10px' }}>
      <strong>{notification.user}</strong> {notification.action} {notification.target}
    </div>);
}
