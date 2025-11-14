
import { Feed } from '../components/feed/Feed';

export default function Home() {
  return (
    <div style={{ maxWidth: '600px', margin: '0 auto', padding: '10px' }}>
      <h1 style={{ textAlign: 'center', margin: '20px 0' }}>Flutter-TikTok Feed</h1>
      <Feed />
    </div>
  );
}
