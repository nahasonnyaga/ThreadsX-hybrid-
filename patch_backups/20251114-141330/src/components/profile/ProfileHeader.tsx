import React, { useState, useEffect } from 'react';

export default function ProfileHeader({ username='JaneDoe' }: any){
  const [profile,setProfile]=useState<any>(null);
  useEffect(()=>{ setProfile({ username, avatar:'/assets/images/react.svg', bio:'Bio' })},[username]);
  if(!profile) return <div>Loading...</div>;
  return <div className="p-4"><img src={profile.avatar} className="w-16 h-16 rounded-full" /><h2>{profile.username}</h2><p>{profile.bio}</p></div>;
}
