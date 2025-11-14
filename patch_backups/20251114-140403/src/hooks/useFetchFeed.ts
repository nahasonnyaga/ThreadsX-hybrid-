import { useState, useEffect } from 'react';
import { PostService } from '../services/postService';

export function useFetchFeed() {
  const [posts, setPosts] = useState([]);

  const fetchPosts = async () => {
    const data = await PostService.fetchPosts();
    setPosts(data);
  };

  useEffect(() => { fetchPosts(); }, []);

  return { posts, fetchPosts };
}
