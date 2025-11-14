import { useEffect, useState } from 'react';
import { ProfileService } from '../services/profileService';
export const useProfilePosts = (username) => {
    const [posts, setPosts] = useState([]);
    const [loading, setLoading] = useState(true);
    const fetchPosts = async () => {
        setLoading(true);
        const profile = await ProfileService.fetchProfile(username);
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
