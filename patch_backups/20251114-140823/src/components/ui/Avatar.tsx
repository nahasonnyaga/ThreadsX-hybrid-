
export function Avatar({ src, size = 40 }: any) {
  return <img src={src} style={{ width: size, height: size, borderRadius: '50%' }} alt="avatar" />;
}
