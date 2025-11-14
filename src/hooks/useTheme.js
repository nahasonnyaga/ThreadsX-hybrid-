import { useState } from 'react';
export function useTheme() {
    const [theme, setTheme] = useState('light');
    const toggleTheme = () => setTheme(theme === 'light' ? 'dark' : 'light');
    return { theme, toggleTheme };
}
