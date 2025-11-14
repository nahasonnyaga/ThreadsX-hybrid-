export const SpaceService = {
    async fetchSpaces() {
        // Placeholder live spaces
        return [
            { id: 1, title: 'React Dev Chat', host: 'Alice', participants: 24, status: 'live' },
            { id: 2, title: 'TikTok Trends', host: 'Bob', participants: 10, status: 'live' },
            { id: 3, title: 'Threads Discussion', host: 'Charlie', participants: 15, status: 'upcoming' }
        ];
    }
};
