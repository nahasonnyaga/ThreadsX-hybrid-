
export function CommunityCard({ community }: any) {
  return (
    <div style={{ border: '1px solid #ccc', padding: '10px', marginBottom: '10px', borderRadius: '10px' }}>
      <h3>{community.name}</h3>
      <p>{community.description}</p>
      <p>Members: {community.members}</p>
    </div>
  );
}
