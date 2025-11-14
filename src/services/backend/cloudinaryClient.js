import { v2 as cloudinary } from 'cloudinary';
cloudinary.config({
    cloud_name: 'YOUR_CLOUDINARY_NAME',
    api_key: 'YOUR_CLOUDINARY_API_KEY',
    api_secret: 'YOUR_CLOUDINARY_API_SECRET'
});
export const CloudinaryClient = cloudinary;
