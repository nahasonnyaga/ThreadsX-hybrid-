
export function Modal({ children, onClose, isOpen }: any) {
  if (!isOpen) return null;
  return (
    <div style={{ position: 'fixed', top: 0, left: 0, width: '100%', height: '100%', background: 'rgba(0,0,0,0.5)' }}>
      <div style={{ background: '#fff', padding: '20px', margin: '50px auto', width: '400px', borderRadius: '10px', position: 'relative' }}>
        <button onClick={onClose} style={{ position: 'absolute', top: '10px', right: '10px' }}>X</button>
        {children}
      </div>
    </div>
  );
}
