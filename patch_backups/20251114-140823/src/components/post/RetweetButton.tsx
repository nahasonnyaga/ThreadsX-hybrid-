import React, { useState } from "react";

export interface RetweetButtonProps {
  postId?: string | number;
  initialRetweets?: number;
  retweets?: number;
  federated?: boolean;
  onRetweet?: (postId?: string | number) => Promise<void> | void;
}

export default function RetweetButton(props: RetweetButtonProps) {
  const initial = props.initialRetweets ?? props.retweets ?? 0;
  const [count, setCount] = useState<number>(initial);
  const [retweeted, setRetweeted] = useState<boolean>(false);

  async function handleClick() {
    setRetweeted(prev => !prev);
    setCount(prev => (retweeted ? prev - 1 : prev + 1));
    if (props.onRetweet) {
      try { await props.onRetweet(props.postId); } catch (e) { /* ignore */ }
    }
  }

  return (
    <button onClick={handleClick} aria-label="retweet" className="flex items-center gap-1">
      <span>{retweeted ? "🔁" : "🔄"}</span>
      <span>{count}</span>
    </button>
  );
}
