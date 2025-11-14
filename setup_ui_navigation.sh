#!/bin/bash
echo "Creating Navbar, Sidebar, and UI components..."

mkdir -p src/components/ui

# Navbar.tsx
cat << 'EOL' > src/components/ui/Navbar.tsx
import React from 'react';

export function Navbar() {
  return (
    <nav style={{ display: 'flex', justifyContent: 'space-between', padding: '10px 20px', background: '#fff', borderBottom: '1px solid #eee' }}>
      <div>Logo</div>
      <ul style={{ display: 'flex', gap: '15px', listStyle: 'none' }}>
        <li>Home</li>
        <li>Spaces</li>
        <li>Communities</li>
        <li>Trends</li>
        <li>Profile</li>
      </ul>
      <div>Search</div>
    </nav>
  );
}
EOL

# Sidebar.tsx
cat << 'EOL' > src/components/ui/Sidebar.tsx
import React from 'react';

export function Sidebar() {
  return (
    <aside style={{ width: '250px', padding: '20px', borderRight: '1px solid #eee', minHeight: '100vh' }}>
      <h3>Navigation</h3>
      <ul style={{ listStyle: 'none', padding: 0 }}>
        <li>Home</li>
        <li>Feed</li>
        <li>Spaces</li>
        <li>Communities</li>
        <li>Trending</li>
        <li>Notifications</li>
        <li>Profile</li>
      </ul>
    </aside>
  );
}
EOL

# Button.tsx
cat << 'EOL' > src/components/ui/Button.tsx
import React from 'react';

export function Button({ children, onClick }: any) {
  return (
    <button onClick={onClick} style={{ padding: '8px 16px', borderRadius: '8px', background: '#1da1f2', color: '#fff', border: 'none', cursor: 'pointer' }}>
      {children}
    </button>
  );
}
EOL

# Loader.tsx
cat << 'EOL' > src/components/ui/Loader.tsx
import React from 'react';

export function Loader() {
  return (
    <div style={{ textAlign: 'center', padding: '20px' }}>
      <span>Loading...</span>
    </div>
  );
}
EOL

# Modal.tsx
cat << 'EOL' > src/components/ui/Modal.tsx
import React from 'react';

export function Modal({ children, onClose, isOpen }: any) {
  if (!isOpen) return null;
  return (
    <div style={{ position: 'fixed', top: 0, left: 0, width: '100%', height: '100%', background: 'rgba(0,0,0,0.5)' }}>
      <div style={{ background: '#fff', padding: '20px', margin: '50px auto', width: '400px', borderRadius: '10px', position: 'relative' }}>
        <button onClick={onClose} style={{ position: 'absolute', top: '10px', right: '10px' }}>X</button>
        {children}
      </div>
    </div>
  );
}
EOL

# Tooltip.tsx
cat << 'EOL' > src/components/ui/Tooltip.tsx
import React from 'react';

export function Tooltip({ message }: any) {
  return (
    <span style={{ background: '#000', color: '#fff', padding: '2px 6px', borderRadius: '4px', fontSize: '12px' }}>
      {message}
    </span>
  );
}
EOL

echo "UI & Navigation components created!"
