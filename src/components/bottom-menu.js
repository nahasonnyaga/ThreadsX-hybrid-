import React, { useState, useEffect } from "react";
export default function BottomMenu() {
    const [visible, setVisible] = useState(true);
    let lastScroll = 0;
    useEffect(() => {
        const handleScroll = () => {
            const currentScroll = window.scrollY;
            if (currentScroll > lastScroll && currentScroll > 100) {
                setVisible(false); // scrolling down -> hide
            }
            else {
                setVisible(true); // scrolling up -> show
            }
            lastScroll = currentScroll;
        };
        window.addEventListener('scroll', handleScroll);
        return () => window.removeEventListener('scroll', handleScroll);
    }, []);
    return (<div className={`fixed bottom-0 left-0 w-full bg-gray-900 p-3 transition-transform duration-300 ${visible ? 'translate-y-0' : 'translate-y-full'}`}>
      <div className="flex justify-around text-white">
        <button>Home</button>
        <button>Search</button>
        <button>Upload</button>
        <button>Profile</button>
      </div>
    </div>);
}
