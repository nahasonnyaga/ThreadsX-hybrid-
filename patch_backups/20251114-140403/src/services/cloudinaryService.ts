export const CloudinaryService = {
  async upload(file: File | any) {
    // return mock response structure expected by UI
    return { secure_url: '/assets/images/react.svg' };
  }
};
