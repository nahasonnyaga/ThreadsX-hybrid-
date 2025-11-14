import { supabase } from './backend/supabaseClient';
export const AuthService = {
  async login(email: string) {
    const { data: user } = await supabase.from('users').select('*').eq('email', email).single();
    return user || null;
  },
  async signup(user: any) {
    const { data } = await supabase.from('users').insert([user]);
    return data ? data[0] : null;
  },
  async fetchUsers() {
    const { data } = await supabase.from('users').select('*');
    return data;
  }
};
