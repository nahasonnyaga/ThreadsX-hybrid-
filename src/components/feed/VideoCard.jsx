import React from 'react';

export const VideoCard = ({ video }) => (
  <div className='w-full h-screen flex items-center justify-center snap-start overflow-hidden relative'>
    <video
      className='w-full h-full object-cover'
      src={video.src}
      autoPlay
      loop
      muted
      playsInline
    />
    <div className='absolute bottom-20 left-4 text-white'>
      <h2 className='text-xl font-bold'>{video.user}</h2>
      <p className='text-sm'>{video.description || ''}</p>
    </div>
  </div>
);

export default VideoCard;
