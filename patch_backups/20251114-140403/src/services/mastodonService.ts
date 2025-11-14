// ========== Mastodon Instance URL ==========
export const MASTODON_INSTANCE = "https://mastodon.social";


// ========== Fetch Posts From Mastodon (stubbed) ==========
export async function fetchFederatedPosts() {
  return [
    {
      id: "m1",
      type: "mastodon",
      user: {
        username: "mastouser1",
        avatar: "/assets/images/react.svg"
      },
      content: "Hello from Mastodon!",
      timestamp: new Date().toISOString()
    }
  ];
}


// ========== Fetch User From Mastodon (stubbed) ==========
export async function mastodonFetchUser(username: string) {
  return {
    username,
    avatar: "/assets/images/react.svg",
    bio: "Mastodon bio",
    followers_count: 0,
    following_count: 0,
    statuses_count: 0
  };
}


// ========== Legacy Export (optional compatibility) ==========
export const MastodonService = {
  instance: MASTODON_INSTANCE,
  fetchFederatedPosts,
  mastodonFetchUser
};
