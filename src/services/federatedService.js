import axios from 'axios';
export const FederatedService = {
    async fetchFederatedPosts(instanceUrl = 'https://mastodon.social') {
        try {
            const response = await axios.get(`${instanceUrl}/api/v1/timelines/home`);
            // Map Mastodon posts to your app's format
            return response.data.map((post) => ({
                id: post.id,
                user: post.account.username,
                avatar: post.account.avatar,
                content: post.content,
                likes: post.favourites_count,
                retweets: post.reblogs_count,
                replies: post.replies_count || 0,
                federated: true
            }));
        }
        catch (error) {
            console.error('Error fetching federated posts:', error);
            return [];
        }
    }
};
