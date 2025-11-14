import React from 'react';

export const XPostCard = ({ user, content, timestamp }) => (
  <div className='p-4 hover:bg-gray-100 dark:hover:bg-gray-800 transition'>
    <div className='font-bold text-blue-500'>{user}</div>
    <div className='text-gray-800 dark:text-gray-200'>{content}</div>
    <div className='text-gray-400 text-sm'>{timestamp}</div>
  </div>
);

export default XPostCard;
