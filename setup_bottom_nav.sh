#!/bin/bash
echo "Creating Collapsible Bottom Navigation..."

mkdir -p src/components/ui

# BottomNav.tsx
cat << 'EOL' > src/components/ui/BottomNav.tsx
import React, { useState, useEffect } from 'react';

export function BottomNav() {
  const [show, setShow] = useState(true);
  const [lastScrollY, setLastScrollY] = useState(0);

  const controlNavbar = () => {
    if (typeof window !== 'undefined') {
      if (window.scrollY > lastScrollY) {
        setShow(false); // scroll down
      } else {
        setShow(true); // scroll up
      }
      setLastScrollY(window.scrollY);
    }
  };

  useEffect(() => {
    if (typeof window !== 'undefined') {
      window.addEventListener('scroll', controlNavbar);
      return () => window.removeEventListener('scroll', controlNavbar);
    }
  }, [lastScrollY]);

  return (
    <nav
      style={{
        position: 'fixed',
        bottom: 0,
        left: 0,
        right: 0,
        background: '#fff',
        padding: '10px 0',
        display: 'flex',
        justifyContent: 'space-around',
        alignItems: 'center',
        borderTop: '1px solid #ccc',
        transition: 'transform 0.3s ease-in-out',
        transform: show ? 'translateY(0)' : 'translateY(100%)',
        zIndex: 1000
      }}
    >
      <button>Home</button>
      <button>Search</button>
      <button>Upload</button>
      <button>Notifications</button>
      <button>Profile</button>
    </nav>
  );
}
EOL

echo "Bottom Navigation created!"
