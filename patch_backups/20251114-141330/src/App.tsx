import React from 'react';

import { FeedPage } from './pages/FeedPage';
import { BottomNav } from './components/navigation/BottomNav';
import { LiveFeedIndicator } from './components/feed/LiveFeedIndicator';

function App() {
  return (
    <div className="bg-gray-100 min-h-screen">
      <LiveFeedIndicator />
      <FeedPage />
      <BottomNav />
    </div>
  );
}

export default App;
