#!/bin/bash
echo "Creating Pages..."
mkdir -p src/pages

# Home.tsx
cat << 'EOL' > src/pages/Home.tsx
import React from 'react';
import { Feed } from '../components/feed/Feed';

export default function Home() {
  return (
    <div>
      <h1>Home</h1>
      <Feed />
    </div>
  );
}
EOL

# Profile.tsx
cat << 'EOL' > src/pages/Profile.tsx
import React from 'react';
import { ProfileService } from '../services/profileService';

export default function Profile({ username }: { username: string }) {
  const profile = ProfileService.fetchProfile(username);
  return (
    <div>
      <h1>{username}'s Profile</h1>
      <img src={profile.avatar} alt="avatar" />
      <p>{profile.bio}</p>
    </div>
  );
}
EOL

# Upload.tsx
cat << 'EOL' > src/pages/Upload.tsx
import React, { useState } from 'react';
import { VideoService } from '../services/videoService';

export default function Upload() {
  const [file, setFile] = useState(null);
  const handleUpload = async () => {
    if(file) await VideoService.uploadVideo({ file });
  };
  return (
    <div>
      <h1>Upload Video</h1>
      <input type="file" onChange={e => setFile(e.target.files[0])} />
      <button onClick={handleUpload}>Upload</button>
    </div>
  );
}
EOL

# Trends.tsx
cat << 'EOL' > src/pages/Trends.tsx
import React from 'react';
export default function Trends() {
  return <div><h1>Trending Content</h1></div>;
}
EOL

# Spaces.tsx
cat << 'EOL' > src/pages/Spaces.tsx
import React from 'react';
export default function Spaces() {
  return <div><h1>Spaces</h1></div>;
}
EOL

echo "Pages created!"
