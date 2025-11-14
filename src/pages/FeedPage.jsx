// src/pages/FeedPage.tsx
import React from 'react';
import UnifiedFeed from "../components/UnifiedFeed"; // ✅ fixed relative path
export const FeedPage = () => {
    return (<div className="p-4">
      <UnifiedFeed />
    </div>);
};
export default FeedPage;
