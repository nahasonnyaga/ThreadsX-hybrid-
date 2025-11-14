import React from 'react';

import LikeButton from '../post/LikeButton';
import RetweetButton from '../post/RetweetButton';
import { CommentSection } from '../post/CommentSection';

interface PostCardProps {
  post: {
    id: string | number;
    user: string;
    avatar: string;
    content: string;
    likes: number;
    retweets: number;
    replies: number;
    federated?: boolean;
  };
}

export const PostCard: React.FC<PostCardProps> = ({ post }) => {
  return (
    <div className="post-card">
      <div className="post-header">
        <img src={post.avatar} alt={post.user} className="avatar" />
        <strong>{post.user}</strong>
      </div>
      <div className="post-content">{post.content}</div>
      <div className="post-actions">
        <LikeButton postId={post.id} likes={post.likes} federated={post.federated} />
        <RetweetButton postId={post.id} retweets={post.retweets} federated={post.federated} />
        <CommentSection postId={post.id} initialReplies={post.replies} federated={post.federated} />
      </div>
    </div>
  );
};
