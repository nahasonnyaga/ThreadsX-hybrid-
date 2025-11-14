import React from 'react';
import XPostCard from '../components/feed/XPostCard';

export const XFeed = () => {
  // Example dummy posts
  const posts = [
    { id: 1, user: '@JaneDoe', content: 'Just finished a new project! #coding', timestamp: '2h' },
    { id: 2, user: '@mastouser1', content: 'Hello from Mastodon!', timestamp: '5h' },
    { id: 3, user: '@DevGuy', content: 'React + Tailwind = ❤️', timestamp: '1d' },
  ];

  return (
    <div className='flex flex-col divide-y divide-gray-300'>
      {posts.map(post => (
        <XPostCard key={post.id} {...post} />
      ))}
    </div>
  );
};

export default XFeed;
