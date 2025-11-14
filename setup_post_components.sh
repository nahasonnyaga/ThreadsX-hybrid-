#!/bin/bash
echo "Creating Post components and collapsible bottom menu..."

mkdir -p src/components/post

# PostCard.tsx
cat << 'EOL' > src/components/post/PostCard.tsx
import React, { useState } from 'react';
import { Avatar } from '../ui/Avatar';
import { LikeButton } from './LikeButton';
import { RetweetButton } from './RetweetButton';

export function PostCard({ post }: any) {
  const [showActions, setShowActions] = useState(false);

  return (
    <div style={{ border: '1px solid #ddd', padding: '15px', marginBottom: '10px', borderRadius: '8px' }}
         onMouseEnter={() => setShowActions(true)}
         onMouseLeave={() => setShowActions(false)}>
      <div style={{ display: 'flex', alignItems: 'center', marginBottom: '10px' }}>
        <Avatar src={post.avatar} size={50} />
        <div style={{ marginLeft: '10px' }}>
          <strong>{post.username}</strong>
          <p>{post.content}</p>
        </div>
      </div>
      {showActions && (
        <div style={{ display: 'flex', justifyContent: 'space-around', marginTop: '10px' }}>
          <LikeButton likes={post.likes} />
          <RetweetButton retweets={post.retweets} />
        </div>
      )}
    </div>
  );
}
EOL

# CommentSection.tsx
cat << 'EOL' > src/components/post/CommentSection.tsx
import React, { useState } from 'react';
import { Avatar } from '../ui/Avatar';

export function CommentSection({ comments }: any) {
  const [newComment, setNewComment] = useState('');
  return (
    <div style={{ marginTop: '10px' }}>
      {comments.map((c: any, index: number) => (
        <div key={index} style={{ display: 'flex', marginBottom: '5px' }}>
          <Avatar src={c.avatar} size={30} />
          <p style={{ marginLeft: '5px' }}><strong>{c.username}</strong> {c.text}</p>
        </div>
      ))}
      <input
        type="text"
        value={newComment}
        placeholder="Add a comment..."
        onChange={(e) => setNewComment(e.target.value)}
        style={{ width: '100%', padding: '6px', borderRadius: '6px', border: '1px solid #ccc' }}
      />
    </div>
  );
}
EOL

# LikeButton.tsx
cat << 'EOL' > src/components/post/LikeButton.tsx
import React, { useState } from 'react';

export function LikeButton({ likes }: any) {
  const [count, setCount] = useState(likes);
  return (
    <button onClick={() => setCount(count + 1)} style={{ cursor: 'pointer' }}>❤️ {count}</button>
  );
}
EOL

# RetweetButton.tsx
cat << 'EOL' > src/components/post/RetweetButton.tsx
import React, { useState } from 'react';

export function RetweetButton({ retweets }: any) {
  const [count, setCount] = useState(retweets);
  return (
    <button onClick={() => setCount(count + 1)} style={{ cursor: 'pointer' }}>🔁 {count}</button>
  );
}
EOL

# MediaPreview.tsx
cat << 'EOL' > src/components/post/MediaPreview.tsx
import React from 'react';

export function MediaPreview({ src, type }: any) {
  if(type === 'video') return <video src={src} controls style={{ width: '100%', borderRadius: '8px' }} />;
  return <img src={src} alt="media" style={{ width: '100%', borderRadius: '8px' }} />;
}
EOL

# Poll.tsx
cat << 'EOL' > src/components/post/Poll.tsx
import React, { useState } from 'react';

export function Poll({ options }: any) {
  const [votes, setVotes] = useState(options.map(() => 0));
  const vote = (index: number) => {
    const newVotes = [...votes];
    newVotes[index]++;
    setVotes(newVotes);
  };
  return (
    <div>
      {options.map((o: string, i: number) => (
        <button key={i} onClick={() => vote(i)} style={{ display: 'block', width: '100%', margin: '4px 0' }}>
          {o} ({votes[i]})
        </button>
      ))}
    </div>
  );
}
EOL

# Collapsible Bottom Menu
mkdir -p src/components/ui
cat << 'EOL' > src/components/ui/BottomMenu.tsx
import React, { useEffect, useState } from 'react';

export function BottomMenu() {
  const [visible, setVisible] = useState(true);
  let lastScroll = window.scrollY;

  const handleScroll = () => {
    const current = window.scrollY;
    setVisible(current < lastScroll); // hide on scroll down, show on scroll up
    lastScroll = current;
  };

  useEffect(() => {
    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  return visible ? (
    <div style={{
      position: 'fixed', bottom: 0, left: 0, width: '100%', height: '60px',
      background: '#1DA1F2', display: 'flex', justifyContent: 'space-around', alignItems: 'center', color: '#fff'
    }}>
      <span>🏠 Home</span>
      <span>🔍 Explore</span>
      <span>➕ Create</span>
      <span>🔔 Notifications</span>
      <span>👤 Profile</span>
    </div>
  ) : null;
}
EOL

echo "Post components and collapsible bottom menu created!"
