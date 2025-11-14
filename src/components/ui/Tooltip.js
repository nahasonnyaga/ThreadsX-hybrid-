import React from 'react';
export function Tooltip({ message }) {
    return (<span style={{ background: '#000', color: '#fff', padding: '2px 6px', borderRadius: '4px', fontSize: '12px' }}>
      {message}
    </span>);
}
