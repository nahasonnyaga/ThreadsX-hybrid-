#!/bin/bash
echo "Creating Hooks..."
mkdir -p src/hooks

# useAuth
cat << 'EOL' > src/hooks/useAuth.ts
import { useState } from 'react';
import { AuthService } from '../services/authService';

export function useAuth() {
  const [user, setUser] = useState(null);

  const login = async (email: string) => {
    const u = await AuthService.login(email);
    setUser(u);
    return u;
  };

  const signup = async (user: any) => {
    const u = await AuthService.signup(user);
    setUser(u);
    return u;
  };

  return { user, login, signup };
}
EOL

# useFetchFeed
cat << 'EOL' > src/hooks/useFetchFeed.ts
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
EOL

# useTheme
cat << 'EOL' > src/hooks/useTheme.ts
import { useState } from 'react';
export function useTheme() {
  const [theme, setTheme] = useState('light');
  const toggleTheme = () => setTheme(theme === 'light' ? 'dark' : 'light');
  return { theme, toggleTheme };
}
EOL

echo "Hooks created!"
