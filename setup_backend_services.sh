#!/bin/bash
echo "Setting up Supabase + Firebase + Cloudinary + BunnyNet backend services..."

# 1️⃣ Supabase service
cat << 'EOT' > src/services/supabaseService.ts
import { createClient } from '@supabase/supabase-js';

const SUPABASE_URL = 'YOUR_SUPABASE_URL';
const SUPABASE_ANON_KEY = 'YOUR_SUPABASE_ANON_KEY';

export const SupabaseService = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
EOT

# 2️⃣ Firebase service
cat << 'EOT' > src/services/firebaseService.ts
import { initializeApp } from 'firebase/app';
import { getFirestore } from 'firebase/firestore';
import { getAuth } from 'firebase/auth';

const firebaseConfig = {
  apiKey: 'YOUR_FIREBASE_API_KEY',
  authDomain: 'YOUR_FIREBASE_AUTH_DOMAIN',
  projectId: 'YOUR_FIREBASE_PROJECT_ID',
  storageBucket: 'YOUR_FIREBASE_STORAGE_BUCKET',
  messagingSenderId: 'YOUR_FIREBASE_MESSAGING_SENDER_ID',
  appId: 'YOUR_FIREBASE_APP_ID',
};

const app = initializeApp(firebaseConfig);

export const FirebaseService = {
  auth: getAuth(app),
  db: getFirestore(app),
};
EOT

# 3️⃣ Cloudinary service
cat << 'EOT' > src/services/cloudinaryService.ts
export const CloudinaryService = {
  uploadUrl: 'YOUR_CLOUDINARY_UPLOAD_PRESET_URL',
  async upload(file: File) {
    const formData = new FormData();
    formData.append('file', file);
    formData.append('upload_preset', 'YOUR_UPLOAD_PRESET');
    const res = await fetch(this.uploadUrl, { method: 'POST', body: formData });
    return res.json();
  }
};
EOT

# 4️⃣ BunnyNet service
cat << 'EOT' > src/services/bunnyNetService.ts
export const BunnyNetService = {
  async uploadVideo(file: File) {
    // Replace with actual BunnyNet API call
    console.log('Uploading to BunnyNet:', file.name);
    return { url: '/mock/video/url.mp4' };
  }
};
EOT

echo "Backend services setup complete!"
