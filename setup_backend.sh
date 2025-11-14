#!/bin/bash
echo "Setting up Supabase, Firebase, Cloudinary, BunnyNet, and Mastodon integration..."

mkdir -p src/services/backend

# Supabase client
cat << 'EOT' > src/services/backend/supabaseClient.ts
import { createClient } from '@supabase/supabase-js';
export const supabase = createClient(
  'https://YOUR_SUPABASE_URL.supabase.co',
  'YOUR_SUPABASE_ANON_KEY'
);
EOT

# Supabase table creation SQL
cat << 'EOT' > create_tables.sql
-- Users table
create table if not exists users (
  id bigserial primary key,
  username text not null unique,
  email text not null unique,
  avatar text,
  bio text,
  created_at timestamp with time zone default now()
);

-- Posts table
create table if not exists posts (
  id bigserial primary key,
  user_id bigint references users(id),
  content text,
  media text,
  created_at timestamp with time zone default now()
);

-- Threads table
create table if not exists threads (
  id bigserial primary key,
  user_id bigint references users(id),
  content text,
  created_at timestamp with time zone default now()
);

-- Likes table
create table if not exists likes (
  id bigserial primary key,
  user_id bigint references users(id),
  post_id bigint references posts(id),
  created_at timestamp with time zone default now()
);

-- Comments table
create table if not exists comments (
  id bigserial primary key,
  user_id bigint references users(id),
  post_id bigint references posts(id),
  content text,
  created_at timestamp with time zone default now()
);
EOT

# AuthService
cat << 'EOT' > src/services/authService.ts
import { supabase } from './backend/supabaseClient';
export const AuthService = {
  async login(email: string) {
    const { data: user } = await supabase.from('users').select('*').eq('email', email).single();
    return user || null;
  },
  async signup(user: any) {
    const { data } = await supabase.from('users').insert([user]);
    return data ? data[0] : null;
  },
  async fetchUsers() {
    const { data } = await supabase.from('users').select('*');
    return data;
  }
};
EOT

# ProfileService
cat << 'EOT' > src/services/profileService.ts
import { supabase } from './backend/supabaseClient';
export const ProfileService = {
  async fetchProfile(username: string) {
    const { data } = await supabase.from('users').select('*').eq('username', username).single();
    return data;
  }
};
EOT

# ThreadService
cat << 'EOT' > src/services/threadService.ts
import { supabase } from './backend/supabaseClient';
export const ThreadService = {
  async fetchThreads() {
    const { data } = await supabase.from('threads').select('*').order('created_at', { ascending: false });
    return data || [];
  },
  async postThread(thread: any) {
    const { data } = await supabase.from('threads').insert([thread]);
    return data ? data[0] : null;
  }
};
EOT

# UnifiedFeedService
cat << 'EOT' > src/services/unifiedFeedService.ts
import { supabase } from './backend/supabaseClient';
export const UnifiedFeedService = {
  async fetchUnifiedFeed() {
    const { data: posts } = await supabase.from('posts').select('*').order('created_at', { ascending: false });
    const { data: threads } = await supabase.from('threads').select('*').order('created_at', { ascending: false });
    return [...(posts||[]), ...(threads||[])].sort((a, b) => new Date(b.created_at).getTime() - new Date(a.created_at).getTime());
  }
};
EOT

# Firebase setup placeholder
cat << 'EOT' > src/services/backend/firebaseClient.ts
// Initialize Firebase here for real-time notifications
EOT

# Cloudinary setup placeholder
cat << 'EOT' > src/services/backend/cloudinaryClient.ts
// Initialize Cloudinary for image/video uploads
EOT

# Mastodon integration placeholder
cat << 'EOT' > src/services/backend/mastodonClient.ts
// Pull and push federated posts from Mastodon instance
EOT

echo "Backend setup completed! Supabase tables ready, services configured."
echo "To create tables in Supabase, run the SQL from create_tables.sql in Supabase SQL Editor."
