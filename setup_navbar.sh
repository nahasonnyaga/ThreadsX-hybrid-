#!/bin/bash
echo "Creating Navbar component..."

mkdir -p src/components/ui

cat << 'EOF2' > src/components/ui/Navbar.tsx
import React from 'react';
import { FaBell, FaUserCircle, FaSearch, FaUsers } from 'react-icons/fa';
import { Link } from 'react-router-dom';

const Navbar: React.FC = () => {
  return (
    <nav className="flex items-center justify-between bg-white dark:bg-gray-900 px-4 py-2 shadow-md sticky top-0 z-50">
      <div className="flex items-center space-x-4">
        <Link to="/" className="font-bold text-xl">TikThreadsX</Link>
        <Link to="/spaces" className="flex items-center space-x-1 text-gray-700 dark:text-gray-300 hover:text-blue-500">
          <FaUsers /> <span>Spaces</span>
        </Link>
      </div>

      <div className="flex items-center space-x-4">
        <Link to="/search" className="text-gray-700 dark:text-gray-300 hover:text-blue-500">
          <FaSearch />
        </Link>
        <Link to="/notifications" className="text-gray-700 dark:text-gray-300 hover:text-blue-500">
          <FaBell />
        </Link>
        <Link to="/profile" className="text-gray-700 dark:text-gray-300 hover:text-blue-500">
          <FaUserCircle />
        </Link>
      </div>
    </nav>
  );
};

export default Navbar;
EOF2

echo "Navbar component created at src/components/ui/Navbar.tsx!"
