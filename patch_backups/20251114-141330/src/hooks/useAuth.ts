import { useState } from 'react';
import { AuthService } from '../services/authService';

export function useAuth() {
  const [user, setUser] = useState(null);

  const login = async (email: string) => {
    const u = await AuthService.login(email);
    setUser(u);
    return u;
  };

  const signup = async (user: any) => {
    const u = await AuthService.signup(user);
    setUser(u);
    return u;
  };

  return { user, login, signup };
}
