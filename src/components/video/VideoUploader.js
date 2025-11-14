import React, { useState } from "react";
export const VideoUploader = () => {
    const [file, setFile] = useState(null);
    return <div><input type="file" onChange={e => setFile(e.target.files ? e.target.files[0] : null)}/></div>;
};
export default VideoUploader;
