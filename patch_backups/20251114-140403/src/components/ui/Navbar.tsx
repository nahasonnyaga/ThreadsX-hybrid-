
export function Navbar() {
  return (
    <nav style={{ display: 'flex', justifyContent: 'space-between', padding: '10px 20px', background: '#1DA1F2', color: '#fff' }}>
      <h2>MyApp</h2>
      <div>
        <button style={{ marginRight: '10px' }}>Home</button>
        <button>Explore</button>
      </div>
    </nav>
  );
}
