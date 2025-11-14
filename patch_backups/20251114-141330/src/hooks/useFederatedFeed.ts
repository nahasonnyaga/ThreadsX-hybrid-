import { useEffect, useState } from 'react';
import { FederatedFeedService } from '../services/federatedFeedService';

export function useFederatedFeed(refreshInterval = 30000) {
  const [feed, setFeed] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);

  async function loadFeed() {
    setLoading(true);
    const posts = await FederatedFeedService.getUnifiedFeed();
    setFeed(posts);
    setLoading(false);
  }

  useEffect(() => {
    loadFeed();
    const interval = setInterval(loadFeed, refreshInterval);
    return () => clearInterval(interval);
  }, []);

  return { feed, loading, refresh: loadFeed };
}
