import { useEffect, useState } from 'react';
import { ProfileService } from '../services/profileService';
import type { Profile } from '../types/profile'; // type-only import

export const useProfilePosts = (username: string) => {
  const [posts, setPosts] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);

  const fetchPosts = async () => {
    setLoading(true);

    const profile: Profile = await ProfileService.fetchProfile(username) as Profile;

    const combinedPosts = [
      ...(profile.federatedPosts ?? []), // fallback if undefined
      // optionally, append local posts here
    ];

    setPosts(combinedPosts);
    setLoading(false);
  };

  useEffect(() => {
    fetchPosts();
  }, [username]);

  return { posts, loading, refresh: fetchPosts };
};
