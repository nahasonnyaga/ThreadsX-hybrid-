import React, { useEffect, useState } from "react";

const TopNav = () => {
  const [hidden, setHidden] = useState(false);
  let scrollTimeout = null;

  useEffect(() => {
    const handleScroll = () => {
      setHidden(true); // hide when scrolling
      if (scrollTimeout) clearTimeout(scrollTimeout);
      scrollTimeout = setTimeout(() => setHidden(false), 300); // show after scrolling stops
    };

    window.addEventListener("scroll", handleScroll, { passive: true });
    return () => window.removeEventListener("scroll", handleScroll);
  }, []);

  return (
    <nav
      className={`fixed top-0 left-0 w-full bg-gray-900 text-white p-4 transition-transform duration-300 z-50 ${
        hidden ? "-translate-y-full" : "translate-y-0"
      }`}
    >
      <h1 className="text-xl font-bold">My App</h1>
    </nav>
  );
};

export default TopNav;
