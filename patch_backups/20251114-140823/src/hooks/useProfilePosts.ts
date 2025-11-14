import { useEffect, useState } from 'react';
import { ProfileService } from '../services/profileService';

export const useProfilePosts = (username: string) => {
  const [posts, setPosts] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);

  const fetchPosts = async () => {
    setLoading(true);
    const profile = await ProfileService.fetchProfile(username);
    const combinedPosts = [
      ...profile.federatedPosts,
      // optionally, you can append local posts here
    ];
    setPosts(combinedPosts);
    setLoading(false);
  };

  useEffect(() => {
    fetchPosts();
  }, [username]);

  return { posts, loading, refresh: fetchPosts };
};
