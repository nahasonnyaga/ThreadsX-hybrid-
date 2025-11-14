import React, { useState } from 'react';

type LikeButtonProps = {
  postId?: string | number;
  likes?: number;
  initialLikes?: number;
  federated?: boolean;
};

const LikeButton: React.FC<LikeButtonProps> = ({ initialLikes = 0 }) => {
  const [currentLikes, setCurrentLikes] = useState(initialLikes);
  return <button>{currentLikes} ❤️</button>;
};

export default LikeButton;
