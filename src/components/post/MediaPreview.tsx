import React from 'react';

export function MediaPreview({ src, type }: any) {
  if(type === 'video') return <video src={src} controls style={{ width: '100%', borderRadius: '8px' }} />;
  return <img src={src} alt="media" style={{ width: '100%', borderRadius: '8px' }} />;
}
