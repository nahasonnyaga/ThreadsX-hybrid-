import React, { useState } from 'react';
import { FaHome, FaHashtag, FaEnvelope, FaUser, FaTimes, FaBars } from 'react-icons/fa';

const Sidebar = ({ activeTab, setActiveTab }) => {
  const [isOpen, setIsOpen] = useState(false);

  const menuItems = [
    { label: 'Home', tab: 'tiktok' },
    { label: 'X', tab: 'x' },
    { label: 'Threads', tab: 'threads' },
    { label: 'Profile', tab: 'profile' },
  ];

  return (
    <>
      {/* Hamburger toggle button on small screens */}
      <div className="md:hidden fixed top-4 left-4 z-50">
        <button
          className="p-2 rounded bg-white dark:bg-gray-900 shadow"
          onClick={() => setIsOpen(true)}
        >
          <FaBars className="text-xl text-gray-800 dark:text-gray-200" />
        </button>
      </div>

      {/* Overlay */}
      {isOpen && (
        <div
          className="fixed inset-0 bg-black bg-opacity-50 z-40"
          onClick={() => setIsOpen(false)}
        />
      )}

      {/* Sidebar */}
      <aside
        className={`
          fixed top-0 left-0 h-full w-64 bg-white dark:bg-gray-900 border-r border-gray-300 dark:border-gray-700 p-4 space-y-4
          transform ${isOpen ? 'translate-x-0' : '-translate-x-full'} transition-transform duration-300 ease-in-out
          md:translate-x-0 md:flex md:flex-col z-50
        `}
      >
        {/* Close button for mobile */}
        <div className="md:hidden flex justify-end mb-4">
          <button onClick={() => setIsOpen(false)}>
            <FaTimes className="text-xl text-gray-700 dark:text-gray-200" />
          </button>
        </div>

        {/* Logo / App Title */}
        <div className="font-bold text-2xl text-gray-900 dark:text-white mb-6">
          MyApp
        </div>

        {/* Menu Items */}
        {menuItems.map(item => (
          <button
            key={item.tab}
            className={`
              flex items-center gap-3 py-2 px-3 rounded w-full text-left
              ${activeTab === item.tab
                ? 'bg-blue-100 dark:bg-blue-900 text-blue-600'
                : 'text-gray-700 dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-800 hover:text-blue-500'}
            `}
            onClick={() => {
              setActiveTab(item.tab);
              setIsOpen(false);
            }}
          >
            {item.label}
          </button>
        ))}
      </aside>
    </>
  );
};

export default Sidebar;
