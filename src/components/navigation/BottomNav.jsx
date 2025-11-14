import React, { useEffect, useState } from 'react';

export const BottomNav = ({ activeTab, setActiveTab }) => {
  const [hidden, setHidden] = useState(false);
  let scrollTimeout = null;

  useEffect(() => {
    const handleScroll = () => {
      setHidden(true); // hide when scrolling
      if (scrollTimeout) clearTimeout(scrollTimeout);
      scrollTimeout = setTimeout(() => setHidden(false), 300); // show after scrolling stops
    };

    window.addEventListener('scroll', handleScroll, { passive: true });
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  return (
    <nav
      className={`fixed bottom-0 w-full bg-gray-900 border-t border-gray-700 flex justify-around p-2 text-white z-50 transition-transform duration-300 ${hidden ? 'translate-y-full' : 'translate-y-0'}`}
    >
      <button
        className={`hover:text-gray-300 ${activeTab === 'tiktok' ? 'text-red-500' : ''}`}
        onClick={() => setActiveTab('tiktok')}
      >
        TikTok
      </button>
      <button
        className={`hover:text-gray-300 ${activeTab === 'x' ? 'text-blue-500' : ''}`}
        onClick={() => setActiveTab('x')}
      >
        X
      </button>
      <button
        className={`hover:text-gray-300 ${activeTab === 'threads' ? 'text-purple-500' : ''}`}
        onClick={() => setActiveTab('threads')}
      >
        Threads
      </button>
    </nav>
  );
};

export default BottomNav;
