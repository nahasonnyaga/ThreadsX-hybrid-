#!/bin/bash
echo "=== Applying TypeScript type fixes ==="

# 1️⃣ Add replyToPost to FederatedInteractionsService
sed -i '/boostPost:/a \  replyToPost: async (postId: string, content: string) => { return fetch(`${this.baseUrl}/posts/${postId}/reply`, { method: "POST", headers: { "Authorization": `Bearer ${this.token}`, "Content-Type": "application/json" }, body: JSON.stringify({ content }) }).then(res => res.json()); },' src/services/federatedInteractionsService.ts

# 2️⃣ Add 'read' to Notification type
sed -i '/type Notification = {/a \  read: boolean;' src/components/ui/BottomNav.tsx

# 3️⃣ Add federatedPosts optional property to Profile type
sed -i '/type Profile = {/a \  federatedPosts?: any[];' src/hooks/useProfilePosts.ts

# 4️⃣ Fix SpaceCard props by passing whole object
sed -i 's/title={space.title}/space={space}/' src/pages/Space.tsx

# 5️⃣ Fix federatedProfile note/content fallback
sed -i 's/federatedProfile?.note || federatedProfile?.content || localProfile?.bio/federatedProfile?.note ?? federatedProfile?.content ?? federatedProfile?.bio ?? localProfile?.bio/' src/services/federatedProfileService.ts

echo "=== TypeScript type fixes applied ==="
