import React, { useState } from "react";

export interface RetweetButtonProps {
  postId?: string | number;
  retweets?: number;
  federated?: boolean;
  onRetweet?: (postId?: string | number) => Promise<void> | void;
}

export default function RetweetButton({ postId, retweets = 0, federated = false, onRetweet }: RetweetButtonProps) {
  const [count, setCount] = useState<number>(retweets);
  const [retweeted, setRetweeted] = useState<boolean>(false);

  async function handleClick() {
    setRetweeted(prev => !prev);
    setCount(prev => (retweeted ? prev - 1 : prev + 1));
    if (onRetweet) {
      try { await onRetweet(postId); } catch (e) { /* ignore */ }
    }
  }

  return (
    <button onClick={handleClick} aria-label="retweet" className="flex items-center gap-1">
      <span>{retweeted ? "🔁" : "🔄"}</span>
      <span>{count}</span>
    </button>
  );
}
