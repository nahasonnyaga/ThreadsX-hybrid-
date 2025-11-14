import React from 'react';

import LikeButton from './LikeButton';
import RetweetButton from './RetweetButton';

export type PostCardProps = { post:any, federated?: boolean };

const PostCard = ({ post }: PostCardProps) => {
  return (
    <div className="p-3 border-b border-gray-700">
      <div className="flex gap-3">
        <img src={post.user?.avatar||post.avatar||'/assets/images/react.svg'} className="w-10 h-10 rounded-full" />
        <div className="flex-1">
          <div className="font-semibold">@{post.user?.username||post.username}</div>
          <div>{post.content||post.text}</div>
          <div className="flex gap-2 mt-2">
            <LikeButton />
            <RetweetButton />
          </div>
        </div>
      </div>
    </div>
  );
};

export default PostCard;
export { PostCard };
