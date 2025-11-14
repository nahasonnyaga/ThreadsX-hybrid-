import React, { useState, useEffect } from "react";

import { FederatedInteractionService } from '../../services/federatedInteractionService';

interface CommentSectionProps {
  postId: string | number;
  initialReplies: number;
  federated?: boolean;
}

export const CommentSection: React.FC<CommentSectionProps> = ({ postId, initialReplies, federated }) => {
  const [replies, setReplies] = useState(initialReplies);
  const [comment, setComment] = useState('');

  const handleReply = async () => {
    if (!comment.trim()) return;
    setReplies(replies + 1);
    setComment('');
    if (federated) {
      await (FederatedInteractionService as any).replyToPost?.(postId.toString(), comment);
    }
  };

  return (
    <div className="comment-section">
      <input
        type="text"
        value={comment}
        placeholder="Write a reply..."
        onChange={(e) => setComment(e.target.value)}
      />
      <button onClick={handleReply}>💬 Reply ({replies})</button>
    </div>
  );
};
