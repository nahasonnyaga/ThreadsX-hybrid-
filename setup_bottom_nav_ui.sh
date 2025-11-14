#!/bin/bash
echo "Enhancing BottomNav UI..."

# Create BottomNav.tsx with collapsible scroll behavior
cat << 'EOL' > src/components/ui/BottomNav.tsx
import React, { useState, useEffect } from 'react';
import { Link, useLocation } from 'react-router-dom';
import { FaHome, FaSearch, FaBell, FaUser, FaUpload, FaUsers } from 'react-icons/fa';
import './BottomNav.css';

export const BottomNav = () => {
  const location = useLocation();
  const [hidden, setHidden] = useState(false);
  const [lastScroll, setLastScroll] = useState(0);

  const handleScroll = () => {
    const currentScroll = window.scrollY;
    setHidden(currentScroll > lastScroll);
    setLastScroll(currentScroll);
  };

  useEffect(() => {
    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, [lastScroll]);

  return (
    <nav className={`bottom-nav ${hidden ? 'hidden' : ''}`}>
      <Link className={location.pathname === '/' ? 'active' : ''} to="/"><FaHome /></Link>
      <Link className={location.pathname === '/search' ? 'active' : ''} to="/search"><FaSearch /></Link>
      <Link className={location.pathname === '/notifications' ? 'active' : ''} to="/notifications"><FaBell /></Link>
      <Link className={location.pathname === '/spaces' ? 'active' : ''} to="/spaces"><FaUsers /></Link>
      <Link className={location.pathname === '/upload' ? 'active' : ''} to="/upload"><FaUpload /></Link>
      <Link className={location.pathname.startsWith('/profile') ? 'active' : ''} to="/profile/JaneDoe"><FaUser /></Link>
    </nav>
  );
};
EOL

# Create minimal CSS for BottomNav
cat << 'EOL' > src/components/ui/BottomNav.css
.bottom-nav {
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  height: 60px;
  background: #fff;
  display: flex;
  justify-content: space-around;
  align-items: center;
  border-top: 1px solid #ccc;
  transition: transform 0.3s;
  z-index: 999;
}

.bottom-nav.hidden {
  transform: translateY(100%);
}

.bottom-nav a {
  color: #555;
  font-size: 24px;
  display: flex;
  flex-direction: column;
  align-items: center;
  text-decoration: none;
}

.bottom-nav a.active {
  color: #1DA1F2;
}
EOL

echo "BottomNav UI enhanced with icons and collapsible behavior!"
