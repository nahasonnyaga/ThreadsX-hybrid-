#!/bin/bash
# final_type_fixes.sh
# Apply final TypeScript type fixes for tiktok-lite

echo "=== Applying final TypeScript type fixes ==="

# 1️⃣ Ensure federatedPosts is optional in Profile type
PROFILE_FILE="src/types/profile.ts"
if grep -q "federatedPosts" "$PROFILE_FILE"; then
    sed -i 's/federatedPosts: any\[\];/federatedPosts?: any[];/' "$PROFILE_FILE"
else
    # Add optional federatedPosts if missing
    sed -i '/feed: any\[\];/a \  federatedPosts?: any[];' "$PROFILE_FILE"
fi
echo "-> federatedPosts in Profile type fixed"

# 2️⃣ Ensure note is optional in FederatedProfile type
FED_PROFILE_FILE="src/types/federatedProfile.ts"
if [ -f "$FED_PROFILE_FILE" ]; then
    if ! grep -q "note" "$FED_PROFILE_FILE"; then
        sed -i '/statuses_count: number;/a \  note?: string;' "$FED_PROFILE_FILE"
    fi
    echo "-> note in FederatedProfile type fixed"
else
    echo "⚠️ FederatedProfile type file not found at $FED_PROFILE_FILE"
fi

echo "=== Final TypeScript type fixes applied ==="
echo "Run: npm run build"
