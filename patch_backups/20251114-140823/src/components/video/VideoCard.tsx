
export function VideoCard() {
  return (
    <div style={{ border: '1px solid #eee', borderRadius: '10px', margin: '10px 0', padding: '10px' }}>
      <video width="100%" controls>
        <source src="/assets/react.svg" type="video/mp4" />
        Your browser does not support the video tag.
      </video>
      <p>Sample Video</p>
    </div>
  );
}
