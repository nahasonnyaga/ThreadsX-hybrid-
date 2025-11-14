
type NotificationCardProps = {
  type: string;
  message: string;
  user: string;
  timestamp: string;
};

const NotificationCard: React.FC<NotificationCardProps> = ({ type, message, user, timestamp }) => {
  const bgColor = type === 'like' ? 'bg-red-100' :
                  type === 'reply' ? 'bg-blue-100' :
                  type === 'mention' ? 'bg-green-100' : 'bg-yellow-100';

  return (
    <div className={`p-3 mb-2 rounded-md ${bgColor}`}>
      <p>
        <strong>{user}</strong> {message} <span className="text-gray-500 text-sm">({timestamp})</span>
      </p>
    </div>
  );
};

export default NotificationCard;
