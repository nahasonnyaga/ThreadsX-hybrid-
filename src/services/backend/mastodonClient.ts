import Mastodon from 'mastodon-api';

export const MastodonClient = new Mastodon({
  access_token: 'YOUR_MASTODON_ACCESS_TOKEN',
  api_url: 'https://mastodon.social/api/v1/' // replace with your instance if different
});
