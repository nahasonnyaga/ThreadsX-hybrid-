#!/bin/bash
# final_types_fix.sh
# Apply final TypeScript fixes for tiktok-lite

echo "=== Applying final TypeScript fixes ==="

# 1️⃣ Force replyToPost optional usage in CommentSection
find src/components/post -name "CommentSection.tsx" | while read file; do
    sed -i 's/FederatedInteractionService.replyToPost?.(/(FederatedInteractionService as any).replyToPost?.(/g' "$file"
done
echo "-> Fixed replyToPost usage in CommentSection"

# 2️⃣ Ensure federatedPosts is optional in Profile type
PROFILE_TYPE_FILE="src/types/profile.ts"
if ! grep -q "federatedPosts?: any\[\]" "$PROFILE_TYPE_FILE"; then
    sed -i '/feed: any\[\];/a \  federatedPosts?: any[];' "$PROFILE_TYPE_FILE"
fi
echo "-> Made federatedPosts optional in Profile type"

# 3️⃣ Ensure note is optional in FederatedProfile type
FED_PROFILE_FILE="src/types/federatedProfile.ts"
if ! grep -q "note?: string" "$FED_PROFILE_FILE"; then
    sed -i '/statuses_count: number;/a \  note?: string;' "$FED_PROFILE_FILE"
fi
echo "-> Made note optional in FederatedProfile type"

echo "=== Final TypeScript fixes applied ==="
echo "Run: npm run build"
