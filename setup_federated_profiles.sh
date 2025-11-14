#!/bin/bash
echo "Setting up federated profile pages..."

# 1️⃣ Update ProfileService to include federated posts
cat << 'EOT' > src/services/profileService.ts
import { ThreadService } from './threadService';
import { fetchSupabasePosts } from './supabaseService';
import { fetchMastodonPosts } from './mastodonService';

export const ProfileService = {
  async fetchProfile(username: string) {
    // Simulate fetching user profile
    const profile = {
      username,
      avatar: '/assets/images/react.svg',
      bio: 'This is a user bio',
      followers: 120,
      following: 75,
      posts: 0,
    };

    // Fetch all posts from local, Supabase, and Mastodon
    const localPosts = (await ThreadService.fetchThreads()).filter(p => p.user === username);
    const supabasePosts = (await fetchSupabasePosts()).filter(p => p.user?.username === username);
    const mastodonPosts = (await fetchMastodonPosts()).filter(p => p.user?.username === username);

    const allPosts = [...localPosts, ...supabasePosts, ...mastodonPosts];
    allPosts.sort((a,b) => (b.timestamp || 0) - (a.timestamp || 0));

    profile.posts = allPosts.length;
    profile['feed'] = allPosts;

    return profile;
  }
};
EOT

# 2️⃣ Update Profile page to display federated posts
cat << 'EOT' > src/pages/Profile.tsx
import { useEffect, useState } from 'react';
import { ProfileService } from '@/services/profileService';

export default function Profile({ username = 'JaneDoe' }) {
  const [profile, setProfile] = useState<any>(null);

  useEffect(() => {
    let mounted = true;
    async function loadProfile() {
      const data = await ProfileService.fetchProfile(username);
      if (mounted) setProfile(data);
    }
    loadProfile();
    return () => { mounted = false; }
  }, [username]);

  if (!profile) return <p className="text-center py-10 text-gray-400">Loading profile...</p>;

  return (
    <div className="p-4">
      <div className="flex items-center gap-4">
        <img src={profile.avatar} alt={profile.username} className="w-16 h-16 rounded-full" />
        <div>
          <h2 className="font-bold text-lg">{profile.username}</h2>
          <p className="text-gray-400">{profile.bio}</p>
          <p className="text-sm text-gray-500">{profile.followers} Followers • {profile.following} Following • {profile.posts} Posts</p>
        </div>
      </div>
      <div className="mt-6 divide-y divide-gray-800">
        {profile.feed.length === 0 && <p className="py-6 text-gray-400 text-center">No posts yet.</p>}
        {profile.feed.map((p:any,i:number) => (
          <div key={i} className="p-4 hover:bg-gray-900 transition cursor-pointer flex gap-3">
            <img src={p.user?.avatar || '/assets/images/react.svg'} alt={p.user?.username || 'user'} className="w-10 h-10 rounded-full" />
            <div className="flex-1">
              <p className="font-semibold text-sm">@{p.user?.username || p.username}</p>
              <p>{p.content || p.text || p.status}</p>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
EOT

echo "Federated profiles now show Mastodon + Supabase + local threads in one click!"
