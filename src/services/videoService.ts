// src/services/videoService.ts

// Define the structure of a Video
export type Video = {
  id: number;               // assigned automatically
  src: string;              // required video URL
  username: string;         // uploader
  description?: string;     // optional description
  media_type?: 'video' | 'image'; // optional type
  [key: string]: any;       // allows extra dynamic fields
};

export const VideoService = {
  videos: [] as Video[],

  // Fetch all videos
  async fetchVideos(): Promise<Video[]> {
    return this.videos;
  },

  // Upload a video. Must include src & username. Others optional.
  async uploadVideo(video: Omit<Video, 'id'> & { src: string; username: string }): Promise<Video> {
    const newVideo: Video = {
      ...video,
      id: this.videos.length + 1, // auto-assign unique ID
    };
    this.videos.unshift(newVideo);
    return newVideo;
  },
};
