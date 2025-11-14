import React, { useState, useEffect } from "react";
/** Replace with real space service */
async function fetchSpaces() {
    return [
        { id: 1, title: "AMA with devs", host: "Admin", participants: 45, status: "upcoming" },
        { id: 2, title: "Music chat", host: "DJ", participants: 120, status: "live" }
    ];
}
export default function Spaces() {
    const [spaces, setSpaces] = useState([]);
    useEffect(() => {
        let mounted = true;
        (async () => {
            const data = await fetchSpaces();
            if (mounted)
                setSpaces(data || []);
        })();
        return () => { mounted = false; };
    }, []);
    return (<div className="p-4">
      <h1 className="text-xl font-bold mb-4">Spaces</h1>
      {spaces.length === 0 && <p className="text-gray-400">No spaces yet.</p>}
      {spaces.map(s => (<div key={s.id} className="p-3 border-b">
          <strong>{s.title}</strong>
          <div>{s.participants} participants — {s.status}</div>
        </div>))}
    </div>);
}
