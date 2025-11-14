
export const VideoUploader = ()=> {
  const [file,setFile]=useState<File|null>(null);
  return <div><input type="file" onChange={e=>setFile(e.target.files ? e.target.files[0] : null)} /></div>;
};
export default VideoUploader;
