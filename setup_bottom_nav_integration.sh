#!/bin/bash
echo "Integrating BottomNav globally..."

# Backup existing App.tsx
cp src/App.tsx src/App.tsx.bak

# Update App.tsx
cat << 'EOL' > src/App.tsx
import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Home from './pages/Home';
import Community from './pages/Community';
import Profile from './pages/Profile';
import Notifications from './pages/Notifications';
import Search from './pages/Search';
import Spaces from './pages/Spaces';
import Upload from './pages/Upload';
import { BottomNav } from './components/ui/BottomNav';

function App() {
  return (
    <Router>
      <div style={{ paddingBottom: '60px' }}>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/community" element={<Community />} />
          <Route path="/profile/:username" element={<Profile />} />
          <Route path="/notifications" element={<Notifications />} />
          <Route path="/search" element={<Search />} />
          <Route path="/spaces" element={<Spaces />} />
          <Route path="/upload" element={<Upload />} />
        </Routes>
        <BottomNav />
      </div>
    </Router>
  );
}

export default App;
EOL

echo "BottomNav integrated globally!"
