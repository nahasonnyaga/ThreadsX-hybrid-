import React, { useState, useEffect } from "react";

export function Poll({ options }: any) {
  const [votes, setVotes] = useState(options.map(() => 0));
  const vote = (index: number) => {
    const newVotes = [...votes];
    newVotes[index]++;
    setVotes(newVotes);
  };
  return (
    <div>
      {options.map((o: string, i: number) => (
        <button key={i} onClick={() => vote(i)} style={{ display: 'block', width: '100%', margin: '4px 0' }}>
          {o} ({votes[i]})
        </button>
      ))}
    </div>
  );
}
