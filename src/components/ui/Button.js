import React from 'react';
export function Button({ label, onClick }) {
    return (<button onClick={onClick} style={{ padding: '8px 16px', borderRadius: '6px', border: 'none', background: '#1DA1F2', color: '#fff', cursor: 'pointer' }}>
      {label}
    </button>);
}
