
import { useState } from 'react';
import LikeButton from './post/LikeButton';
import RetweetButton from './post/RetweetButton';
import BookmarkButton from './post/BookmarkButton';

export default function ThreadCard({ thread }: any) {
  const [open, setOpen] = useState(false);

  return (
    <div className="border-b border-gray-700 p-4 cursor-pointer hover:bg-gray-900 transition-all">
      <div className="flex gap-3" onClick={() => setOpen(!open)}>
        <img
          src={thread.user?.avatar || '/assets/images/react.svg'}
          alt={thread.user?.username || 'user'}
          className="w-10 h-10 rounded-full object-cover"
        />
        <div className="flex-1">
          <div className="flex justify-between items-center">
            <span className="font-semibold text-sm">@{thread.user?.username || thread.username}</span>
            <span className="text-xs text-gray-400">{thread.timestamp}</span>
          </div>
          <p className="mt-1 text-sm">{thread.content}</p>
          <div className="flex gap-4 mt-2">
            <LikeButton initialLikes={thread.likes || 0} />
            <RetweetButton initialRetweets={thread.retweets || 0} />
            <BookmarkButton />
          </div>
        </div>
      </div>

      {open && thread.replies && thread.replies.length > 0 && (
        <div className="ml-12 mt-2 space-y-2">
          {thread.replies.map((reply: any, idx: number) => (
            <div key={idx} className="flex gap-3 p-2 border-l border-gray-600">
              <img
                src={reply.user?.avatar || '/assets/images/react.svg'}
                alt={reply.user?.username || 'user'}
                className="w-8 h-8 rounded-full object-cover"
              />
              <div className="flex-1">
                <span className="font-semibold text-sm">@{reply.user?.username || reply.username}</span>
                <p className="text-sm">{reply.content}</p>
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}
