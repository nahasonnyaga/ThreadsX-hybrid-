#!/bin/bash
echo "=== Applying full project TypeScript & React hook fixes ==="

# 1️⃣ Add missing React hooks imports to all TSX files
find src -name "*.tsx" | while read file; do
    if grep -q "useState" "$file" || grep -q "useEffect" "$file"; then
        if ! grep -q "import.*useState" "$file"; then
            sed -i '1s/^/import React, { useState, useEffect } from "react";\n/' "$file"
            echo "-> React hooks added to $file"
        fi
    fi
done

# 2️⃣ Fix FederatedInteractionsService replyToPost
sed -i '/boostPost:/a \  replyToPost: async (postId: string | number, content: string) => { if(!this.baseUrl || !this.token) return; return fetch(`${this.baseUrl}/posts/${postId}/reply`, { method: "POST", headers: { "Authorization": `Bearer ${this.token}`, "Content-Type": "application/json" }, body: JSON.stringify({ content }) }).then(res => res.json()); },' src/services/federatedInteractionsService.ts

# 3️⃣ Add optional 'read' to notifications
sed -i '/type Notification = {/a \  read?: boolean;' src/components/ui/BottomNav.tsx

# 4️⃣ Add optional federatedPosts to profile
sed -i '/type Profile = {/a \  federatedPosts?: any[];' src/hooks/useProfilePosts.ts

# 5️⃣ Fix SpaceCard usage to pass whole space
sed -i 's/title={space.title}/space={space}/' src/pages/Space.tsx
sed -i 's/host={space.host}//' src/pages/Space.tsx
sed -i 's/participants={space.participants}//' src/pages/Space.tsx
sed -i 's/status={space.status}//' src/pages/Space.tsx

# 6️⃣ Fix federatedProfile fallback for missing note/content
sed -i 's/federatedProfile?.note ?? federatedProfile?.content ?? federatedProfile?.bio ?? localProfile?.bio/federatedProfile?.note ?? federatedProfile?.bio ?? localProfile?.bio/' src/services/federatedProfileService.ts

echo "=== Mega fix applied. Run 'npm run build' now ==="
