#!/bin/bash
echo "Updating Home.tsx to include Communities and Spaces..."

cat << 'EOF2' > src/pages/Home.tsx
import React, { useEffect, useState } from 'react';
import { feedService } from '../services/feedService';
import VideoCard from '../components/feed/VideoCard';
import ThreadCard from '../components/feed/ThreadCard';
import TrendingCard from '../components/feed/TrendingCard';
import CommunityCard from '../components/feed/CommunityCard';
import SpaceCard from '../components/feed/SpaceCard';

const Home: React.FC = () => {
  const [feed, setFeed] = useState<any>({
    videos: [],
    threads: [],
    communities: [],
    spaces: [],
    trending: []
  });

  useEffect(() => {
    const fetchFeed = async () => {
      const data = await feedService.getFeed();
      setFeed(data);
    };
    fetchFeed();
  }, []);

  return (
    <div className="flex flex-col md:flex-row p-4 gap-4">
      {/* Main feed */}
      <div className="flex-1 space-y-4">
        {feed.videos.map((v:any, idx:number) => <VideoCard key={idx} {...v} />)}
        {feed.threads.map((t:any, idx:number) => <ThreadCard key={idx} {...t} />)}
        {feed.communities.map((c:any, idx:number) => <CommunityCard key={idx} {...c} />)}
        {feed.spaces.map((s:any, idx:number) => <SpaceCard key={idx} {...s} />)}
      </div>

      {/* Sidebar */}
      <div className="w-full md:w-1/3 space-y-4">
        <h2 className="font-bold text-lg">Trending</h2>
        {feed.trending.map((t:any, idx:number) => <TrendingCard key={idx} {...t} />)}
      </div>
    </div>
  );
};

export default Home;
EOF2

echo "Home.tsx updated with Communities and Spaces!"
