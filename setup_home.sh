#!/bin/bash
echo "Creating Home Page..."
mkdir -p src/pages

# Home.tsx
cat << 'EOL' > src/pages/Home.tsx
import React from 'react';
import { Feed } from '../components/feed/Feed';
import { Sidebar } from '../components/ui/Sidebar';
import { Navbar } from '../components/ui/Navbar';

export function Home() {
  return (
    <div style={{ display: 'flex' }}>
      <Sidebar />
      <div style={{ flex: 1, padding: '20px' }}>
        <Navbar />
        <h1>Home</h1>
        <Feed />
      </div>
    </div>
  );
}
EOL

echo "Home Page created!"
