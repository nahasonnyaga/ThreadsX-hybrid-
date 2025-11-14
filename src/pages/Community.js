import React, { useState, useEffect } from "react";
/**
 * Safe Community page — uses an async loader and state so .map() runs on arrays.
 * Replace fetchCommunities() with your real service.
 */
async function fetchCommunities() {
    // stub data — replace with communityService.fetchAll()
    return [
        { id: 1, name: "Tech", members: 1200, posts: 345 },
        { id: 2, name: "Music", members: 800, posts: 120 }
    ];
}
export default function Community() {
    const [communities, setCommunities] = useState([]);
    useEffect(() => {
        let mounted = true;
        (async () => {
            const data = await fetchCommunities();
            if (mounted)
                setCommunities(data || []);
        })();
        return () => { mounted = false; };
    }, []);
    return (<div className="p-4">
      <h1 className="text-xl font-bold mb-4">Communities</h1>
      {communities.length === 0 && <p className="text-gray-400">No communities yet.</p>}
      {communities.map((comm) => (<div key={comm.id} className="p-3 border-b">
          <strong>{comm.name}</strong>
          <div>{comm.members} members — {comm.posts} posts</div>
        </div>))}
    </div>);
}
