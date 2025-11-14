import React, { useState, useEffect } from 'react';

import { UnifiedFeedService } from '@/services/unifiedFeedService';

export default function UnifiedFeed() {
  const [feed, setFeed] = useState<any[]>([]);
  useEffect(() => {
    let mounted = true;
    async function load(){ const data = await UnifiedFeedService.fetchUnifiedFeed(); if(mounted) setFeed(data); }
    load();
    return () => { mounted = false; }
  },[]);
  return (
    <div className="divide-y divide-gray-800">
      {feed.map((p,i)=>(
        <div key={i} className="p-3 border-b border-gray-700">
          <img src={p.user?.avatar||p.avatar||'/assets/images/react.svg'} className="w-10 h-10 rounded-full inline-block mr-3" />
          <strong>@{p.user?.username||p.username}</strong>
          <div>{p.content||p.text||p.status}</div>
        </div>
      ))}
    </div>
  );
}
