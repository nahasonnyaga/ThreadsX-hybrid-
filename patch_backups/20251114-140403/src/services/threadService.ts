export const ThreadService = {
  threads: [
    {
      id: 1,
      user: 'JaneDoe',
      avatar: '/assets/images/react.svg',
      content: 'Just started learning React! #100DaysOfCode',
      replies: [
        { id: 1, user: 'JohnSmith', content: 'Good luck!' },
        { id: 2, user: 'Alice', content: 'You got this!' }
      ],
      likes: 12,
      retweets: 3
    },
    {
      id: 2,
      user: 'JohnSmith',
      avatar: '/assets/images/react.svg',
      content: 'TikTok algorithm is wild 🤯',
      replies: [],
      likes: 20,
      retweets: 5
    }
  ],

  async fetchThreads() {
    return this.threads;
  },

  async postThread(thread: any) {
    this.threads.unshift(thread);
    return thread;
  }
};
