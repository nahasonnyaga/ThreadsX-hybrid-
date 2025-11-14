import React, { useState, useEffect } from 'react';
import ThreadCard from "@/components/post/ThreadCard";
import { UnifiedFeedService } from "@/services/unifiedFeedService";

export default function Threads() {
  const [threads, setThreads] = useState<any[]>([]);
  useEffect(() => {
    let mounted = true;
    (async () => {
      try {
        const data = await UnifiedFeedService.fetchUnifiedFeed();
        if (mounted) setThreads((data || []).filter((p:any)=>p.type === 'thread'));
      } catch(e) {
        if (mounted) setThreads([]);
      }
    })();
    return () => { mounted = false; };
  }, []);
  return <div>{threads.map((t,i)=><ThreadCard key={i} thread={t} />)}</div>;
}
