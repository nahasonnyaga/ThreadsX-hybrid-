export type FederatedProfile = {
  username: string;
  avatar: string;
  bio?: string;
  note?: string; // optional
  followers_count: number;
  following_count: number;
  statuses_count: number;
};
