import { MastodonService } from './mastodonService';

export const UnifiedProfileService = {
  async fetchProfile(username: string) {
    try {
      // Fetch profile from Mastodon
      const res = await fetch(`${MastodonService.instance}/api/v1/accounts/search?q=${username}&limit=1`);
      const data = await res.json();

      return {
        username,
        avatar: data[0]?.avatar || '/assets/images/react.svg',
        bio: data[0]?.note || 'This is a user bio',
        followers: data[0]?.followers_count || 0,
        following: data[0]?.following_count || 0,
        posts: data[0]?.statuses_count || 0
      };
    } catch (err) {
      console.error(err);
      return {
        username,
        avatar: '/assets/images/react.svg',
        bio: 'This is a user bio',
        followers: 0,
        following: 0,
        posts: 0
      };
    }
  }
};
