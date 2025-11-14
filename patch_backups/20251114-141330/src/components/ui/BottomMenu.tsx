import React, { useState, useEffect } from 'react';

export const BottomMenu: React.FC = () => {
  const [visible, setVisible] = useState(true);
  let lastScroll = 0;

  useEffect(() => {
    const handleScroll = () => {
      const currentScroll = window.pageYOffset;
      if (currentScroll > lastScroll) setVisible(false); // scrolling down
      else setVisible(true); // scrolling up
      lastScroll = currentScroll;
    };
    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  return (
    <div className={`fixed bottom-0 w-full bg-white shadow-md transition-transform duration-300 ${visible ? 'translate-y-0' : 'translate-y-full'}`}>
      <div className="flex justify-around p-3">
        <button>🏠 Home</button>
        <button>🔍 Search</button>
        <button>➕ Create</button>
        <button>🔔 Notifications</button>
        <button>👤 Profile</button>
      </div>
    </div>
  );
};
