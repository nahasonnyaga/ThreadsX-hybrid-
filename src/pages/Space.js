import React, { useState, useEffect } from "react";
import SpaceCard from '../components/space/SpaceCard';
import { SpaceService } from '../services/spaceService';
const Space = () => {
    const [spaces, setSpaces] = useState([]);
    useEffect(() => {
        const fetchSpaces = async () => {
            const data = await SpaceService.fetchSpaces();
            setSpaces(data);
        };
        fetchSpaces();
    }, []);
    return (<div className="max-w-4xl mx-auto p-4">
      <h1 className="text-2xl font-bold mb-4">Live Spaces</h1>
      {spaces.length === 0 && <p className="text-gray-500">No spaces live right now...</p>}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        {spaces.map(space => (<SpaceCard key={space.id} space={space}/>))}
      </div>
    </div>);
};
export default Space;
