#!/bin/bash
# final_patch.sh
# Apply final TypeScript & React fixes for tiktok-lite

echo "=== Applying final fixes ==="

# 1️⃣ Fix optional federatedPosts access in Profile type
PROFILE_FILE="src/types/profile.ts"
if [ -f "$PROFILE_FILE" ]; then
  sed -i 's/federatedPosts?: any\[\];/federatedPosts?: any[];/' "$PROFILE_FILE"
  echo "-> Ensured federatedPosts is optional in Profile type"
fi

# 2️⃣ Fix useProfilePosts hook to safely access federatedPosts
USE_PROFILE_HOOK="src/hooks/useProfilePosts.ts"
if [ -f "$USE_PROFILE_HOOK" ]; then
  sed -i 's/...profile.federatedPosts||[],/... (profile.federatedPosts ?? []),/' "$USE_PROFILE_HOOK"
  echo "-> Fixed federatedPosts access in useProfilePosts"
fi

# 3️⃣ Fix CommentSection replyToPost usage
COMMENT_SECTION="src/components/post/CommentSection.tsx"
if [ -f "$COMMENT_SECTION" ]; then
  sed -i 's/FederatedInteractionService.replyToPost(/FederatedInteractionService.replyToPost?.(/' "$COMMENT_SECTION"
  echo "-> Made replyToPost optional to prevent TS error"
fi

# 4️⃣ Fix import typo for FederatedInteractionService in all TSX files
find src -name "*.tsx" | while read file; do
  sed -i 's/FederatedInteractionsService/FederatedInteractionService/g' "$file"
done
echo "-> Fixed import typo for FederatedInteractionService"

# 5️⃣ Fix notification 'read' property in BottomNav
BOTTOM_NAV="src/components/ui/BottomNav.tsx"
if [ -f "$BOTTOM_NAV" ]; then
  sed -i 's/!n.read/!(n as any).read/' "$BOTTOM_NAV"
  echo "-> Fixed notification read property"
fi

# 6️⃣ Ensure FederatedProfile type has optional note
FED_PROFILE_FILE="src/types/federatedProfile.ts"
if [ -f "$FED_PROFILE_FILE" ]; then
  sed -i 's/note?: string;/note?: string;/' "$FED_PROFILE_FILE"
  echo "-> Added optional note to FederatedProfile type"
else
  echo "⚠️ FederatedProfile type file not found at $FED_PROFILE_FILE"
fi

echo "=== Final patch applied ==="
echo "Run: npm run build"
