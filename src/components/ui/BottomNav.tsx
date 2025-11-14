import React, { useState, useEffect } from "react";

import { Link, useLocation } from 'react-router-dom';
import { FaHome, FaSearch, FaBell, FaUser, FaUpload, FaUsers } from 'react-icons/fa';
import { ThreadService } from '../../services/threadService';
import { NotificationService } from '../../services/notificationService';
import { ProfileService } from '../../services/profileService';
import './BottomNav.css';

export const BottomNav = () => {
  const location = useLocation();
  const [hidden, setHidden] = useState(false);
  const [lastScroll, setLastScroll] = useState(0);

  const [notifications, setNotifications] = useState(0);
  const [threads, setThreads] = useState(0);
  const [messages, setMessages] = useState(0);

  // Fetch counts
  const fetchCounts = async () => {
    const notif = await NotificationService.fetchNotifications();
    const threadList = await ThreadService.fetchThreads();
    const profile = await ProfileService.fetchProfile('JaneDoe');

    setNotifications(notif.filter(n => !(n as any).read).length);
    setThreads(threadList.length);
    setMessages(profile.followers); // example: messages as followers count
  };

  useEffect(() => {
    fetchCounts();

    // Poll every 5 seconds for live updates
    const interval = setInterval(fetchCounts, 5000);
    return () => clearInterval(interval);
  }, []);

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
