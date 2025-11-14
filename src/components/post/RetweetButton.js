import React, { useState } from 'react';
const RetweetButton = ({ initialRetweets = 0 }) => {
    const [currentRetweets, setCurrentRetweets] = useState(initialRetweets);
    return <button>{currentRetweets} 🔁</button>;
};
export default RetweetButton;
