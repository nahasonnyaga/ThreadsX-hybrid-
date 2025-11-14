#!/bin/bash
echo "Creating Navbar, Sidebar, and UI components..."

mkdir -p src/components/ui

# Navbar.tsx
cat << 'EOL' > src/components/ui/Navbar.tsx
import React from 'react';

export function Navbar() {
  return (
    <nav style={{ display: 'flex', justifyContent: 'space-between', padding: '10px 20px', background: '#1DA1F2', color: '#fff' }}>
      <h2>MyApp</h2>
      <div>
        <button style={{ marginRight: '10px' }}>Home</button>
        <button>Explore</button>
      </div>
    </nav>
  );
}
EOL

# Sidebar.tsx
cat << 'EOL' > src/components/ui/Sidebar.tsx
import React from 'react';

export function Sidebar() {
  return (
    <aside style={{ width: '220px', padding: '20px', borderRight: '1px solid #ccc', height: '100vh', background: '#f9f9f9' }}>
      <ul style={{ listStyle: 'none', padding: 0 }}>
        <li style={{ margin: '10px 0' }}>Home</li>
        <li style={{ margin: '10px 0' }}>Explore</li>
        <li style={{ margin: '10px 0' }}>Notifications</li>
        <li style={{ margin: '10px 0' }}>Messages</li>
        <li style={{ margin: '10px 0' }}>Profile</li>
      </ul>
    </aside>
  );
}
EOL

# Button.tsx
cat << 'EOL' > src/components/ui/Button.tsx
import React from 'react';

export function Button({ label, onClick }: any) {
  return (
    <button onClick={onClick} style={{ padding: '8px 16px', borderRadius: '6px', border: 'none', background: '#1DA1F2', color: '#fff', cursor: 'pointer' }}>
      {label}
    </button>
  );
}
EOL

# Avatar.tsx
cat << 'EOL' > src/components/ui/Avatar.tsx
import React from 'react';

export function Avatar({ src, size = 40 }: any) {
  return <img src={src} style={{ width: size, height: size, borderRadius: '50%' }} alt="avatar" />;
}
EOL

# Loader.tsx
cat << 'EOL' > src/components/ui/Loader.tsx
import React from 'react';

export function Loader() {
  return <div style={{ textAlign: 'center', padding: '20px' }}>Loading...</div>;
}
EOL

echo "Navbar, Sidebar, and UI components created!"
