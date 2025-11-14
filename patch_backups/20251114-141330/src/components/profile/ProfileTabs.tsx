import React, { useState, useEffect } from 'react';

import './ProfileTabs.css';

export const ProfileTabs = ({ tabs, onSelect }: { tabs: string[], onSelect: (tab: string) => void }) => {
  const [active, setActive] = useState(tabs[0]);

  const handleClick = (tab: string) => {
    setActive(tab);
    onSelect(tab);
  };

  return (
    <div className="profile-tabs">
      {tabs.map(tab => (
        <button
          key={tab}
          className={tab === active ? 'active' : ''}
          onClick={() => handleClick(tab)}
        >
          {tab}
        </button>
      ))}
    </div>
  );
};
