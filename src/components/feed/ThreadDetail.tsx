import React from 'react';

import { FaArrowLeft, FaRegComment, FaHeart, FaRetweet } from 'react-icons/fa';

export const ThreadDetail = ({ thread, onClose }: { thread: any, onClose: () => void }) => {
  return (
    <div className="fixed inset-0 bg-white z-50 overflow-y-auto">
      <div className="flex items-center p-4 border-b">
        <button onClick={onClose} className="mr-4"><FaArrowLeft /></button>
        <h2 className="font-bold text-lg">{thread.user}</h2>
      </div>
      <div className="p-4">
        <p>{thread.content}</p>
        <div className="flex justify-start mt-4 space-x-6 text-gray-500">
          <div className="flex items-center space-x-1"><FaRegComment /> <span>{thread.replies}</span></div>
          <div className="flex items-center space-x-1"><FaHeart /> <span>{thread.likes}</span></div>
          <div className="flex items-center space-x-1"><FaRetweet /> <span>{thread.retweets}</span></div>
        </div>
        {/* Replies list placeholder */}
        <div className="mt-6">
          {thread.repliesList?.map((reply: any, index: number) => (
            <div key={index} className="flex mt-4 border-b pb-2">
              <img src={reply.avatar} alt="avatar" className="w-10 h-10 rounded-full mr-3" />
              <div>
                <span className="font-bold">{reply.user}</span>
                <p>{reply.content}</p>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};
