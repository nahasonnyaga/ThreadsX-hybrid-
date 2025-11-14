#!/bin/bash
echo "=== Applying all remaining TypeScript fixes ==="

# 1️⃣ Fix FederatedInteractionsService replyToPost
sed -i '/boostPost:/a \  replyToPost: async (postId: string | number, content: string) => { if(!this.baseUrl || !this.token) return; return fetch(`${this.baseUrl}/posts/${postId}/reply`, { method: "POST", headers: { "Authorization": `Bearer ${this.token}`, "Content-Type": "application/json" }, body: JSON.stringify({ content }) }).then(res => res.json()); },' src/services/federatedInteractionsService.ts

# 2️⃣ Add read property to notifications
sed -i '/type Notification = {/a \  read?: boolean;' src/components/ui/BottomNav.tsx

# 3️⃣ Add optional federatedPosts to profile
sed -i '/type Profile = {/a \  federatedPosts?: any[];' src/hooks/useProfilePosts.ts

# 4️⃣ Fix SpaceCard props to pass whole space object
sed -i 's/title={space.title}/space={space}/' src/pages/Space.tsx
sed -i 's/host={space.host}//' src/pages/Space.tsx
sed -i 's/participants={space.participants}//' src/pages/Space.tsx
sed -i 's/status={space.status}//' src/pages/Space.tsx

# 5️⃣ Fix federatedProfile fallback
sed -i 's/federatedProfile?.note ?? federatedProfile?.content ?? federatedProfile?.bio ?? localProfile?.bio/federatedProfile?.note ?? federatedProfile?.bio ?? localProfile?.bio/' src/services/federatedProfileService.ts

echo "=== All TypeScript fixes applied ==="
