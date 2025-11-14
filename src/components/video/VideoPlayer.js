import React from 'react';
export function VideoPlayer({ src }) {
    return <video src={src} controls width="100%"></video>;
}
