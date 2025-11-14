import { createClient } from '@supabase/supabase-js';
import { mastodonFetchUser } from './mastodonService';
import { ProfileService } from './profileService';

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL!;
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY!;
const supabase = createClient(supabaseUrl, supabaseAnonKey);

export const FederatedProfileService = {
  async getUnifiedProfile(username: string) {
    try {
      // ✅ Fetch local profile from Supabase or mock ProfileService
      const localProfile = await ProfileService.fetchProfile(username);

      // 🌍 Fetch Mastodon profile data
      const federatedProfile = await mastodonFetchUser(username);

      // 🧩 Merge both profiles
      return {
        username: localProfile?.username || federatedProfile?.username,
        avatar: federatedProfile?.avatar || localProfile?.avatar,
        bio: federatedProfile?.note || localProfile?.bio,
        followers: (localProfile?.followers || 0) + (federatedProfile?.followers_count || 0),
        following: (localProfile?.following || 0) + (federatedProfile?.following_count || 0),
        posts: (localProfile?.posts || 0) + (federatedProfile?.statuses_count || 0),
        source: {
          local: !!localProfile,
          federated: !!federatedProfile,
        },
      };
    } catch (error) {
      console.error('Error merging federated profile:', error);
      return null;
    }
  },
};
