import React, { useState } from 'react';
import { UserProvider } from './context/UserContext';
import Sidebar from './components/navigation/Sidebar';
import BottomNav from './components/navigation/BottomNav';
import TikTokFeed from './pages/TikTokFeed';
import XFeed from './pages/XFeed';
import ThreadsFeed from './pages/ThreadsFeed';
import Profile from './pages/Profile';

const App = () => {
  const [activeTab, setActiveTab] = useState('tiktok');

  const renderActiveFeed = () => {
    switch (activeTab) {
      case 'tiktok':
        return <TikTokFeed />;
      case 'x':
        return <XFeed />;
      case 'threads':
        return <ThreadsFeed />;
      case 'profile':
        return <Profile />;
      default:
        return <TikTokFeed />;
    }
  };

  return (
    <UserProvider>
      <div className="flex min-h-screen bg-gray-100">
        <Sidebar activeTab={activeTab} setActiveTab={setActiveTab} />
        <main className="flex-1 md:ml-64 relative">{renderActiveFeed()}</main>
        <BottomNav activeTab={activeTab} setActiveTab={setActiveTab} />
      </div>
    </UserProvider>
  );
};

export default App;
