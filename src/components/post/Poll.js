import React, { useState } from "react";
export function Poll({ options }) {
    const [votes, setVotes] = useState(options.map(() => 0));
    const vote = (index) => {
        const newVotes = [...votes];
        newVotes[index]++;
        setVotes(newVotes);
    };
    return (<div>
      {options.map((o, i) => (<button key={i} onClick={() => vote(i)} style={{ display: 'block', width: '100%', margin: '4px 0' }}>
          {o} ({votes[i]})
        </button>))}
    </div>);
}
