import React from 'react';
import ThreadCard from './ThreadCard';
export function ThreadPreview({ threads }) {
    return (<div>
      {threads.map(thread => <ThreadCard key={thread.id} thread={thread}/>)}
    </div>);
}
