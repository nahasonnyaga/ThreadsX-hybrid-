import React, { StrictMode } from 'react';
import { createRoot } from 'react-dom/client';
import './index.css';
import App from './App';
import { UserProvider } from './context/UserContext';

const rootElement = document.getElementById('root');
if (rootElement) {
  const root = createRoot(rootElement);
  root.render(
    <StrictMode>
      <UserProvider>
        <App />
      </UserProvider>
    </StrictMode>
  );
}
