import React, { useState } from "react";

export interface LikeButtonProps {
  postId?: string | number;
  likes?: number;
  federated?: boolean;
  onLike?: (postId?: string | number) => Promise<void> | void;
}

export default function LikeButton({ postId, likes = 0, federated = false, onLike }: LikeButtonProps) {
  const [count, setCount] = useState<number>(likes);
  const [liked, setLiked] = useState<boolean>(false);

  async function handleClick() {
    setLiked(prev => !prev);
    setCount(prev => (liked ? prev - 1 : prev + 1));
    if (onLike) {
      try { await onLike(postId); } catch (e) { /* ignore */ }
    }
  }

  return (
    <button onClick={handleClick} aria-label="like" className="flex items-center gap-1">
      <span>{liked ? "💖" : "🤍"}</span>
      <span>{count}</span>
    </button>
  );
}
