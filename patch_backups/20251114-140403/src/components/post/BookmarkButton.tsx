
import { useState } from 'react';

export default function BookmarkButton() {
  const [bookmarked, setBookmarked] = useState(false);

  return (
    <button
      onClick={() => setBookmarked(!bookmarked)}
      className={bookmarked ? 'text-yellow-400' : 'text-gray-400'}
    >
      🔖
    </button>
  );
}
