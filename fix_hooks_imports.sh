#!/bin/bash
# fix_hooks_imports.sh

echo "=== Adding missing React imports ==="

find src -name "*.tsx" | while read file; do
    # If the file uses useState or useEffect but does not import it
    if grep -q "useState" "$file" || grep -q "useEffect" "$file"; then
        if ! grep -q "import.*useState" "$file"; then
            # Add React import at the top
            sed -i '1s/^/import React, { useState, useEffect } from "react";\n/' "$file"
            echo "-> React hooks added to $file"
        fi
    fi
done

echo "=== React hooks import patch complete ==="
