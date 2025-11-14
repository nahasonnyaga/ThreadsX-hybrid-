#!/bin/bash
# setup_project.sh
# Run this from project root: bash setup_project.sh

echo "Creating project directories and placeholder files..."

# Create config files
mkdir -p src/config
touch src/config/{baseConfig.ts,bunnyNetConfig.ts,cloudinaryConfig.ts,firebaseConfig.ts,mastodonConfig.ts,themeConfig.ts}

# Create hooks
mkdir -p src/hooks
touch src/hooks/{useAnalytics.ts,useAuth.ts,useFetchFeed.ts,useNotifications.ts,useSearch.ts,useTheme.ts,useUpload.ts}

# Create services
mkdir -p src/services
touch src/services/{analyticsService.ts,authService.ts,bunnyNetService.ts,cloudinaryService.ts,communityService.ts,federationService.ts,hashtagService.ts,mediaService.ts,notificationService.ts,postService.ts,searchService.ts,spaceService.ts,threadService.ts,userService.ts,videoService.ts}

# Create utils
mkdir -p src/utils
touch src/utils/{apiHelpers.ts,constants.ts,dateFormatter.ts,mediaHelpers.ts,validators.ts}

# Create component folders and placeholder files
mkdir -p src/components/{feed,post,space,ui,video}

# Feed components
touch src/components/feed/{CommunityCard.tsx,NotificationCard.tsx,PostCard.tsx,SpaceCard.tsx,ThreadCard.tsx,TrendingCard.tsx,VideoCard.tsx}

# Post components
touch src/components/post/{BookmarkButton.tsx,CommentSection.tsx,LikeButton.tsx,MediaPreview.tsx,Poll.tsx,RetweetButton.tsx,ThreadPreview.tsx}

# Space components
touch src/components/space/{SpaceCard.tsx,SpaceRoom.tsx,SpaceSchedule.tsx}

# UI components
touch src/components/ui/{Avatar.tsx,Button.tsx,Dropdown.tsx,Footer.tsx,Loader.tsx,Modal.tsx,Navbar.tsx,Sidebar.tsx,Toast.tsx,Tooltip.tsx}

# Video components
touch src/components/video/{VideoAnalytics.tsx,VideoFilters.tsx,VideoPlayer.tsx,VideoUploader.tsx}

# Pages
mkdir -p src/pages
touch src/pages/{Analytics.tsx,Community.tsx,Home.tsx,Notifications.tsx,Profile.tsx,Search.tsx,Settings.tsx,Space.tsx,Trends.tsx,Upload.tsx}

# Assets folders
mkdir -p src/assets/{fonts,icons,images}

# Add empty setup script in src
touch src/setup_project.sh

echo "All directories and placeholder files have been created!"
