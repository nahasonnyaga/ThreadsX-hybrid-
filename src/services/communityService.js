export const CommunityService = {
    communities: [
        { id: 1, name: 'React Devs', members: 120, posts: 45 },
        { id: 2, name: 'TikTok Creators', members: 200, posts: 89 }
    ],
    async fetchCommunities() {
        return this.communities;
    },
    async joinCommunity(communityId, username) {
        const community = this.communities.find(c => c.id === communityId);
        if (community)
            community.members += 1;
        return community;
    }
};
