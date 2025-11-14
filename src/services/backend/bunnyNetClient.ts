import fs from "fs";
import axios from 'axios';

export const BunnyNetClient = {
  storageZone: 'YOUR_BUNNY_STORAGE_ZONE',
  apiKey: 'YOUR_BUNNY_API_KEY',

  async uploadFile(filePath: string, remotePath: string): Promise<string> {
    const url = `https://storage.bunnycdn.com/${this.storageZone}/${remotePath}`;
    await axios.put(url, fs.createReadStream(filePath), {
      headers: { "AccessKey": this.apiKey },
    });
    return url;
  }
};
