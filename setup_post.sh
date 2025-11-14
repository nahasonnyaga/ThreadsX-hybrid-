#!/bin/bash
echo "Creating Post Service..."
mkdir -p src/services
cat << 'EOL' > src/services/postService.ts
export const PostService = {
  posts: [],

  async fetchPosts() {
    return this.posts;
  },

  async createPost(post: any) {
    post.id = this.posts.length + 1;
    this.posts.unshift(post);
    return post;
  }
};
EOL
echo "Post Service created!"
