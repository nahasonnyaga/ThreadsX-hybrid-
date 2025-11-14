import React, { useState, useEffect } from "react";

/** Replace with notificationService.fetchNotifications() */
async function fetchNotifications() {
  return [
    { id: 1, type: "like", user: "JaneDoe", message: "liked your post", timestamp: new Date().toISOString() },
    { id: 2, type: "reply", user: "John", message: "replied: Nice!", timestamp: new Date().toISOString() }
  ];
}

export default function Notifications() {
  const [notifications, setNotifications] = useState<any[]>([]);
  useEffect(() => {
    let mounted = true;
    (async () => {
      const data = await fetchNotifications();
      if (mounted) setNotifications(data || []);
    })();
    return () => { mounted = false; };
  }, []);

  return (
    <div className="p-4">
      <h1 className="text-xl font-bold mb-4">Notifications</h1>
      {notifications.length === 0 && <p className="text-gray-400">No notifications</p>}
      {notifications.map((n) => (
        <div key={n.id} className="p-3 border-b">
          <div><strong>{n.user}</strong> — {n.message}</div>
          <div className="text-xs text-gray-400">{new Date(n.timestamp).toLocaleString()}</div>
        </div>
      ))}
    </div>
  );
}
