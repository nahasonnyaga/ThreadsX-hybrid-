#!/bin/bash
echo "Creating Auth Service..."
mkdir -p src/services
cat << 'EOL' > src/services/authService.ts
export const AuthService = {
  users: [
    { id: 1, username: 'JaneDoe', email: 'jane@example.com', avatar: '/assets/images/react.svg', bio: 'Just another tech enthusiast.' },
    { id: 2, username: 'JohnSmith', email: 'john@example.com', avatar: '/assets/images/react.svg', bio: 'Lover of videos and threads.' }
  ],

  async login(email: string) {
    const user = this.users.find(u => u.email === email);
    return user || null;
  },

  async signup(user: any) {
    user.id = this.users.length + 1;
    this.users.push(user);
    return user;
  },

  async fetchUsers() {
    return this.users;
  }
};
EOL
echo "Auth Service created!"
