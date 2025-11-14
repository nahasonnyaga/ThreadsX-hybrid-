import React, { useState } from "react";
import { useUser } from "../context/UserContext";

export default function EditProfile() {
  const { currentUser, updateUser } = useUser();
  const [form, setForm] = useState({ ...currentUser });

  const handleSave = () => {
    updateUser(form);
    window.history.back();
  };

  return (
    <div className="p-4">
      <h1 className="text-xl font-bold mb-4">Edit Profile</h1>

      {/* Username */}
      <label className="block mb-2 font-semibold">Username</label>
      <input
        className="w-full p-2 border rounded"
        value={form.username}
        onChange={(e) => setForm({ ...form, username: e.target.value })}
      />

      {/* Bio */}
      <label className="block mt-4 mb-2 font-semibold">Bio</label>
      <textarea
        className="w-full p-2 border rounded"
        value={form.bio}
        onChange={(e) => setForm({ ...form, bio: e.target.value })}
      />

      {/* Website */}
      <label className="block mt-4 mb-2 font-semibold">Website</label>
      <input
        className="w-full p-2 border rounded"
        value={form.website}
        onChange={(e) => setForm({ ...form, website: e.target.value })}
      />

      <button
        onClick={handleSave}
        className="mt-6 bg-blue-600 text-white w-full py-3 rounded-lg"
      >
        Save Changes
      </button>
    </div>
  );
}
