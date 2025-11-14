
import { FederatedInteractionsService } from '../../services/federatedInteractionsService';

interface FollowButtonProps {
  userHandle: string;
  isFollowing?: boolean;
}

export const FollowButton: React.FC<FollowButtonProps> = ({ userHandle, isFollowing = false }) => {
  const [following, setFollowing] = useState(isFollowing);
  const [loading, setLoading] = useState(false);

  const toggleFollow = async () => {
    setLoading(true);
    const newStatus = await FederatedInteractionsService.toggleFollow(userHandle, following);
    setFollowing(newStatus);
    setLoading(false);
  };

  return (
    <button
      onClick={toggleFollow}
      disabled={loading}
      className={`px-4 py-1 rounded-full border ${
        following
          ? 'bg-gray-800 text-white border-gray-700'
          : 'bg-blue-500 text-white border-blue-500'
      } transition-all duration-200`}
    >
      {loading ? '...' : following ? 'Following' : 'Follow'}
    </button>
  );
};
