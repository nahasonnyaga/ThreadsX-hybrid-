import React from 'react';

export function SpaceSchedule({ schedule }: any) {
  return (
    <div style={{ border: '1px dashed #bbb', borderRadius: '10px', padding: '10px', margin: '10px 0', background: '#fafafa' }}>
      <h4>{schedule.event}</h4>
      <p>Time: {schedule.time}</p>
    </div>
  );
}
