import React, { useState } from "react";
import { FaEdit } from "react-icons/fa";

export default function ProfileHeader({ profile }) {
  const [isEditing, setIsEditing] = useState(false);
  const [form, setForm] = useState({
    username: profile.username,
    bio: profile.bio,
    website: profile.website,
    location: profile.location,
  });

  const handleChange = (e) => setForm({ ...form, [e.target.name]: e.target.value });
  const handleSave = () => {
    // You can hook this into your backend or context
    profile.username = form.username;
    profile.bio = form.bio;
    profile.website = form.website;
    profile.location = form.location;
    setIsEditing(false);
  };

  return (
    <div className="bg-white dark:bg-gray-800 p-4 flex flex-col items-center">
      <img
        src={profile.avatar || "https://via.placeholder.com/150"}
        alt="avatar"
        className="w-24 h-24 rounded-full border-2 border-gray-300 dark:border-gray-600"
      />
      {isEditing ? (
        <div className="mt-2 w-full max-w-md">
          <input
            type="text"
            name="username"
            value={form.username}
            onChange={handleChange}
            className="w-full p-2 border rounded mb-2"
          />
          <input
            type="text"
            name="bio"
            value={form.bio}
            onChange={handleChange}
            className="w-full p-2 border rounded mb-2"
          />
          <input
            type="text"
            name="website"
            value={form.website}
            onChange={handleChange}
            className="w-full p-2 border rounded mb-2"
          />
          <input
            type="text"
            name="location"
            value={form.location}
            onChange={handleChange}
            className="w-full p-2 border rounded mb-2"
          />
          <button
            className="bg-blue-500 text-white px-4 py-2 rounded mr-2"
            onClick={handleSave}
          >
            Save
          </button>
          <button
            className="bg-gray-300 text-black px-4 py-2 rounded"
            onClick={() => setIsEditing(false)}
          >
            Cancel
          </button>
        </div>
      ) : (
        <>
          <h2 className="mt-2 text-xl font-bold">@{profile.username}</h2>
          <p className="text-gray-600 dark:text-gray-300">{profile.bio}</p>
          <p className="text-blue-500">{profile.website}</p>
          <p className="text-gray-500 dark:text-gray-400">{profile.location}</p>
          <div className="flex gap-4 mt-2 text-center">
            <div>
              <span className="font-bold">{profile.followers}</span> Followers
            </div>
            <div>
              <span className="font-bold">{profile.following}</span> Following
            </div>
          </div>
          <div className="flex gap-4 mt-2 text-center">
            <div>
              <span className="font-bold">{profile.posts.length}</span> Posts
            </div>
            <div>
              <span className="font-bold">{profile.videos.length}</span> Videos
            </div>
            <div>
              <span className="font-bold">{profile.threadsPosts.length}</span> Threads
            </div>
            <div>
              <span className="font-bold">{profile.likes.length}</span> Likes
            </div>
            <div>
              <span className="font-bold">{profile.retweets.length}</span> Retweets
            </div>
          </div>
          <button
            className="mt-3 flex items-center gap-2 bg-gray-200 dark:bg-gray-700 px-4 py-1 rounded"
            onClick={() => setIsEditing(true)}
          >
            <FaEdit /> Edit Profile
          </button>
        </>
      )}
    </div>
  );
}
