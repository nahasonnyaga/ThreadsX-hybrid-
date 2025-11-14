#!/bin/bash
echo "Creating Thread Service..."
mkdir -p src/services
cat << 'EOL' > src/services/threadService.ts
export const ThreadService = {
  threads: [
    { id: 1, user: 'JaneDoe', avatar: '/assets/images/react.svg', content: 'Just started learning React! #100DaysOfCode', replies: 5, likes: 12, retweets: 3 },
    { id: 2, user: 'JohnSmith', avatar: '/assets/images/react.svg', content: 'TikTok algorithm is wild 🤯', replies: 2, likes: 20, retweets: 5 }
  ],

  async fetchThreads() {
    return this.threads;
  },

  async postThread(thread: any) {
    this.threads.unshift(thread);
    return thread;
  }
};
EOL
echo "Thread Service created!"
