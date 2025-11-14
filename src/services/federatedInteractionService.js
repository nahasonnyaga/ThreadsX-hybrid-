import axios from 'axios';
export const FederatedInteractionService = {
    baseUrl: 'https://mastodon.social/api/v1', // replace with your Mastodon instance
    token: '', // add your Mastodon access token
    async likePost(postId) {
        try {
            const response = await axios.post(`${this.baseUrl}/statuses/${postId}/favourite`, {}, { headers: { Authorization: `Bearer ${this.token}` } });
            return response.data;
        }
        catch (error) {
            console.error('Error liking federated post', error);
            return null;
        }
    },
    async boostPost(postId) {
        try {
            const response = await axios.post(`${this.baseUrl}/statuses/${postId}/reblog`, {}, { headers: { Authorization: `Bearer ${this.token}` } });
            return response.data;
        }
        catch (error) {
            console.error('Error boosting federated post', error);
            return null;
        }
    }
};
