export const FederatedInteractionsService = {
  likePost: async (postId: string | number) => { /* ... */ },
  boostPost: async (postId: string | number) => { /* ... */ },
  replyToPost: async (postId: string | number, content: string) => { /* ... */ },
  toggleFollow: async (userHandle: string, currentStatus: boolean) => { /* ... */ },
};
