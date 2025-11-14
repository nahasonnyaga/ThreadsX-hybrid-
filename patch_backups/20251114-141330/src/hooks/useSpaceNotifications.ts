import { useEffect, useState } from 'react';
import { getSpaceNotifications } from '../services/spaceNotificationService';

interface SpaceNotification {
  id: number;
  message: string;
  type: 'live' | 'upcoming';
  spaceId: number;
}

export const useSpaceNotifications = () => {
  const [notifications, setNotifications] = useState<SpaceNotification[]>([]);

  useEffect(() => {
    const fetchNotifications = async () => {
      const data = await getSpaceNotifications();
      setNotifications(data);
    };
    fetchNotifications();
  }, []);

  return notifications;
};
