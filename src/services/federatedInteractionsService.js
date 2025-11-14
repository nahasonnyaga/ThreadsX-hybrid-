export const FederatedInteractionService = {
    baseUrl: "https://api.example.com",
    token: "",
    likePost: async (postId) => {
        return fetch(`${FederatedInteractionService.baseUrl}/posts/${postId}/like`, {
            method: "POST",
            headers: { "Authorization": `Bearer ${FederatedInteractionService.token}` },
        }).then(res => res.json());
    },
    boostPost: async (postId) => {
        return fetch(`${FederatedInteractionService.baseUrl}/posts/${postId}/boost`, {
            method: "POST",
            headers: { "Authorization": `Bearer ${FederatedInteractionService.token}` },
        }).then(res => res.json());
    },
    // optional stubs
    replyToPost: async (postId, content) => {
        if (!FederatedInteractionService.baseUrl || !FederatedInteractionService.token)
            return;
        return fetch(`${FederatedInteractionService.baseUrl}/posts/${postId}/reply`, {
            method: "POST",
            headers: {
                "Authorization": `Bearer ${FederatedInteractionService.token}`,
                "Content-Type": "application/json",
            },
            body: JSON.stringify({ content }),
        }).then(res => res.json());
    },
    toggleFollow: async (userHandle, follow) => {
        if (!FederatedInteractionService.baseUrl || !FederatedInteractionService.token)
            return false;
        return fetch(`${FederatedInteractionService.baseUrl}/users/${userHandle}/${follow ? 'follow' : 'unfollow'}`, {
            method: "POST",
            headers: {
                "Authorization": `Bearer ${FederatedInteractionService.token}`,
            },
        }).then(res => res.ok);
    },
};
