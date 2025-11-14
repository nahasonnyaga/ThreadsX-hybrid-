#!/bin/bash
echo "Creating Video Service..."
mkdir -p src/services
cat << 'EOL' > src/services/videoService.ts
export const VideoService = {
  videos: [],

  async fetchVideos() {
    return this.videos;
  },

  async uploadVideo(video: any) {
    video.id = this.videos.length + 1;
    this.videos.unshift(video);
    return video;
  }
};
EOL
echo "Video Service created!"
