
type Props = { topic: string; count: number };

const TrendingCard: React.FC<Props> = ({ topic, count }) => {
  return (
    <div className="border-b py-2">
      <p className="text-sm text-gray-500">Trending</p>
      <p className="font-bold">{topic} ({count} posts)</p>
    </div>
  );
};

export default TrendingCard;
