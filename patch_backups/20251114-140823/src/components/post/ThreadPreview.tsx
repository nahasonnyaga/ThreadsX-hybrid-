
import ThreadCard from './ThreadCard';

export function ThreadPreview({ threads }: { threads: any[] }) {
  return (
    <div>
      {threads.map(thread => <ThreadCard key={thread.id} thread={thread} />)}
    </div>
  );
}
