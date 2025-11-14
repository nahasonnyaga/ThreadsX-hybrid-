#!/bin/bash
echo "Creating Space Components..."

mkdir -p src/components/space

# SpaceCard.tsx
cat << 'EOL' > src/components/space/SpaceCard.tsx
import React from 'react';

export function SpaceCard({ title, host, participants = 0 }: any) {
  return (
    <div style={{ border: '1px solid gray', padding: '8px', borderRadius: '8px', margin: '4px' }}>
      <h4>🎙️ {title}</h4>
      <p>Host: {host}</p>
      <p>Participants: {participants}</p>
    </div>
  );
}
EOL

# SpaceRoom.tsx
cat << 'EOL' > src/components/space/SpaceRoom.tsx
import React from 'react';

export function SpaceRoom({ title, users = [] }: any) {
  return (
    <div style={{ border: '1px solid blue', padding: '10px', borderRadius: '8px' }}>
      <h3>Space Room: {title}</h3>
      <h5>Users in Room:</h5>
      <ul>
        {users.map((user: string, idx: number) => <li key={idx}>{user}</li>)}
      </ul>
    </div>
  );
}
EOL

# SpaceSchedule.tsx
cat << 'EOL' > src/components/space/SpaceSchedule.tsx
import React from 'react';

export function SpaceSchedule({ upcomingSpaces = [] }: any) {
  return (
    <div>
      <h4>Upcoming Spaces</h4>
      {upcomingSpaces.map((space: any, idx: number) => (
        <div key={idx} style={{ border: '1px dashed gray', margin: '4px', padding: '4px' }}>
          <p>Title: {space.title}</p>
          <p>Host: {space.host}</p>
          <p>Time: {space.time}</p>
        </div>
      ))}
    </div>
  );
}
EOL

echo "Space Components created!"
