#!/bin/bash
echo "Creating Navbar & Sidebar Components..."
mkdir -p src/components/ui

# Navbar.tsx
cat << 'EOL' > src/components/ui/Navbar.tsx
import React from 'react';
export function Navbar() {
  return (
    <nav style={{ padding: '10px', backgroundColor: '#1DA1F2', color: '#fff' }}>
      <h2>Flutter-TikTok</h2>
    </nav>
  );
}
EOL

# Sidebar.tsx
cat << 'EOL' > src/components/ui/Sidebar.tsx
import React from 'react';
export function Sidebar() {
  return (
    <aside style={{ width: '200px', borderRight: '1px solid #ccc', padding: '10px' }}>
      <ul>
        <li>Home</li>
        <li>Trends</li>
        <li>Spaces</li>
        <li>Communities</li>
        <li>Profile</li>
      </ul>
    </aside>
  );
}
EOL

echo "Navbar & Sidebar created!"
