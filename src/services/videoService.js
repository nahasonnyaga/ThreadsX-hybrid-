export const VideoService = {
    videos: [],
    async fetchVideos() {
        return this.videos;
    },
    async uploadVideo(video) {
        video.id = this.videos.length + 1;
        this.videos.unshift(video);
        return video;
    }
};
