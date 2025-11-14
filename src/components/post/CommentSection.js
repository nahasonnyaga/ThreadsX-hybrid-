import React, { useState } from "react";
import { FederatedInteractionService } from '../../services/federatedInteractionService';
export const CommentSection = ({ postId, initialReplies, federated }) => {
    const [replies, setReplies] = useState(initialReplies);
    const [comment, setComment] = useState('');
    const handleReply = async () => {
        if (!comment.trim())
            return;
        setReplies(replies + 1);
        setComment('');
        if (federated) {
            await FederatedInteractionService.replyToPost?.(postId.toString(), comment);
        }
    };
    return (<div className="comment-section">
      <input type="text" value={comment} placeholder="Write a reply..." onChange={(e) => setComment(e.target.value)}/>
      <button onClick={handleReply}>💬 Reply ({replies})</button>
    </div>);
};
