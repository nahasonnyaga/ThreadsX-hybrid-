import axios from 'axios';

export const BunnyNetClient = {
  storageZone: 'YOUR_BUNNY_STORAGE_ZONE',
  apiKey: 'YOUR_BUNNY_API_KEY',
  async uploadFile(filePath: string, remotePath: string) {
    const url = `https://storage.bunnycdn.com/${this.storageZone}/${remotePath}`;
    const data = await axios.put(url, require('fs').createReadStream(filePath), {
      headers: { 'AccessKey': this.apiKey }
    });
    return url;
  }
};
