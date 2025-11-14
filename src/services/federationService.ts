import axios from 'axios';

const MASTODON_INSTANCE = 'https://mastodon.social'; // replace with your instance
const BEARER_TOKEN = 'YOUR_ACCESS_TOKEN'; // replace with your token

export const FederationService = {
  async fetchHomeTimeline(limit = 20) {
    const res = await axios.get(`${MASTODON_INSTANCE}/api/v1/timelines/home?limit=${limit}`, {
      headers: { Authorization: `Bearer ${BEARER_TOKEN}` }
    });
    return res.data;
  },

  async fetchUserTimeline(username: string, limit = 20) {
    const res = await axios.get(`${MASTODON_INSTANCE}/api/v1/accounts/${username}/statuses?limit=${limit}`, {
      headers: { Authorization: `Bearer ${BEARER_TOKEN}` }
    });
    return res.data;
  },

  async postToMastodon(status: string) {
    const res = await axios.post(`${MASTODON_INSTANCE}/api/v1/statuses`, {
      status
    }, {
      headers: { Authorization: `Bearer ${BEARER_TOKEN}` }
    });
    return res.data;
  },

  async likeToMastodon(statusId: string) {
    const res = await axios.post(`${MASTODON_INSTANCE}/api/v1/statuses/${statusId}/favourite`, {}, {
      headers: { Authorization: `Bearer ${BEARER_TOKEN}` }
    });
    return res.data;
  }
};
