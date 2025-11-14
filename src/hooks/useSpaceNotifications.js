import { useEffect, useState } from 'react';
import { getSpaceNotifications } from '../services/spaceNotificationService';
export const useSpaceNotifications = () => {
    const [notifications, setNotifications] = useState([]);
    useEffect(() => {
        const fetchNotifications = async () => {
            const data = await getSpaceNotifications();
            setNotifications(data.map(d => ({ ...d, type: d.type === "live" ? "live" : "upcoming" })));
        };
        fetchNotifications();
    }, []);
    return notifications;
};
