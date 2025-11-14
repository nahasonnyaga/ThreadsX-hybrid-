#!/bin/bash
echo "Creating Sidebar component..."

mkdir -p src/components/ui

cat << 'EOF2' > src/components/ui/Sidebar.tsx
import React from 'react';
import { Link } from 'react-router-dom';

const Sidebar: React.FC = () => {
  return (
    <aside className="w-64 bg-white dark:bg-gray-900 p-4 hidden md:block h-screen sticky top-0">
      <div className="mb-6">
        <h2 className="font-bold text-lg text-gray-800 dark:text-gray-200 mb-2">Trending</h2>
        <ul className="space-y-1">
          <li><Link to="/trends/1" className="hover:text-blue-500">#Tech</Link></li>
          <li><Link to="/trends/2" className="hover:text-blue-500">#Music</Link></li>
          <li><Link to="/trends/3" className="hover:text-blue-500">#Sports</Link></li>
        </ul>
      </div>

      <div className="mb-6">
        <h2 className="font-bold text-lg text-gray-800 dark:text-gray-200 mb-2">Communities</h2>
        <ul className="space-y-1">
          <li><Link to="/communities/tech" className="hover:text-blue-500">Tech Enthusiasts</Link></li>
          <li><Link to="/communities/music" className="hover:text-blue-500">Music Lovers</Link></li>
          <li><Link to="/communities/sports" className="hover:text-blue-500">Sports Fans</Link></li>
        </ul>
      </div>

      <div>
        <h2 className="font-bold text-lg text-gray-800 dark:text-gray-200 mb-2">Suggested Users</h2>
        <ul className="space-y-1">
          <li><Link to="/profile/1" className="hover:text-blue-500">Alice</Link></li>
          <li><Link to="/profile/2" className="hover:text-blue-500">Bob</Link></li>
          <li><Link to="/profile/3" className="hover:text-blue-500">Charlie</Link></li>
        </ul>
      </div>
    </aside>
  );
};

export default Sidebar;
EOF2

echo "Sidebar component created at src/components/ui/Sidebar.tsx!"
