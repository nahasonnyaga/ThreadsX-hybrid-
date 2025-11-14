import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import tsconfigPaths from 'vite-tsconfig-paths';

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    react(),          // enables JSX/TSX in JS/TS files
    tsconfigPaths()   // optional if you use TS path aliases
  ],
  esbuild: {
    loader: 'jsx',               // treat .js as JSX
    include: /src\/.*\.[tj]sx?$/ // apply to JS, JSX, TS, TSX in src
  }
});
