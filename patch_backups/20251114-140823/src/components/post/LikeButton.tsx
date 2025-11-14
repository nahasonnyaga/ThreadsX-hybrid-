import React, { useState } from "react";

export interface LikeButtonProps {
  postId?: string | number;
  initialLikes?: number;
  likes?: number;
  federated?: boolean;
  onLike?: (postId?: string | number) => Promise<void> | void;
}

export default function LikeButton(props: LikeButtonProps) {
  const initial = props.initialLikes ?? props.likes ?? 0;
  const [count, setCount] = useState<number>(initial);
  const [liked, setLiked] = useState<boolean>(false);

  async function handleClick() {
    setLiked(prev => !prev);
    setCount(prev => (liked ? prev - 1 : prev + 1));
    if (props.onLike) {
      try { await props.onLike(props.postId); } catch (e) { /* ignore */ }
    }
  }

  return (
    <button onClick={handleClick} aria-label="like" className="flex items-center gap-1">
      <span>{liked ? "💖" : "🤍"}</span>
      <span>{count}</span>
    </button>
  );
}
