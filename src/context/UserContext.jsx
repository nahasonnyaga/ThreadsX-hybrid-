import React, { createContext, useState, useContext } from 'react';

const UserContext = createContext();

export const UserProvider = ({ children }) => {
  const [currentUser, setCurrentUser] = useState({
    id: "123",
    username: "@User1",
    avatar: "/assets/images/react.svg",
    banner: "/assets/images/react.svg",
    bio: "Hello! I'm a developer",
    website: "https://example.com",
    location: "Nairobi, Kenya",
    followers: 1200,
    following: 540,
    posts: [],
    videos: [
      { id: 1, src: 'https://www.w3schools.com/html/mov_bbb.mp4', username: '@User1', description: 'Hello TikTok!' },
      { id: 2, src: 'https://www.w3schools.com/html/movie.mp4', username: '@User1', description: 'Second video' }
    ],
    xPosts: [
      { id: 1, user: '@User1', content: 'Hello X!', timestamp: '1h' }
    ],
    threadsPosts: [
      { id: 1, user: '@User1', content: 'Hello Threads!', timestamp: '2h' }
    ],
    likes: [],
    retweets: [],
  });

  return (
    <UserContext.Provider value={{ currentUser }}>
      {children}
    </UserContext.Provider>
  );
};

export const useUser = () => useContext(UserContext);
