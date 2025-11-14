import React from "react";
export default function ThreadCard({ thread }: any) {
  return (
    <div className="p-3 border-b">
      <div className="font-semibold">@{thread.user?.username || thread.username}</div>
      <div>{thread.content}</div>
    </div>
  );
}
