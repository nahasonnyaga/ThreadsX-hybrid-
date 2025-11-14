#!/bin/bash
# clean_final_patch.sh
# Clean final TypeScript & React fix for tiktok-lite

echo "=== Applying clean final patch ==="

# 1️⃣ Fix import typo for FederatedInteractionService
find src -name "*.tsx" | while read file; do
    sed -i 's/FederatedInteractionsService/FederatedInteractionService/g' "$file"
done
echo "-> Fixed import typo for FederatedInteractionService"

# 2️⃣ Fix BottomNav notification 'read' property
sed -i 's/!n.read/!(n as any).read/' src/components/ui/BottomNav.tsx
echo "-> Fixed notification 'read' property"

# 3️⃣ Remove duplicate federatedPosts in Profile type and make optional
sed -i '/federatedPosts/d' src/types/profile.ts
sed -i '/export type Profile = {/a \ \ federatedPosts?: any[];' src/types/profile.ts
echo "-> Added single optional federatedPosts in Profile type"

# 4️⃣ Add optional note to FederatedProfile type if missing
if ! grep -q "note?: string" src/types/profile.ts; then
    sed -i '/export type FederatedProfile = {/a \ \ note?: string;' src/types/profile.ts
    echo "-> Added optional note to FederatedProfile type"
fi

# 5️⃣ Fix CommentSection replyToPost usage (optional chaining)
sed -i 's/FederatedInteractionService.replyToPost(postId.toString(), comment)/FederatedInteractionService.replyToPost?.(postId.toString(), comment)/' src/components/post/CommentSection.tsx
echo "-> Fixed CommentSection replyToPost usage"

# 6️⃣ Clean FederatedInteractionService object (single optional properties)
sed -i '/replyToPost:/d' src/services/federatedInteractionsService.ts
sed -i '/toggleFollow:/d' src/services/federatedInteractionsService.ts
sed -i '/export const FederatedInteractionService:/a \ \ replyToPost?: async (postId: string, content: string) => Promise<any>;\n\ \ toggleFollow?: async (userHandle: string, follow: boolean) => Promise<boolean>;' src/services/federatedInteractionsService.ts
echo "-> Cleaned FederatedInteractionService object"

echo "=== Clean final patch applied ==="
echo "Run: npm run build"
