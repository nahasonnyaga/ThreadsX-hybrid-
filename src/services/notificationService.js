export const NotificationService = {
    async fetchNotifications() {
        // Placeholder notifications
        return [
            { id: 1, type: 'like', user: 'Alice', message: 'liked your post', timestamp: '2m ago' },
            { id: 2, type: 'reply', user: 'Bob', message: 'replied to your thread', timestamp: '10m ago' },
            { id: 3, type: 'mention', user: 'Charlie', message: 'mentioned you in a post', timestamp: '1h ago' },
            { id: 4, type: 'community', user: 'David', message: 'posted in a community you follow', timestamp: '3h ago' }
        ];
    }
};
