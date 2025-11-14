import React, { useState } from 'react';

type RetweetButtonProps = {
  postId?: string | number;
  retweets?: number;
  initialRetweets?: number;
  federated?: boolean;
};

const RetweetButton: React.FC<RetweetButtonProps> = ({ initialRetweets = 0 }) => {
  const [currentRetweets, setCurrentRetweets] = useState(initialRetweets);
  return <button>{currentRetweets} 🔁</button>;
};

export default RetweetButton;
