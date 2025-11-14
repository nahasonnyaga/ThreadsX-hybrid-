
export function SpaceCard({ space }: any) {
  return (
    <div style={{ border: '1px solid #ccc', padding: '10px', marginBottom: '10px', borderRadius: '10px' }}>
      <h3>{space.name}</h3>
      <p>Host: {space.host}</p>
      <p>Scheduled: {space.schedule}</p>
    </div>
  );
}

// appended by patch script
export default SpaceCard;
