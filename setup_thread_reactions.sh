#!/bin/bash
echo "Setting up reactions (like, retweet, bookmark) for threads..."

# 1️⃣ LikeButton
cat << 'EOT' > src/components/post/LikeButton.tsx
import { useState } from 'react';

export default function LikeButton({ initialLikes = 0 }: any) {
  const [liked, setLiked] = useState(false);
  const [likes, setLikes] = useState(initialLikes);

  const toggleLike = () => {
    setLiked(!liked);
    setLikes(prev => liked ? prev - 1 : prev + 1);
  };

  return (
    <button onClick={toggleLike} className="flex items-center gap-1 text-sm">
      <span className={liked ? 'text-red-500' : 'text-gray-400'}>♥</span>
      {likes}
    </button>
  );
}
EOT

# 2️⃣ RetweetButton
cat << 'EOT' > src/components/post/RetweetButton.tsx
import { useState } from 'react';

export default function RetweetButton({ initialRetweets = 0 }: any) {
  const [retweeted, setRetweeted] = useState(false);
  const [retweets, setRetweets] = useState(initialRetweets);

  const toggleRetweet = () => {
    setRetweeted(!retweeted);
    setRetweets(prev => retweeted ? prev - 1 : prev + 1);
  };

  return (
    <button onClick={toggleRetweet} className="flex items-center gap-1 text-sm">
      <span className={retweeted ? 'text-green-500' : 'text-gray-400'}>🔁</span>
      {retweets}
    </button>
  );
}
EOT

# 3️⃣ BookmarkButton
cat << 'EOT' > src/components/post/BookmarkButton.tsx
import { useState } from 'react';

export default function BookmarkButton() {
  const [bookmarked, setBookmarked] = useState(false);

  return (
    <button
      onClick={() => setBookmarked(!bookmarked)}
      className={bookmarked ? 'text-yellow-400' : 'text-gray-400'}
    >
      🔖
    </button>
  );
}
EOT

# 4️⃣ Update ThreadCard to include reactions
cat << 'EOT' > src/components/thread-card.tsx
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
EOT

echo "Reactions added! Like, Retweet, Bookmark buttons are integrated with threads."
