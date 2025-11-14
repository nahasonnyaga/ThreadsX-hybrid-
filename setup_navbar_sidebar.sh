#!/bin/bash
echo "Creating Navbar and Sidebar components..."

mkdir -p src/components/ui

# Navbar.tsx
cat << 'EOL' > src/components/ui/Navbar.tsx
import React from 'react';

export function Navbar() {
  return (
    <nav style={{
      display: 'flex', justifyContent: 'space-between',
      padding: '10px', backgroundColor: '#1DA1F2', color: 'white'
    }}>
      <h2>🌐 AppLogo</h2>
      <div>
        <button style={{ marginRight: '10px' }}>Home</button>
        <button style={{ marginRight: '10px' }}>Notifications</button>
        <button style={{ marginRight: '10px' }}>Spaces</button>
        <button>Profile</button>
      </div>
    </nav>
  );
}
EOL

# Sidebar.tsx
cat << 'EOL' > src/components/ui/Sidebar.tsx
import React from 'react';

export function Sidebar({ sections = [] }: any) {
  return (
    <aside style={{
      width: '220px', borderRight: '1px solid gray',
      padding: '10px', height: '100vh', position: 'fixed'
    }}>
      <h3>Navigation</h3>
      <ul>
        {sections.map((sec: string, idx: number) => <li key={idx}>{sec}</li>)}
      </ul>
    </aside>
  );
}
EOL

echo "Navbar and Sidebar components created!"
