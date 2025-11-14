#!/bin/bash
echo "Creating Upload Page..."

# Upload.tsx
cat << 'EOL' > src/pages/Upload.tsx
import React, { useState } from 'react';
import { Sidebar } from '../components/ui/Sidebar';
import { Navbar } from '../components/ui/Navbar';
import { VideoUploader } from '../components/video/VideoUploader';

export function Upload() {
  const [file, setFile] = useState<File | null>(null);

  const handleUpload = () => {
    if(file) {
      console.log("Uploading:", file.name);
    }
  };

  return (
    <div style={{ display: 'flex' }}>
      <Sidebar />
      <div style={{ flex: 1, padding: '20px' }}>
        <Navbar />
        <h1>Upload</h1>
        <input type="file" onChange={e => setFile(e.target.files?.[0] || null)} />
        <button onClick={handleUpload}>Upload Video</button>
      </div>
    </div>
  );
}
EOL

echo "Upload Page created!"
