
import { useFederatedFeed } from '../../hooks/useFederatedFeed';

export const FederatedFeed: React.FC = () => {
  const { feed, loading, refresh } = useFederatedFeed();

  if (loading) return <p className="text-center py-8 text-gray-400">Loading unified feed...</p>;

  return (
    <div className="flex flex-col divide-y divide-gray-800">
      <div className="flex justify-between items-center px-4 py-2 bg-black sticky top-0 border-b border-gray-800 z-10">
        <h1 className="text-xl font-bold">For You</h1>
        <button
          onClick={refresh}
          className="text-sm text-blue-400 hover:text-blue-500 transition"
        >
          Refresh
        </button>
      </div>

      {feed.map((post) => (
        <div key={post.id} className="p-4 hover:bg-gray-900 transition">
          <div className="flex items-start gap-3">
            <div className="w-10 h-10 bg-gray-700 rounded-full"></div>
            <div className="flex-1">
              <div className="flex justify-between items-center">
                <p className="text-sm font-semibold">
                  @{post.user_id}
                  {post.federated && <span className="ml-2 text-gray-500">(federated)</span>}
                </p>
                <span className="text-xs text-gray-500">
                  {new Date(post.created_at).toLocaleString()}
                </span>
              </div>
              <div
                className="mt-2 text-gray-100 text-sm leading-snug"
                dangerouslySetInnerHTML={{ __html: post.content }}
              ></div>
              {post.media_url && (
                <img
                  src={post.media_url}
                  alt=""
                  className="rounded-xl mt-2 border border-gray-700 max-h-80 object-cover"
                />
              )}
              <div className="flex gap-6 mt-2 text-sm text-gray-500">
                <span>💬 {post.reply_count || 0}</span>
                <span>❤️ {post.like_count || 0}</span>
              </div>
            </div>
          </div>
        </div>
      ))}
    </div>
  );
};
