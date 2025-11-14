#!/bin/bash
echo "Creating Feed Component..."

mkdir -p src/components/feed

# Feed.tsx
cat << 'EOL' > src/components/feed/Feed.tsx
import React, { useEffect, useState } from 'react';
import { PostCard } from './PostCard';
import { ThreadCard } from './ThreadCard';
import { VideoCard } from './VideoCard';
import { CommunityCard } from './CommunityCard';
import { PostService } from '../../services/postService';
import { ThreadService } from '../../services/threadService';
import { VideoService } from '../../services/videoService';
import { CommunityService } from '../../services/communityService';

export function Feed() {
  const [posts, setPosts] = useState<any[]>([]);
  const [threads, setThreads] = useState<any[]>([]);
  const [videos, setVideos] = useState<any[]>([]);
  const [communities, setCommunities] = useState<any[]>([]);

  useEffect(() => {
    PostService.fetchPosts().then(setPosts);
    ThreadService.fetchThreads().then(setThreads);
    VideoService.fetchVideos().then(setVideos);
    CommunityService.fetchCommunities().then(setCommunities);
  }, []);

  return (
    <div>
      <h2>Communities</h2>
      {communities.map(c => <CommunityCard key={c.id} {...c} />)}

      <h2>Posts</h2>
      {posts.map(p => <PostCard key={p.id} {...p} />)}

      <h2>Threads</h2>
      {threads.map(t => <ThreadCard key={t.id} {...t} />)}

      <h2>Videos</h2>
      {videos.map(v => <VideoCard key={v.id} {...v} />)}
    </div>
  );
}
EOL

echo "Feed Component created!"
