import axios from 'axios';
export const FederatedContentService = {
    baseUrl: 'https://mastodon.social/api/v1', // replace with your Mastodon instance
    async fetchPosts() {
        try {
            const response = await axios.get(`${this.baseUrl}/timelines/public?limit=20`);
            // Map Mastodon statuses to app format
            return response.data.map((status) => ({
                id: status.id,
                user: status.account.username,
                avatar: status.account.avatar_static,
                content: status.content,
                likes: status.favourites_count,
                retweets: status.reblogs_count,
                replies: status.replies_count || 0,
                federated: true
            }));
        }
        catch (error) {
            console.error('Error fetching federated posts', error);
            return [];
        }
    }
};
