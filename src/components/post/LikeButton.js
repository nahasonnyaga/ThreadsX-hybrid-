import React, { useState } from 'react';
const LikeButton = ({ initialLikes = 0 }) => {
    const [currentLikes, setCurrentLikes] = useState(initialLikes);
    return <button>{currentLikes} ❤️</button>;
};
export default LikeButton;
