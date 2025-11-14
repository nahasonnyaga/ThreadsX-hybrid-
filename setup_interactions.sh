#!/bin/bash
echo "Creating Post Interactions Components..."

mkdir -p src/components/post

# LikeButton.tsx
cat << 'EOL' > src/components/post/LikeButton.tsx
import React, { useState } from 'react';

export function LikeButton({ initialLikes = 0 }: any) {
  const [likes, setLikes] = useState(initialLikes);
  return <button onClick={() => setLikes(likes + 1)}>❤️ {likes}</button>;
}
EOL

# RetweetButton.tsx
cat << 'EOL' > src/components/post/RetweetButton.tsx
import React, { useState } from 'react';

export function RetweetButton({ initialRetweets = 0 }: any) {
  const [retweets, setRetweets] = useState(initialRetweets);
  return <button onClick={() => setRetweets(retweets + 1)}>🔁 {retweets}</button>;
}
EOL

# BookmarkButton.tsx
cat << 'EOL' > src/components/post/BookmarkButton.tsx
import React, { useState } from 'react';

export function BookmarkButton() {
  const [bookmarked, setBookmarked] = useState(false);
  return <button onClick={() => setBookmarked(!bookmarked)}>{bookmarked ? '🔖' : '📑'}</button>;
}
EOL

# CommentSection.tsx
cat << 'EOL' > src/components/post/CommentSection.tsx
import React, { useState } from 'react';

export function CommentSection({ initialComments = [] }: any) {
  const [comments, setComments] = useState(initialComments);
  const [newComment, setNewComment] = useState('');

  const addComment = () => {
    if (newComment.trim()) {
      setComments([...comments, newComment]);
      setNewComment('');
    }
  };

  return (
    <div>
      <h4>Comments</h4>
      {comments.map((c, i) => <p key={i}>💬 {c}</p>)}
      <input value={newComment} onChange={e => setNewComment(e.target.value)} placeholder="Add a comment..." />
      <button onClick={addComment}>Add</button>
    </div>
  );
}
EOL

# Poll.tsx
cat << 'EOL' > src/components/post/Poll.tsx
import React, { useState } from 'react';

export function Poll({ question, options }: any) {
  const [votes, setVotes] = useState(options.map(() => 0));

  const vote = (index: number) => {
    const newVotes = [...votes];
    newVotes[index]++;
    setVotes(newVotes);
  };

  return (
    <div>
      <h4>{question}</h4>
      {options.map((opt: string, idx: number) => (
        <div key={idx}>
          <button onClick={() => vote(idx)}>{opt} ({votes[idx]})</button>
        </div>
      ))}
    </div>
  );
}
EOL

echo "Post Interaction Components created!"
