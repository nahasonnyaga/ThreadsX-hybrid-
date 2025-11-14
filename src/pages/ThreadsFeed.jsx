import React from 'react';
import ThreadPostCard from '../components/feed/ThreadPostCard';

export const ThreadsFeed = () => {
  const posts = [
    { id: 1, user: '@JaneDoe', content: 'Threads is amazing! #social', timestamp: '3h' },
    { id: 2, user: '@User123', content: 'Check out my new blog post.', timestamp: '8h' },
  ];

  return (
    <div className='flex flex-col divide-y divide-gray-300'>
      {posts.map(post => (
        <ThreadPostCard key={post.id} {...post} />
      ))}
    </div>
  );
};

export default ThreadsFeed;
