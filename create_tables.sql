-- Users table
create table if not exists users (
  id bigserial primary key,
  username text not null unique,
  email text not null unique,
  avatar text,
  bio text,
  created_at timestamp with time zone default now()
);

-- Posts table
create table if not exists posts (
  id bigserial primary key,
  user_id bigint references users(id),
  content text,
  media text,
  created_at timestamp with time zone default now()
);

-- Threads table
create table if not exists threads (
  id bigserial primary key,
  user_id bigint references users(id),
  content text,
  created_at timestamp with time zone default now()
);

-- Likes table
create table if not exists likes (
  id bigserial primary key,
  user_id bigint references users(id),
  post_id bigint references posts(id),
  created_at timestamp with time zone default now()
);

-- Comments table
create table if not exists comments (
  id bigserial primary key,
  user_id bigint references users(id),
  post_id bigint references posts(id),
  content text,
  created_at timestamp with time zone default now()
);
