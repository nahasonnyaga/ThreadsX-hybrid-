#!/bin/bash
echo "Creating Video Components..."
mkdir -p src/components/video

# VideoPlayer.tsx
cat << 'EOL' > src/components/video/VideoPlayer.tsx
import React from 'react';
export function VideoPlayer({ src }: { src: string }) {
  return <video src={src} controls width="100%"></video>;
}
EOL

# VideoUploader.tsx
cat << 'EOL' > src/components/video/VideoUploader.tsx
import React, { useState } from 'react';
import { VideoService } from '../../services/videoService';

export function VideoUploader() {
  const [file, setFile] = useState(null);

  const handleUpload = async () => {
    if(file) await VideoService.uploadVideo({ file });
  };

  return (
    <div>
      <input type="file" onChange={e => setFile(e.target.files[0])} />
      <button onClick={handleUpload}>Upload Video</button>
    </div>
  );
}
EOL

echo "Video Components created!"
