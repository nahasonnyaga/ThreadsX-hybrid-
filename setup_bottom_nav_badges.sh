#!/bin/bash
echo "Enhancing BottomNav with notification badges..."

cat << 'EOL' > src/components/ui/BottomNav.tsx
import React, { useState, useEffect } from 'react';
import { Link, useLocation } from 'react-router-dom';
import { FaHome, FaSearch, FaBell, FaUser, FaUpload, FaUsers } from 'react-icons/fa';
import './BottomNav.css';

export const BottomNav = () => {
  const location = useLocation();
  const [hidden, setHidden] = useState(false);
  const [lastScroll, setLastScroll] = useState(0);

  // Example badge counts
  const [notifications, setNotifications] = useState(3);
  const [threads, setThreads] = useState(1);
  const [messages, setMessages] = useState(5);

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
      
      <Link className={location.pathname === '/notifications' ? 'active' : ''} to="/notifications" style={{ position: 'relative' }}>
        <FaBell />
        {notifications > 0 && <span className="badge">{notifications}</span>}
      </Link>

      <Link className={location.pathname === '/spaces' ? 'active' : ''} to="/spaces" style={{ position: 'relative' }}>
        <FaUsers />
        {threads > 0 && <span className="badge">{threads}</span>}
      </Link>

      <Link className={location.pathname === '/upload' ? 'active' : ''} to="/upload"><FaUpload /></Link>
      <Link className={location.pathname.startsWith('/profile') ? 'active' : ''} to="/profile/JaneDoe" style={{ position: 'relative' }}>
        <FaUser />
        {messages > 0 && <span className="badge">{messages}</span>}
      </Link>
    </nav>
  );
};
EOL

# Update CSS for badges
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
  position: relative;
}

.bottom-nav a.active {
  color: #1DA1F2;
}

.badge {
  position: absolute;
  top: -5px;
  right: -10px;
  background: #e0245e;
  color: #fff;
  font-size: 12px;
  font-weight: bold;
  width: 18px;
  height: 18px;
  border-radius: 50%;
  display: flex;
  justify-content: center;
  align-items: center;
}
EOL

echo "BottomNav badges implemented!"
