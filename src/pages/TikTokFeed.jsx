import React, { useRef, useEffect } from 'react';
import VideoCard from '../components/feed/VideoCard';

export const TikTokFeed = () => {
  const videos = [
    { id: 1, src: 'https://www.w3schools.com/html/mov_bbb.mp4', user: '@User1' },
    { id: 2, src: 'https://www.w3schools.com/html/movie.mp4', user: '@User2' },
    { id: 3, src: 'https://www.w3schools.com/html/mov_bbb.mp4', user: '@User3' },
  ];

  const containerRef = useRef(null);

  useEffect(() => {
    const container = containerRef.current;

    const handleWheel = e => {
      e.preventDefault();
      container.scrollBy({ top: e.deltaY, behavior: 'smooth' });
    };

    container.addEventListener('wheel', handleWheel, { passive: false });
    return () => container.removeEventListener('wheel', handleWheel);
  }, []);

  return (
    <div
      ref={containerRef}
      className='h-screen overflow-y-scroll snap-y snap-mandatory scroll-smooth'
    >
      {videos.map(video => (
        <VideoCard key={video.id} video={video} />
      ))}
    </div>
  );
};

export default TikTokFeed;
