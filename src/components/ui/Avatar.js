import React from 'react';
export function Avatar({ src, size = 40 }) {
    return <img src={src} style={{ width: size, height: size, borderRadius: '50%' }} alt="avatar"/>;
}
