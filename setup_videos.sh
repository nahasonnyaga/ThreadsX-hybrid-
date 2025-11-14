#!/bin/bash
echo "Creating video components and services..."

# Video components
mkdir -p src/components/video

cat << 'EOV' > src/components/video/VideoPlayer.tsx
import React, { useRef } from 'react';

type Props = { src: string; poster?: string; };

const VideoPlayer: React.FC<Props> = ({ src, poster }) => {
  const videoRef = useRef<HTMLVideoElement>(null);
  return (
    <video
      ref={videoRef}
      src={src}
      poster={poster}
      controls
      className="w-full h-auto rounded-lg"
      autoPlay
      muted
      loop
    />
  );
};

export default VideoPlayer;
EOV

cat << 'EOV' > src/components/video/VideoUploader.tsx
import React, { useState } from 'react';
import { uploadVideo } from '../../services/videoService';

const VideoUploader: React.FC = () => {
  const [file, setFile] = useState<File | null>(null);
  const [uploading, setUploading] = useState(false);

  const handleUpload = async () => {
    if (!file) return;
    setUploading(true);
    const url = await uploadVideo(file);
    console.log('Uploaded video URL:', url);
    setUploading(false);
  };

  return (
    <div className="flex flex-col items-center gap-2">
      <input type="file" accept="video/*" onChange={(e) => setFile(e.target.files?.[0] || null)} />
      <button className="bg-blue-500 text-white px-4 py-2 rounded" onClick={handleUpload} disabled={uploading || !file}>
        {uploading ? 'Uploading...' : 'Upload Video'}
      </button>
    </div>
  );
};

export default VideoUploader;
EOV

# Video services
mkdir -p src/services

cat << 'EOV' > src/services/videoService.ts
import { CloudinaryService } from './cloudinaryService';
import { BunnyNetService } from './bunnyNetService';

export const uploadVideo = async (file: File): Promise<string> => {
  const cloudUrl = await CloudinaryService.uploadVideo(file);
  const bunnyUrl = await BunnyNetService.uploadVideo(file, file.name);
  return cloudUrl;
};
EOV

cat << 'EOV' > src/services/cloudinaryService.ts
export const CloudinaryService = {
  uploadVideo: async (file: File): Promise<string> => {
    const formData = new FormData();
    formData.append('file', file);
    formData.append('upload_preset', 'YOUR_UPLOAD_PRESET');

    const res = await fetch('https://api.cloudinary.com/v1_1/YOUR_CLOUD_NAME/video/upload', {
      method: 'POST',
      body: formData,
    });

    const data = await res.json();
    return data.secure_url;
  },
};
EOV

cat << 'EOV' > src/services/bunnyNetService.ts
export const BunnyNetService = {
  uploadVideo: async (file: File, fileName: string): Promise<string> => {
    const res = await fetch('https://storage.bunnycdn.com/YOUR_STORAGE_ZONE/' + fileName, {
      method: 'PUT',
      headers: { AccessKey: 'YOUR_BUNNYNET_API_KEY' },
      body: file,
    });

    return res.ok ? `https://YOUR_PULL_ZONE/${fileName}` : '';
  },
};
EOV

echo "All video components and services created!"
