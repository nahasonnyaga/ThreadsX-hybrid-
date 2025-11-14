import { UnifiedFeedService } from './unifiedFeedService';
export const FeedService = {
  async fetch() { return UnifiedFeedService.fetchUnifiedFeed(); }
};
export default FeedService;
