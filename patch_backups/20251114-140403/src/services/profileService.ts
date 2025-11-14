export const ProfileService = {
  async fetchProfile(username: string) {
    return { username, avatar: '/assets/images/react.svg', bio: 'bio', followers: 0, following: 0, posts: 0, feed: [] };
  }
};
export default ProfileService;
