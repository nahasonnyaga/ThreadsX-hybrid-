import React from 'react';

const SpaceCard: React.FC<{ space: any }> = ({ space }) => {
  return <div>{space.title}</div>;
};

export default SpaceCard;
