#!/bin/bash
# mega_types_fix.sh
# Applies all TypeScript type & React hook fixes for tiktok-lite

echo "=== Applying full TypeScript & React fixes ==="

# 1️⃣ Fix FederatedInteractionService
cat > src/services/federatedInteractionsService.ts << 'EOF'
type FederatedInteractionServiceType = {
  baseUrl: string;
  token: string;
  likePost(postId: string): Promise<any>;
  boostPost(postId: string): Promise<any>;
  replyToPost(postId: string, content: string): Promise<any>;
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
};
EOF

echo "-> FederatedInteractionService fixed"

# 2️⃣ Fix Notification type
cat > src/types/notification.ts << 'EOF'
export type Notification = {
  id: number;
  type: string;
  user: string;
  message: string;
  timestamp: string;
  read?: boolean;
};
EOF

echo "-> Notification type fixed"

# 3️⃣ Fix Profile type (useProfilePosts)
cat > src/types/profile.ts << 'EOF'
export type Profile = {
  username: string;
  avatar: string;
  bio: string;
  followers: number;
  following: number;
  posts: number;
  feed: any[];
  federatedPosts?: any[];
};
EOF

echo "-> Profile type fixed"

# 4️⃣ Fix SpaceCard props usage (pass space object)
echo "=== Make sure to pass the full space object in SpaceCard components ==="
echo "<SpaceCard key={space.id} space={space} />"

# 5️⃣ Fix federatedProfile bio fallback
sed -i 's/federatedProfile\?.note ?? federatedProfile\?.content ?? federatedProfile\?.bio ?? localProfile\?.bio/federatedProfile?.note ?? federatedProfile?.bio ?? localProfile?.bio/' src/services/federatedProfileService.ts
echo "-> federatedProfile bio fallback fixed"

echo "=== Mega TypeScript & React fixes applied ==="
echo "Run: npm run build"
