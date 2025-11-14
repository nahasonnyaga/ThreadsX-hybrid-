type FederatedInteractionServiceType = {
  baseUrl: string;
  token: string;
  likePost(postId: string): Promise<any>;
  boostPost(postId: string): Promise<any>;
  replyToPost?(postId: string, content: string): Promise<any>;
  toggleFollow?(userHandle: string, follow: boolean): Promise<boolean>;
};

export const FederatedInteractionService: FederatedInteractionServiceType = {
  baseUrl: "https://api.example.com",
  token: "",

  likePost: async (postId: string) => {
    return fetch(`${FederatedInteractionService.baseUrl}/posts/${postId}/like`, {
      method: "POST",
      headers: { "Authorization": `Bearer ${FederatedInteractionService.token}` },
    }).then(res => res.json());
  },

  boostPost: async (postId: string) => {
    return fetch(`${FederatedInteractionService.baseUrl}/posts/${postId}/boost`, {
      method: "POST",
      headers: { "Authorization": `Bearer ${FederatedInteractionService.token}` },
    }).then(res => res.json());
  },

  // optional stubs
  replyToPost: async (postId: string, content: string) => {
    if (!FederatedInteractionService.baseUrl || !FederatedInteractionService.token) return;
    return fetch(`${FederatedInteractionService.baseUrl}/posts/${postId}/reply`, {
      method: "POST",
      headers: {
        "Authorization": `Bearer ${FederatedInteractionService.token}`,
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ content }),
    }).then(res => res.json());
  },

  toggleFollow: async (userHandle: string, follow: boolean) => {
    if (!FederatedInteractionService.baseUrl || !FederatedInteractionService.token) return false;
    return fetch(`${FederatedInteractionService.baseUrl}/users/${userHandle}/${follow ? 'follow' : 'unfollow'}`, {
      method: "POST",
      headers: {
        "Authorization": `Bearer ${FederatedInteractionService.token}`,
      },
    }).then(res => res.ok);
  },
};
