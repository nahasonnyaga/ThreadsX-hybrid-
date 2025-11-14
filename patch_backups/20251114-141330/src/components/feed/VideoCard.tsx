import React from 'react';

export function VideoCard({ video }: any) {
  return (
    <div style={{ marginBottom: '20px', borderRadius: '10px', overflow: 'hidden' }}>
      <video width="100%" controls>
        <source src={video.src} type="video/mp4" />
        Your browser does not support the video tag.
      </video>
      <p><strong>{video.username}</strong> {video.description}</p>
    </div>
  );
}
