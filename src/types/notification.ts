export type Notification = {
  id: number;
  type: string;
  user: string;
  message: string;
  timestamp: string;
  read?: boolean;
};
