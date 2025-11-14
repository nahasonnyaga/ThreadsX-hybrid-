import type { FederatedProfile } from '../types/federatedProfile';

export const processFederatedProfile = (federatedProfile?: FederatedProfile, localProfile?: any) => {
  return {
    bio: federatedProfile?.note ?? federatedProfile?.bio ?? localProfile?.bio ?? '',
    username: federatedProfile?.username ?? localProfile?.username ?? '',
    avatar: federatedProfile?.avatar ?? localProfile?.avatar ?? '',
    followers_count: federatedProfile?.followers_count ?? localProfile?.followers ?? 0,
    following_count: federatedProfile?.following_count ?? localProfile?.following ?? 0,
    statuses_count: federatedProfile?.statuses_count ?? localProfile?.posts ?? 0,
  };
};
