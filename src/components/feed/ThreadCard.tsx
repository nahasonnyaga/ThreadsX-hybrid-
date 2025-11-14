import React from 'react';

import { FaRegComment, FaHeart, FaRetweet } from 'react-icons/fa';

export const ThreadCard = ({ thread, onOpen }: { thread: any, onOpen: (thread: any) => void }) => {
  return (
    <div 
      className="flex p-4 border-b cursor-pointer hover:bg-gray-50"
      onClick={() => onOpen(thread)}
    >
      <img src={thread.avatar} alt="avatar" className="w-12 h-12 rounded-full mr-4" />
      <div className="flex-1">
        <div className="flex justify-between items-center">
          <span className="font-bold">{thread.user}</span>
        </div>
        <p className="mt-1 text-gray-700">{thread.content}</p>
        <div className="flex justify-start mt-2 space-x-6 text-gray-500">
          <div className="flex items-center space-x-1"><FaRegComment /> <span>{thread.replies}</span></div>
          <div className="flex items-center space-x-1"><FaHeart /> <span>{thread.likes}</span></div>
          <div className="flex items-center space-x-1"><FaRetweet /> <span>{thread.retweets}</span></div>
        </div>
      </div>
    </div>
  );
};
