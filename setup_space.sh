#!/bin/bash
echo "Creating SpaceCard and SpaceRoom components..."

mkdir -p src/components/space

# SpaceCard.tsx
cat << 'EOF2' > src/components/space/SpaceCard.tsx
import React from 'react';

interface SpaceCardProps {
  id: number;
  title: string;
  host: string;
  participants: number;
  isLive?: boolean;
}

const SpaceCard: React.FC<SpaceCardProps> = ({ id, title, host, participants, isLive = false }) => {
  return (
    <div className={`border rounded-lg p-4 shadow-md hover:shadow-xl transition ${isLive ? 'border-green-500' : ''}`}>
      <h3 className="font-bold text-lg">{title}</h3>
      <p className="text-gray-600 mt-1">Host: {host}</p>
      <p className="text-gray-500 mt-2">{participants} participants</p>
      {isLive && <span className="text-red-500 font-bold mt-2">Live</span>}
    </div>
  );
};

export default SpaceCard;
EOF2

# SpaceRoom.tsx
cat << 'EOF2' > src/components/space/SpaceRoom.tsx
import React from 'react';

interface SpaceRoomProps {
  id: number;
  title: string;
  host: string;
  participants: string[];
}

const SpaceRoom: React.FC<SpaceRoomProps> = ({ id, title, host, participants }) => {
  return (
    <div className="p-4">
      <h2 className="text-2xl font-bold">{title}</h2>
      <p className="text-gray-600">Host: {host}</p>
      <h3 className="mt-4 font-semibold">Participants:</h3>
      <ul className="list-disc pl-5 mt-2">
        {participants.map((p, i) => (
          <li key={i}>{p}</li>
        ))}
      </ul>
    </div>
  );
};

export default SpaceRoom;
EOF2

echo "SpaceCard and SpaceRoom components created at src/components/space!"
