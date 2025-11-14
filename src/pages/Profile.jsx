import React, { useState } from "react";
import { useUser } from "../context/UserContext";
import VideoCard from "../components/feed/VideoCard";
import XPostCard from "../components/feed/XPostCard";
import ThreadPostCard from "../components/feed/ThreadPostCard";
import ProfileHeader from "../components/profile/ProfileHeader";

export default function Profile() {
  const { currentUser } = useUser();
  const [activeTab, setActiveTab] = useState("posts");

  if (!currentUser) return <div className="p-4">Loading profile...</div>;

  const renderContent = () => {
    switch (activeTab) {
      case "posts":
        return currentUser.posts.length ? (
          currentUser.posts.map((post) => <XPostCard key={post.id} {...post} />)
        ) : (
          <p className="text-center text-gray-400 py-6">No posts yet</p>
        );
      case "videos":
        return currentUser.videos.length ? (
          currentUser.videos.map((video) => <VideoCard key={video.id} {...video} />)
        ) : (
          <p className="text-center text-gray-400 py-6">No videos yet</p>
        );
      case "threads":
        return currentUser.threadsPosts.length ? (
          currentUser.threadsPosts.map((post) => <ThreadPostCard key={post.id} {...post} />)
        ) : (
          <p className="text-center text-gray-400 py-6">No threads yet</p>
        );
      case "likes":
        return currentUser.likes.length ? (
          <XPostCard key={currentUser.likes.id} {...currentUser.likes} />
        ) : (
          <p className="text-center text-gray-400 py-6">No liked posts yet</p>
        );
      case "retweets":
        return currentUser.retweets.length ? (
          <XPostCard key={currentUser.retweets.id} {...currentUser.retweets} />
        ) : (
          <p className="text-center text-gray-400 py-6">No retweets yet</p>
        );
      default:
        return null;
    }
  };

  const tabs = [
    { key: "posts", label: "Posts" },
    { key: "videos", label: "Videos" },
    { key: "threads", label: "Threads" },
    { key: "likes", label: "Likes" },
    { key: "retweets", label: "Retweets" },
  ];

  return (
    <div className="min-h-screen bg-gray-100 dark:bg-gray-900 text-black dark:text-white">
      <ProfileHeader profile={currentUser} />
      <div className="flex justify-around border-b border-gray-300 dark:border-gray-700 mt-4">
        {tabs.map((tab) => (
          <button
            key={tab.key}
            onClick={() => setActiveTab(tab.key)}
            className={`py-3 flex-1 text-center font-medium ${
              activeTab === tab.key
                ? "border-b-2 border-blue-500 text-blue-600 dark:text-blue-400"
                : "text-gray-500 dark:text-gray-400"
            }`}
          >
            {tab.label}
          </button>
        ))}
      </div>
      <div className="mt-4 px-2">{renderContent()}</div>
    </div>
  );
}
