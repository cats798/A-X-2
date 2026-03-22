import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const List<Locale> supportedLocales = [Locale('en'), Locale('zh')];

  static const Map<String, String> _en = {
    // 通用
    'appTitle': 'AnymeX',
    'home': 'Home',
    'search': 'Search',
    'library': 'Library',
    'settings': 'Settings',
    'cancel': 'Cancel',
    'ok': 'OK',
    'save': 'Save',
    'delete': 'Delete',
    'confirm': 'Confirm',
    'loading': 'Loading...',
    'error': 'Error',
    'retry': 'Retry',
    'noData': 'No data',
    'back': 'Back',
    'next': 'Next',
    'previous': 'Previous',
    'close': 'Close',
    'done': 'Done',

    // 主页相关
    'continueWatching': 'Continue Watching',
    'loginPrompt': 'W-what are you doing step-bro, login before you do that (●´⌓`●)',
    'greetingHey': 'Hey ',
    'greetingQuestion': ', what are we doing today?',
    'homeSubtitle': 'Find your favourite anime or manga, manhwa or whatever you like!',
    'recommendedNovels': 'Recommended Novels',
    'guest': 'Guest',

    // 类型
    'anime': 'Anime',
    'manga': 'Manga',
    'novel': 'Novel',

    // 导航栏
    'profile': 'Profile',
    'extensions': 'Extensions',

    // 操作
    'watch': 'Watch',
    'read': 'Read',
    'score': 'Score',
    'status': 'Status',
    'addToList': 'Add to List',
    'removeFromList': 'Remove from List',
    'updateProgress': 'Update Progress',
    'markAsWatched': 'Mark as Watched',
    'markAsUnwatched': 'Mark as Unwatched',
    'rate': 'Rate',
    'review': 'Review',
    'share': 'Share',
    'copy': 'Copy',
    'openInBrowser': 'Open in Browser',
    'download': 'Download',
    'downloading': 'Downloading...',
    'install': 'Install',
    'uninstall': 'Uninstall',
    'update': 'Update',
    'reset': 'Reset',
    'apply': 'Apply',
    'clear': 'Clear',

    // 播放器
    'play': 'Play',
    'pause': 'Pause',
    'volume': 'Volume',
    'brightness': 'Brightness',
    'fullscreen': 'Fullscreen',
    'exitFullscreen': 'Exit Fullscreen',
    'skipIntro': 'Skip Intro',
    'skipOutro': 'Skip Outro',
    'nextEpisode': 'Next Episode',
    'previousEpisode': 'Previous Episode',
    'quality': 'Quality',
    'subtitle': 'Subtitle',
    'audioTrack': 'Audio Track',
    'playerSettings': 'Player Settings',

    // 设置
    'generalSettings': 'General Settings',
    'account': 'Account',
    'login': 'Login',
    'logout': 'Logout',
    'signUp': 'Sign Up',
    'username': 'Username',
    'userPassword': 'Password',
    'email': 'Email',
    'forgotPassword': 'Forgot Password?',
    'resetPassword': 'Reset Password',
    'changePassword': 'Change Password',
    'profileSettings': 'Profile',
    'editProfile': 'Edit Profile',
    'avatar': 'Avatar',
    'name': 'Name',
    'bio': 'Bio',
    'following': 'Following',
    'followers': 'Followers',
    'language': 'Language',
    'theme': 'Theme',
    'darkMode': 'Dark Mode',
    'lightMode': 'Light Mode',
    'systemDefault': 'System Default',
    'autoPlay': 'Auto Play',
    'autoSkip': 'Auto Skip',
    'version': 'Version',
    'license': 'License',
    'privacyPolicy': 'Privacy Policy',
    'termsOfService': 'Terms of Service',
    'about': 'About',
    'help': 'Help',
    'feedback': 'Feedback',
    'support': 'Support',
    'donate': 'Donate',
    'notifications': 'Notifications',
    'offlineMode': 'Offline Mode',
    'cache': 'Cache',
    'clearCache': 'Clear Cache',
    'backup': 'Backup',
    'restore': 'Restore',
    'export': 'Export',
    'import': 'Import',
    'refresh': 'Refresh',
    'reload': 'Reload',

    // 详情页
    'synopsis': 'Synopsis',
    'background': 'Background',
    'relations': 'Relations',
    'externalLinks': 'External Links',
    'airingSchedule': 'Airing Schedule',
    'releaseDate': 'Release Date',
    'endDate': 'End Date',
    'genres': 'Genres',
    'tags': 'Tags',
    'source': 'Source',
    'rating': 'Rating',
    'popularity': 'Popularity',
    'favoritesCount': 'Favorites',
    'members': 'Members',
    'meanScore': 'Mean Score',
    'rank': 'Rank',
    'studio': 'Studio',
    'producer': 'Producer',
    'licensor': 'Licensor',
    'cast': 'Cast',
    'staff': 'Staff',
    'characters': 'Characters',
    'episodes': 'Episodes',
    'chapters': 'Chapters',
    'volumes': 'Volumes',
    'lists': 'Lists',
    'history': 'History',
    'favorites': 'Favorites',
    'recommendations': 'Recommendations',
    'related': 'Related',
    'similar': 'Similar',

    // 搜索/筛选
    'searchHint': 'Search anime, manga...',
    'filter': 'Filter',
    'sort': 'Sort',

    // 其他
    'comments': 'Comments',
    'replies': 'Replies',
    'report': 'Report',
    'block': 'Block',
    'mute': 'Mute',
    'unmute': 'Unmute',
    'follow': 'Follow',
    'unfollow': 'Unfollow',
    'subscribe': 'Subscribe',
    'unsubscribe': 'Unsubscribe',
    'compactMode': 'Compact Mode',
    'detailedMode': 'Detailed Mode',
    'sauceFinder': 'Sauce Finder',
    'contributors': 'Contributors',
    'dependencies': 'Dependencies',
    'versionCopied': 'Version copied',
    'developer': 'Developer',
    'coreTeam': 'Core Team',
    'specialThanks': 'Special Thanks',
    'communityContributors': 'Community Contributors',
    'noContributors': 'No contributors found.',
    'failedToLoadContributors': 'Failed to load contributors',
    'cardStyle': 'Card Style',
    'cardStyleSaikou': 'Saikou',
    'cardStyleSaikouDesc': 'A minimalist design focused on efficiency with less visual elements.',
    'cardStyleModern': 'Modern',
    'cardStyleModernDesc': 'Clean, contemporary design with balanced proportions and subtle shadows.',
    'cardStyleExotic': 'Exotic',
    'cardStyleExoticDesc': 'Traditional card layout with familiar elements and standard formatting.',
    'carouselStyle': 'Carousel Style',
    'carouselStyleName0': 'Style 1',
    'carouselStyleDesc0': 'Description for style 1',
    'carouselStyleName1': 'Style 2',
    'carouselStyleDesc1': 'Description for style 2',
    'historyCardStyle': 'Card Style',
    'historyCardStyleRegular': 'Regular',
    'historyCardStyleBlurred': 'Blurred',
    'historyCardStyleBootiful': 'Bootiful',
    'commentSystem': 'Comment System',
    'aboutCommentum': 'About Commentum v2',
    'aboutCommentumDesc': 'Powered by Commentum v2 - Advanced comment system with moderation',
    'userRole': 'User Role',
    'superAdminDesc': 'Full system access and control',
    'adminDesc': 'Can moderate and manage users',
    'moderatorDesc': 'Can moderate content',
    'userDesc': 'Basic commenting privileges',
    'moderationPanel': 'Moderation Panel',
    'moderationPanelDesc': 'Access moderation tools and reports',
    'reportedComments': 'Reported Comments',
    'reportedCommentsDesc': 'View and manage reported content',
    'commentPreferences': 'Comment Preferences',
    'commentPreferencesDesc': 'Customize comment display and behavior',
    'notificationSettings': 'Notification Settings',
    'notificationSettingsDesc': 'Configure comment notifications',
    'helpAndSupport': 'Help & Support',
    'helpAndSupportDesc': 'Get help with the comment system',
    'privacyAndSafety': 'Privacy & Safety',
    'privacyAndSafetyDesc': 'Privacy settings and safety features',
    'commentumFeatures': 'Commentum v2 is an advanced comment system that provides:',
    'feature1': 'Real-time commenting with nested replies',
    'feature2': 'Advanced moderation tools',
    'feature3': 'User role management (User, Moderator, Admin, Super Admin)',
    'feature4': 'Content reporting and safety features',
    'feature5': 'Voting system with upvotes/downvotes',
    'feature6': 'Cross-platform support (AniList, MyAnimeList, SIMKL)',
    'userRolesPermissions': 'User Roles & Permissions',
    'currentRolePermissions': 'Your current role and permissions:',
    'userPermissions': 'Create comments\nEdit own comments\nDelete own comments\nVote on comments\nReport inappropriate content',
    'moderatorPermissions': 'All User permissions\nEdit/delete any comment\nPin/unpin comments\nLock/unlock threads\nWarn users\nMute users temporarily\nResolve reports',
    'adminPermissions': 'All Moderator permissions\nBan/unban users permanently\nShadow ban users\nFull user management',
    'superAdminPermissions': 'All Admin permissions\nSystem configuration\nRole management\nDiscord bot management',
    'noModeratorPermission': 'You need moderator or admin permissions to access this panel',
    'moderationPanelComingSoon': 'Moderation panel coming soon!',
    'reportsPanelComingSoon': 'Reports panel coming soon!',
    'commentPrefFuture': 'Comment display preferences will be available in future updates.',
    'plannedFeatures': 'Planned features:',
    'sortDefault': 'Default sorting order',
    'commentDensity': 'Comment density settings',
    'showHideAvatars': 'Show/hide avatars',
    'fontSizeAdjust': 'Font size adjustment',
    'autoPlayVideos': 'Auto-play videos in comments',
    'notificationFuture': 'Comment notification preferences will be available in future updates.',
    'notifReplies': 'Replies to your comments',
    'notifMentions': 'Mentions in comments',
    'notifModeration': 'Moderation notifications',
    'notifReportResolution': 'Report resolution updates',
    'howToUse': 'How to use the comment system:',
    'step1': 'Log in with your AniList, MyAnimeList, or SIMKL account',
    'step2': 'Comments are automatically linked to your account',
    'step3': 'You can edit or delete your own comments',
    'step4': 'Vote on comments you like or dislike',
    'step5': 'Report inappropriate content to moderators',
    'needHelp': 'Need help?',
    'helpText': '• Contact moderators for content issues\n• Report bugs through the app settings\n• Join our Discord community for support',
    'privacyImportant': 'Your privacy is important:',
    'privacy1': 'Only your username and avatar are shown publicly',
    'privacy2': 'Your personal information is never shared',
    'privacy3': 'Comments can be deleted but may be retained for moderation',
    'privacy4': 'Reported content is reviewed by moderators',
    'safetyFeatures': 'Safety features:',
    'safety1': 'Content filtering and moderation',
    'safety2': 'User reporting system',
    'safety3': 'Ban and warning system for violations',
    'safety4': 'Shadow banning for repeat offenders',
    'experimentalSettings': 'Experimental Settings',
    'reader': 'Reader',
    'cacheDuration': 'Cache Duration',
    'cacheDurationDesc': 'When should the image cache be cleared?',
    'player': 'Player',
    'anime4kEnhancement': 'Anime 4K Enhancement',
    'anime4kDesc': 'Real-time 4K upscaling for anime content',
    'enableShaders': 'Enable Shaders',
    'shadersDescMobile': 'if Enabled the Shaders will be applied to the player through hdr menu',
    'shadersDescDesktop': 'if Enabled the Shaders will be applied to the player through keybindings',
    'chooseShaderProfile': 'Choose Shader Profile',
    'shaderProfileDesc': 'Choose accordingly to your system specs.\nMid End = Eg. GTX 980, GTX 1060, RX 570\nHigh End = Eg. GTX 1080, RTX 2070, RTX 3060, RX 590, Vega 56',
    'selectProfile': 'SELECT PROFILE',
    'warning': 'Warning',
    'warningBlackScreen': 'you might get black screen or it may not work.',
    'warningLag': 'will lag like hell on older gpus',
    'shaderProfilesInit': 'Shader Profiles Initialized',
    'shaderShortcuts': 'Use keyboard shortcuts during playback to switch profiles',
    'keybindings': 'Available Keybindings:',
    'downloadShaders': 'Download 4K Shaders',
    'downloadSize': 'Download size: ~4MB',
    'midEnd': 'MID-END',
    'highEnd': 'HIGH-END',
    'yourRole': 'Your Role',
    'moderationQueue': 'Moderation Queue',
    'pendingReports': 'pending reports',
    'userManagement': 'User Management',
    'userManagementDesc': 'Manage user roles and permissions',
    'moderationHistory': 'Moderation History',
    'moderationHistoryDesc': 'View past moderation actions',
    'searchUser': 'Search User',
    'searchUserDesc': 'Find and manage specific users',
    'searchComments': 'Search Comments',
    'searchCommentsDesc': 'Search through comment content',
    'statisticsDesc': 'View moderation statistics',
    'moderationNotifDesc': 'Configure moderation notifications',
    'moderationRules': 'Moderation Rules',
    'moderationRulesDesc': 'View and configure moderation rules',
    'noAdminPermission': 'You need admin permissions to access this panel',
    'moderationQueueComingSoon': 'Moderation queue interface coming soon!',
    'userManagementComingSoon': 'User management interface coming soon!',
    'modHistoryFuture': 'Moderation history will be available in future updates.',
    'filterActionType': 'Filter by action type',
    'filterDateRange': 'Filter by date range',
    'filterModerator': 'Filter by moderator',
    'exportLogs': 'Export moderation logs',
    'appealSystem': 'Appeal system',
    'userSearchFuture': 'User search functionality will be available in future updates.',
    'searchByUsername': 'Search by username',
    'searchByUserId': 'Search by user ID',
    'searchByCommentHistory': 'Search by comment history',
    'advancedFiltering': 'Advanced filtering options',
    'commentSearchFuture': 'Comment search functionality will be available in future updates.',
    'searchByContent': 'Search by content',
    'searchByDateRange': 'Search by date range',
    'searchByReportStatus': 'Search by report status',
    'statisticsFuture': 'Moderation statistics will be available in future updates.',
    'plannedMetrics': 'Planned metrics:',
    'reportsResolved': 'Reports resolved',
    'usersWarnedBanned': 'Users warned/banned',
    'commentsModerated': 'Comments moderated',
    'responseTimes': 'Response times',
    'trendsAnalytics': 'Trends and analytics',
    'modNotifFuture': 'Notification settings will be available in future updates.',
    'plannedNotifications': 'Planned notifications:',
    'newReports': 'New reports',
    'reportResolutions': 'Report resolutions',
    'userAppeals': 'User appeals',
    'systemAlerts': 'System alerts',
    'modRulesFuture': 'Moderation rules configuration will be available in future updates.',
    'customBannedKeywords': 'Custom banned keywords',
    'autoModThresholds': 'Auto-moderation thresholds',
    'rolePermissions': 'Role-specific permissions',
    'contentFilteringRules': 'Content filtering rules',
    'imageCacheCleared': 'Image cache cleared',
    'clearCacheFailed': 'Failed to clear cache',
    'factoryReset': 'Factory Reset',
    'factoryResetWarning': 'This will permanently delete all data stored of AnymeX. This cannot be undone.',
    'deleteAll': 'Delete All',
    'isarDataDeleted': 'Isar data deleted',
    'factoryResetFailed': 'Factory reset failed',
    'cachedImages': 'Cached Images',
    'threshold': 'Threshold',
    'autoClearThreshold': 'Auto-clear threshold',
    'autoClearDesc': 'If image cache reaches this size, it will be cleared automatically.',
    'clearImageCacheNow': 'Clear image cache now',
    'clearImageCacheDesc': 'Delete all currently cached network images.',
    'factoryResetDesc': 'Delete everything stored of AnymeX permanently.',
    'cacheExceededCleared': 'Image cache exceeded threshold and was cleared',
    'tapZones': 'Tap Zones',
    'resetToDefault': 'Reset to Default',
    'resetLayout': 'Reset Layout?',
    'resetLayoutWarning': 'This will revert the current layout to its original settings.',
    'paged': 'Paged',
    'webtoon': 'Webtoon',
    'enableTapZones': 'Enable Tap Zones',
    'useCustomGestures': 'Use custom gestures',
    'tapZoneInstruction': 'Tap a zone to change its action',
    'tapAction': 'Tap Action',
    'noExtensionManagers': 'No extension managers found.',
    'failedToRemoveRepo': 'Failed to remove repo',
    'repoAddedSingular': '1 repo added',
    'repoAddedPlural': '$count repos added',
    'notSupported': 'Not supported',
    'animeNotSupported': 'Anime is not supported by this manager.',
    'mangaNotSupported': 'Manga is not supported by this manager.',
    'novelNotSupported': 'Novel is not supported by this manager.',
    'noRepositoriesYet': 'No repositories yet',
    'tapToAddRepo': 'Tap + to add a repository URL',
    'urlCopied': 'URL copied to clipboard',
    'remove': 'Remove',
    'addRepo': 'Add Repo',
    'addRepository': 'Add Repository',
    'repositoryUrlLabel': 'REPOSITORY URL',
    'repositoryUrlHint': 'https://raw.githubusercontent.com/...',
    'adding': 'Adding…',
    'dataManagement': 'Data Management',
    'currentLibrary': 'Current Library',
    'actions': 'Actions',
    'createBackup': 'Create Backup',
    'backupSubtitle': 'Secure your library to local storage',
    'restoreData': 'Restore Data',
    'restoreSubtitle': 'Import your .anymex backup file',
    'passwordsDontMatch': 'Passwords don\'t match!',
    'backupSuccess': 'Backup saved successfully!',
    'backupFailed': 'Backup failed:',
    'invalidBackup': 'Invalid backup file or incorrect password',
    'restoreSuccess': 'Backup restored successfully!',
    'restoreFailed': 'Restore failed:',
    'errorSelectingFile': 'Error selecting file:',
    'passwordRequired': 'Password Required',
    'passwordRequiredHint': 'This backup is encrypted. Please enter the password to continue.',
    'backupPassword': 'Password',
    'enterPassword': 'Enter password',
    'unlock': 'Unlock',
    'backupOptions': 'Backup Options',
    'protectBackup': 'Protect your backup',
    'passwordProtect': 'Password Protect',
    'passwordProtectHint': 'Add extra security to your backup',
    'confirmPassword': 'Confirm Password',
    'reenterPassword': 'Re-enter password',
    'restorePreview': 'Restore Preview',
    'encrypted': 'Encrypted',
    'restoreWarning': 'This will completely replace your current library. All existing data will be overwritten.',
    'confirmRestore': 'CONFIRM & RESTORE',
    'backupOwner': 'Backup Owner',
    'libraryStatistics': 'Library Statistics',
    'totalItems': 'Total Items',
    'customLists': 'Custom Lists',
    'lists': 'lists',
    'socialPresence': 'Social Presence',
    'trackingServices': 'Tracking Services',
    'connectDiscord': 'Connect Discord',
    'richPresenceActive': 'Rich Presence Active',
    'showWhatYouAreWatching': 'Show what you are watching',
    'disconnectDiscord': 'Disconnect Discord?',
    'richPresenceStopUpdate': 'Your rich presence activity will stop updating.',
    'disconnect': 'Disconnect',
    'notConnected': 'Not connected',
    'connectedAs': 'Connected as',
    'manage': 'Manage',
    'connect': 'Connect',
    'user': 'User',
    'experimental': 'Experimental',
    'enableExperimentalSettings': 'Enable Experimental Settings',
    'experimentalDescription': 'Required for Core and Visual tuning. Keep off on low-end devices.',
    'experimentalGateMessage': 'Core and Visual settings are disabled. Enable Experimental to use them.',
    'decoderHwdec': 'Decoder (HWDec)',
    'videoSync': 'Video Sync',
    'frameInterpolation': 'Frame Interpolation',
    'frameInterpolationDesc': 'Smoother motion, can increase GPU usage',
    'audioPitchCorrection': 'Audio Pitch Correction',
    'audioPitchCorrectionDesc': 'Keep voice pitch stable at higher speeds',
    'cacheMinutes': 'Cache Minutes',
    'cacheMinutesDesc': 'Read-ahead duration in Minutes',
    'demuxerReadahead': 'Demuxer Readahead',
    'demuxerReadaheadDesc': 'Readahead seconds',
    'demuxerMaxBuffer': 'Demuxer Max Buffer',
    'demuxerMaxBufferDesc': 'Maximum demuxer buffer (MB)',
    'decoderThreads': 'Decoder Threads',
    'decoderThreadsDesc': '0 means automatic thread count',
    'bufferSize': 'Buffer Size',
    'bufferSizeDesc': 'Network buffer size in MB',
    'useBuffering': 'Use Buffering',
    'useBufferingDesc': 'Enable buffering strategy for unstable networks',
    'useLibmpv': 'Use LibMpv for Playback',
    'useLibmpvDesc': 'Pick wisely! (LibMpv -> FEATURES, ExoPlayer -> PERFORMANCE)',
    'useLibass': 'Use Libass for Subtitles',
    'useLibassDesc': 'Better subtitle rendering using libass library',
    'jsonThemeManager': 'JSON Theme Manager',
    'jsonThemeInfo': 'If you are using a JSON theme, changes here will not affect player controls. Switch to a built-in theme to apply these settings.',
    'swipeIndicatorTheme': 'Swipe Indicator Theme',
    'defaultPortrait': 'Default Portrait',
    'defaultPortraitDesc': 'For psychopaths who like watching in portrait',
    'autoSkipOp': 'Auto Skip OP',
    'autoSkipOpDesc': 'Auto skip the opening song',
    'autoSkipEd': 'Auto Skip ED',
    'autoSkipEdDesc': 'Auto skip the ending song',
    'autoSkipRecap': 'Auto Skip Recap',
    'autoSkipRecapDesc': 'Auto skip the recap section',
    'autoSkipOnce': 'Auto Skip Once Only',
    'autoSkipOnceDesc': 'Auto skip only once per watch',
    'autoSkipFiller': 'Auto Skip Filler',
    'autoSkipFillerDesc': 'Automatically skip filler episodes when going to next episode',
    'enableSwipeControls': 'Enable Swipe Controls',
    'enableSwipeControlsDesc': 'Enable if you want to use brightness and volume controls',
    'saveLastFrame': 'Save Last Frame',
    'saveLastFrameDesc': 'Saves a screenshot of the last frame you watched. Disabling this significantly reduces storage usage',
    'doubleTapSeek': 'DoubleTap to Seek',
    'doubleTapSeekDesc': 'Adjust Double Tap To Seek Duration',
    'megaSkipDuration': 'MegaSkip Duration',
    'megaSkipDurationDesc': 'Adjust MegaSkip Duration',
    'markAsWatchedDesc': 'How much in percentage to mark episode as watched',
    'transitionSubtitle': 'Transition Subtitle',
    'transitionSubtitleDesc': 'By disabling this you can avoid the transition between subtitles.',
    'autoTranslateSubtitles': 'Auto Translate Subtitles',
    'autoTranslateSubtitlesDesc': 'Use AI to translate soft-subtitles live',
    'subtitleFont': 'Subtitle Font',
    'subtitleTransparency': 'Subtitle Transparency',
    'subtitleTransparencyDesc': 'Adjust text visibility',
    'bottomMargin': 'Bottom Margin',
    'bottomMarginDesc': 'Distance from bottom of screen',
    'changeSubtitleColor': 'Change subtitle colors',
    'subtitleColor': 'Subtitle Color',
    'selectSubtitleColor': 'Select Subtitle Color',
    'subtitleOutlineColor': 'Subtitle Outline Color',
    'changeSubtitleOutlineColor': 'Change subtitle outline color',
    'selectSubtitleOutlineColor': 'Select Subtitle Outline Color',
    'subtitleBackgroundColor': 'Subtitle Background Color',
    'changeSubtitleBackgroundColor': 'Change subtitle background color',
    'selectSubtitleBackgroundColor': 'Select Subtitle Background Color',
    'selectSubtitleFont': 'Select Subtitle Font',
    'outlineType': 'Outline Type',
    'subtitleOutlineWidth': 'Subtitle Outline Width',
    'adjustSubtitleOutlineWidth': 'Adjust Subtitle Outline Width',
    'subtitlePreview': 'Subtitle Preview',
    'subtitlePreviewText': 'Subtitle Preview Text',
    'bottomControls': 'Bottom Controls',
    'leftSide': 'Left Side',
    'rightSide': 'Right Side',
    'hidden': 'Hidden',
    'showOnLeft': 'Show on left',
    'showOnRight': 'Show on right',
    'hideButton': 'Hide button',
    'moveToRight': 'Move to right',
    'moveToLeft': 'Move to left',
    'controlTheme': 'Control Theme',
    'playbackSpeed': 'Playback Speed',
    'appearance': 'Appearance',
    'defaultTheme': 'Default Theme',
    'defaultThemeDesc': 'Play around with App theme',
    'materialYou': 'Material You',
    'materialYouDesc': 'Take color from your wallpaper (A12+)',
    'liquidMode': 'Liquid Mode',
    'liquidModeDesc': 'Make everything glassy & liquidy...',
    'liquidBackground': 'Liquid Background',
    'liquidBackgroundDesc': 'Choose a custom background for liquid mode.',
    'retainOriginalColor': 'Retain Original Color',
    'retainOriginalColorDesc': 'Enable this if you want to retain the original color of your wallpaper',
    'usePosterColor': 'Use Poster Color',
    'usePosterColorDesc': 'Applies anime/manga poster color on details page',
    'resetToDefaultPicture': 'Reset to Default Picture',
    'resetToDefaultPictureDesc': 'Reset to default wallpaper!',
    'extras': 'Extras',
    'bloom': 'Bloom',
    'bloomDesc': 'Enables a soft, glowing gradient effect.',
    'palette': 'Palette',
    'paletteDesc': 'Choose your favourite palette!',
    'oledMode': 'Oled Mode',
    'oledModeDesc': 'Go Super Dark Mode!',
    'customTheme': 'Custom Theme',
    'customThemeDesc': 'Choose your favourite color!',
    'logoAnimation': 'Logo Animation',
    'logoAnimationDesc': 'Customize your logo animation style',
    'customThemes': 'Custom Themes',
    'palettes': 'Palettes',
    'common': 'Common',
    'universal': 'Universal',
    'askForTrackingPermission': 'Ask for tracking permission',
    'askForTrackingPermissionDesc': 'If enabled, AnymeX will ask for tracking permission; if not, it will track by default.',
    'hideAdultContent': 'Hide Adult Content',
    'hideAdultContentDesc': 'If enabled, you will not get a prompt for enabling adult content on AniList/MyAnimeList.',
    'showContinueWatchingCard': 'Show Continue Watching Card',
    'showContinueWatchingCardDesc': 'Display Continue Watching cards on home page from offline progress.',
    'anilist': 'AniList',
    'manageAnilistLists': 'Manage AniList Lists',
    'myAnimeList': 'MyAnimeList',
    'manageMyAnimeListLists': 'Manage MyAnimeList Lists',
    'chooseListToShowOnHome': 'Choose which list to show on home page',
    'manageHomePageCards': 'Manage Home Page Cards',
    'chapter': 'Chapter',
    'unknown': '??',
    'errorMissingData': 'Error: Missing required data. It seems you closed the app directly after reading the chapter!',
    'cannotPlayAbruptClose': "Can't play because you closed the app abruptly.",
    'installExtensionFirst': 'Install {sourceName} first, then click.',
    'page': 'Page',
    'holdToAccessHistoryEditor': 'Hold to access history editor',
    'installExtension': 'Install',
    'adult': 'Adult',
    'image': 'Image',
    'searchResults': 'Search Results',
    'tryAgain': 'Try Again',
    'searching': 'Searching...',
    'oopsSomethingWrong': 'Oops! Something went wrong',
    'pleaseTryAgainLater': 'Please try again later',
    'noResultsFound': 'No results found',
    'tryAdjustingSearch': 'Try adjusting your search terms or filters',
    'networkError': 'Network error. Please check your connection.',
    'timeoutError': 'Search timed out. Please try again.',
    'serviceUnavailable': 'Service not available. Please try later.',
    'somethingWentWrong': 'Something went wrong. Please try again.',
    'myAnimeOnly': 'My Anime Only',
    'hideMyAnime': 'Hide My Anime',
    'myMangaOnly': 'My Manga Only',
    'hideMyManga': 'Hide My Manga',
    'season': 'Season',
    'country': 'Country',
    'countryOfOrigin': 'Country of Origin',
    'year': 'Year',
    'duration': 'Duration (mins)',
    'chapters': 'Chapters',
    'volumes': 'Volumes',
    'episodes': 'Episodes',
    'format': 'Format',
    'source': 'Source',
    'status': 'Status',
    'sort': 'Sort',
    'airingStatus': 'Airing Status',
    'publishingStatus': 'Publishing Status',
    'useYearRange': 'Use Year Range',
    'episodesAndDuration': 'Episodes & Duration',
    'filterByEpisodeCount': 'Filter by Episode Count',
    'filterByDuration': 'Filter by Duration (min)',
    'minutesShort': 'min',
    'episodesShort': 'eps',
    'chaptersAndVolumes': 'Chapters & Volumes',
    'filterByChapterCount': 'Filter by Chapter Count',
    'filterByVolumeCount': 'Filter by Volume Count',
    'chaptersShort': 'ch',
    'volumesShort': 'vol',
    'selectSort': 'Select Sort',
    'sortBy': 'Sort By',
    'order': 'Order',
    'addTags': 'Add Tags',
    'editTags': 'Edit Tags ({count})',
    'selectTags': 'Select Tags',
    'searchTagsHint': 'Search tags...',
    'doneWithCount': 'Done ({count} selected)',
    'streamingOn': 'Streaming On',
    'readableOn': 'Readable On',
    'selectStreamingService': 'Select Streaming Service',
    'selectReadingPlatform': 'Select Reading Platform',
    'editServices': 'Edit Services ({count})',
    'editPlatforms': 'Edit Platforms ({count})',
    'options': 'Options',
    'applyFilters': 'Apply Filters',
  };

  static const Map<String, String> _zh = {
    // 通用
    'appTitle': 'AnymeX',
    'home': '主页',
    'search': '搜索',
    'library': '库',
    'settings': '设置',
    'cancel': '取消',
    'ok': '确定',
    'save': '保存',
    'delete': '删除',
    'confirm': '确认',
    'loading': '加载中...',
    'error': '错误',
    'retry': '重试',
    'noData': '暂无数据',
    'back': '返回',
    'next': '下一步',
    'previous': '上一步',
    'close': '关闭',
    'done': '完成',

    // 主页相关
    'continueWatching': '继续观看',
    'loginPrompt': '哎呀，先登录再操作吧 (●´⌓`●)',
    'greetingHey': '嘿 ',
    'greetingQuestion': '，今天想做什么？',
    'homeSubtitle': '找到你喜欢的动漫、漫画、韩漫或任何内容！',
    'recommendedNovels': '推荐小说',
    'guest': '访客',

    // 类型
    'anime': '动漫',
    'manga': '漫画',
    'novel': '小说',

    // 导航栏
    'profile': '个人资料',
    'extensions': '扩展',

    // 操作
    'watch': '观看',
    'read': '阅读',
    'score': '评分',
    'status': '状态',
    'addToList': '添加到列表',
    'removeFromList': '从列表移除',
    'updateProgress': '更新进度',
    'markAsWatched': '标记为已看',
    'markAsUnwatched': '标记为未看',
    'rate': '评分',
    'review': '评价',
    'share': '分享',
    'copy': '复制',
    'openInBrowser': '在浏览器中打开',
    'download': '下载',
    'downloading': '下载中...',
    'install': '安装',
    'uninstall': '卸载',
    'update': '更新',
    'reset': '重置',
    'apply': '应用',
    'clear': '清除',

    // 播放器
    'play': '播放',
    'pause': '暂停',
    'volume': '音量',
    'brightness': '亮度',
    'fullscreen': '全屏',
    'exitFullscreen': '退出全屏',
    'skipIntro': '跳过片头',
    'skipOutro': '跳过片尾',
    'nextEpisode': '下一集',
    'previousEpisode': '上一集',
    'quality': '画质',
    'subtitle': '字幕',
    'audioTrack': '音轨',
    'playerSettings': '播放器设置',

    // 设置
    'generalSettings': '通用设置',
    'account': '账户',
    'login': '登录',
    'logout': '退出登录',
    'signUp': '注册',
    'username': '用户名',
    'userPassword': '密码',
    'email': '邮箱',
    'forgotPassword': '忘记密码？',
    'resetPassword': '重置密码',
    'changePassword': '修改密码',
    'profileSettings': '个人资料',
    'editProfile': '编辑资料',
    'avatar': '头像',
    'name': '昵称',
    'bio': '简介',
    'following': '关注',
    'followers': '粉丝',
    'language': '语言',
    'theme': '主题',
    'darkMode': '深色模式',
    'lightMode': '浅色模式',
    'systemDefault': '跟随系统',
    'autoPlay': '自动播放',
    'autoSkip': '自动跳过',
    'version': '版本',
    'license': '许可证',
    'privacyPolicy': '隐私政策',
    'termsOfService': '服务条款',
    'about': '关于',
    'help': '帮助',
    'feedback': '反馈',
    'support': '支持',
    'donate': '捐赠',
    'notifications': '通知',
    'offlineMode': '离线模式',
    'cache': '缓存',
    'clearCache': '清除缓存',
    'backup': '备份',
    'restore': '恢复',
    'export': '导出',
    'import': '导入',
    'refresh': '刷新',
    'reload': '重新加载',

    // 详情页
    'synopsis': '简介',
    'background': '背景',
    'relations': '关联',
    'externalLinks': '外部链接',
    'airingSchedule': '播出时间表',
    'releaseDate': '上映日期',
    'endDate': '完结日期',
    'genres': '类型',
    'tags': '标签',
    'source': '来源',
    'rating': '评分',
    'popularity': '人气',
    'favoritesCount': '收藏数',
    'members': '成员数',
    'meanScore': '平均分',
    'rank': '排名',
    'studio': '工作室',
    'producer': '制作方',
    'licensor': '授权方',
    'cast': '演员',
    'staff': '工作人员',
    'characters': '角色',
    'episodes': '剧集',
    'chapters': '章节',
    'volumes': '卷',
    'lists': '列表',
    'history': '历史记录',
    'favorites': '收藏',
    'recommendations': '推荐',
    'related': '相关',
    'similar': '相似',

    // 搜索/筛选
    'searchHint': '搜索动漫、漫画...',
    'filter': '筛选',
    'sort': '排序',

    // 其他
    'comments': '评论',
    'replies': '回复',
    'report': '举报',
    'block': '屏蔽',
    'mute': '静音',
    'unmute': '取消静音',
    'follow': '关注',
    'unfollow': '取消关注',
    'subscribe': '订阅',
    'unsubscribe': '取消订阅',
    'compactMode': '紧凑模式',
    'detailedMode': '详细模式',
    'sauceFinder': '图片搜索',
    'contributors': '贡献者',
    'dependencies': '依赖库',
    'versionCopied': '版本已复制',
    'developer': '开发者',
    'coreTeam': '核心团队',
    'specialThanks': '特别鸣谢',
    'communityContributors': '社区贡献者',
    'noContributors': '暂无贡献者',
    'failedToLoadContributors': '加载贡献者失败',
    'cardStyle': '卡片样式',
    'cardStyleSaikou': '简约',
    'cardStyleSaikouDesc': '极简设计，注重效率，减少视觉元素。',
    'cardStyleModern': '现代',
    'cardStyleModernDesc': '干净、现代的设计，比例均衡，阴影柔和。',
    'cardStyleExotic': '经典',
    'cardStyleExoticDesc': '传统卡片布局，带有熟悉的元素和标准格式。',
    'carouselStyle': '轮播样式',
    'carouselStyleName0': '样式 1',
    'carouselStyleDesc0': '样式 1 的描述',
    'carouselStyleName1': '样式 2',
    'carouselStyleDesc1': '样式 2 的描述',
    'historyCardStyle': '卡片样式',
    'historyCardStyleRegular': '常规',
    'historyCardStyleBlurred': '模糊',
    'historyCardStyleBootiful': '美观',
    'commentSystem': '评论系统',
    'aboutCommentum': '关于 Commentum v2',
    'aboutCommentumDesc': '基于 Commentum v2 - 带审核功能的先进评论系统',
    'userRole': '用户角色',
    'superAdminDesc': '完全系统访问和控制权限',
    'adminDesc': '可以审核和管理用户',
    'moderatorDesc': '可以审核内容',
    'userDesc': '基本评论权限',
    'moderationPanel': '审核面板',
    'moderationPanelDesc': '访问审核工具和举报',
    'reportedComments': '举报的评论',
    'reportedCommentsDesc': '查看和管理被举报的内容',
    'commentPreferences': '评论偏好',
    'commentPreferencesDesc': '自定义评论显示和行为',
    'notificationSettings': '通知设置',
    'notificationSettingsDesc': '配置评论通知',
    'helpAndSupport': '帮助与支持',
    'helpAndSupportDesc': '获取评论系统的帮助',
    'privacyAndSafety': '隐私与安全',
    'privacyAndSafetyDesc': '隐私设置和安全功能',
    'commentumFeatures': 'Commentum v2 是一个先进的评论系统，提供以下功能：',
    'feature1': '实时评论及嵌套回复',
    'feature2': '高级审核工具',
    'feature3': '用户角色管理（普通用户、审核员、管理员、超级管理员）',
    'feature4': '内容举报和安全功能',
    'feature5': '点赞/点踩投票系统',
    'feature6': '跨平台支持（AniList, MyAnimeList, SIMKL）',
    'userRolesPermissions': '用户角色与权限',
    'currentRolePermissions': '您当前的角色和权限：',
    'userPermissions': '发表评论\n编辑自己的评论\n删除自己的评论\n对评论投票\n举报不当内容',
    'moderatorPermissions': '所有用户权限\n编辑/删除任何评论\n置顶/取消置顶评论\n锁定/解锁讨论串\n警告用户\n临时静音用户\n处理举报',
    'adminPermissions': '所有审核员权限\n永久封禁/解封用户\n影子封禁用户\n完整用户管理',
    'superAdminPermissions': '所有管理员权限\n系统配置\n角色管理\nDiscord 机器人管理',
    'noModeratorPermission': '您需要审核员或管理员权限才能访问此面板',
    'moderationPanelComingSoon': '审核面板即将推出！',
    'reportsPanelComingSoon': '举报面板即将推出！',
    'commentPrefFuture': '评论显示偏好将在未来更新中提供。',
    'plannedFeatures': '计划功能：',
    'sortDefault': '默认排序方式',
    'commentDensity': '评论密度设置',
    'showHideAvatars': '显示/隐藏头像',
    'fontSizeAdjust': '字体大小调整',
    'autoPlayVideos': '评论中的视频自动播放',
    'notificationFuture': '评论通知偏好将在未来更新中提供。',
    'notifReplies': '回复您的评论',
    'notifMentions': '评论中提到您',
    'notifModeration': '审核通知',
    'notifReportResolution': '举报处理结果',
    'howToUse': '如何使用评论系统：',
    'step1': '使用 AniList、MyAnimeList 或 SIMKL 账号登录',
    'step2': '评论会自动关联到您的账号',
    'step3': '您可以编辑或删除自己的评论',
    'step4': '对喜欢的或讨厌的评论进行投票',
    'step5': '向审核员举报不当内容',
    'needHelp': '需要帮助？',
    'helpText': '• 联系审核员处理内容问题\n• 通过应用设置报告 Bug\n• 加入我们的 Discord 社区获取支持',
    'privacyImportant': '您的隐私很重要：',
    'privacy1': '只有您的用户名和头像会公开显示',
    'privacy2': '您的个人信息绝不会被分享',
    'privacy3': '评论可以被删除，但可能会保留用于审核',
    'privacy4': '被举报的内容将由审核员审核',
    'safetyFeatures': '安全功能：',
    'safety1': '内容过滤和审核',
    'safety2': '用户举报系统',
    'safety3': '违规封禁和警告系统',
    'safety4': '对屡犯者进行影子封禁',
    'experimentalSettings': '实验性设置',
    'reader': '阅读器',
    'cacheDuration': '缓存时长',
    'cacheDurationDesc': '何时清除图片缓存？',
    'player': '播放器',
    'anime4kEnhancement': 'Anime 4K 增强',
    'anime4kDesc': '实时 4K 动漫画面提升',
    'enableShaders': '启用着色器',
    'shadersDescMobile': '启用后，着色器将通过 HDR 菜单应用到播放器',
    'shadersDescDesktop': '启用后，着色器将通过快捷键应用到播放器',
    'chooseShaderProfile': '选择着色器配置',
    'shaderProfileDesc': '根据您的系统规格选择。\n中端 = 例如 GTX 980, GTX 1060, RX 570\n高端 = 例如 GTX 1080, RTX 2070, RTX 3060, RX 590, Vega 56',
    'selectProfile': '选择配置',
    'warning': '警告',
    'warningBlackScreen': '可能会导致黑屏或无法正常工作。',
    'warningLag': '在老款 GPU 上可能会非常卡顿',
    'shaderProfilesInit': '着色器配置已初始化',
    'shaderShortcuts': '播放时使用键盘快捷键切换配置',
    'keybindings': '可用快捷键：',
    'downloadShaders': '下载 4K 着色器',
    'downloadSize': '下载大小：约 4MB',
    'midEnd': '中端',
    'highEnd': '高端',
    'yourRole': '您的角色',
    'moderationQueue': '审核队列',
    'pendingReports': '待处理举报',
    'userManagement': '用户管理',
    'userManagementDesc': '管理用户角色和权限',
    'moderationHistory': '审核历史',
    'moderationHistoryDesc': '查看过去的审核操作',
    'searchUser': '搜索用户',
    'searchUserDesc': '查找和管理特定用户',
    'searchComments': '搜索评论',
    'searchCommentsDesc': '搜索评论内容',
    'statisticsDesc': '查看审核统计',
    'moderationNotifDesc': '配置审核通知',
    'moderationRules': '审核规则',
    'moderationRulesDesc': '查看和配置审核规则',
    'noAdminPermission': '您需要管理员权限才能访问此面板',
    'moderationQueueComingSoon': '审核队列界面即将推出！',
    'userManagementComingSoon': '用户管理界面即将推出！',
    'modHistoryFuture': '审核历史将在未来更新中提供。',
    'filterActionType': '按操作类型筛选',
    'filterDateRange': '按日期范围筛选',
    'filterModerator': '按审核员筛选',
    'exportLogs': '导出审核日志',
    'appealSystem': '申诉系统',
    'userSearchFuture': '用户搜索功能将在未来更新中提供。',
    'searchByUsername': '按用户名搜索',
    'searchByUserId': '按用户 ID 搜索',
    'searchByCommentHistory': '按评论历史搜索',
    'advancedFiltering': '高级筛选选项',
    'commentSearchFuture': '评论搜索功能将在未来更新中提供。',
    'searchByContent': '按内容搜索',
    'searchByDateRange': '按日期范围搜索',
    'searchByReportStatus': '按举报状态搜索',
    'statisticsFuture': '审核统计将在未来更新中提供。',
    'plannedMetrics': '计划统计指标：',
    'reportsResolved': '已处理举报',
    'usersWarnedBanned': '被警告/封禁的用户',
    'commentsModerated': '被审核的评论',
    'responseTimes': '响应时间',
    'trendsAnalytics': '趋势与分析',
    'modNotifFuture': '通知设置将在未来更新中提供。',
    'plannedNotifications': '计划通知类型：',
    'newReports': '新举报',
    'reportResolutions': '举报处理结果',
    'userAppeals': '用户申诉',
    'systemAlerts': '系统提醒',
    'modRulesFuture': '审核规则配置将在未来更新中提供。',
    'customBannedKeywords': '自定义屏蔽关键词',
    'autoModThresholds': '自动审核阈值',
    'rolePermissions': '角色专属权限',
    'contentFilteringRules': '内容过滤规则',
    'imageCacheCleared': '图片缓存已清除',
    'clearCacheFailed': '清除缓存失败',
    'factoryReset': '恢复出厂设置',
    'factoryResetWarning': '这将永久删除 AnymeX 存储的所有数据，且无法撤销。',
    'deleteAll': '删除所有',
    'isarDataDeleted': 'Isar 数据已删除',
    'factoryResetFailed': '恢复出厂设置失败',
    'cachedImages': '已缓存图片',
    'threshold': '阈值',
    'autoClearThreshold': '自动清除阈值',
    'autoClearDesc': '当图片缓存达到此大小时，将自动清除。',
    'clearImageCacheNow': '立即清除图片缓存',
    'clearImageCacheDesc': '删除所有当前缓存的网络图片。',
    'factoryResetDesc': '永久删除 AnymeX 存储的所有数据。',
    'cacheExceededCleared': '图片缓存超过阈值，已自动清除',
    'tapZones': '点击区域',
    'resetToDefault': '重置为默认',
    'resetLayout': '重置布局？',
    'resetLayoutWarning': '这将把当前布局恢复为原始设置。',
    'paged': '分页模式',
    'webtoon': 'Webtoon 模式',
    'enableTapZones': '启用点击区域',
    'useCustomGestures': '使用自定义手势',
    'tapZoneInstruction': '点击某个区域以更改其动作',
    'tapAction': '点击动作',
    'noExtensionManagers': '未找到扩展管理器。',
    'failedToRemoveRepo': '移除仓库失败',
    'repoAddedSingular': '已添加 1 个仓库',
    'repoAddedPlural': '已添加 $count 个仓库',
    'notSupported': '不支持',
    'animeNotSupported': '此管理器不支持动漫。',
    'mangaNotSupported': '此管理器不支持漫画。',
    'novelNotSupported': '此管理器不支持小说。',
    'noRepositoriesYet': '暂无仓库',
    'tapToAddRepo': '点击 + 添加仓库地址',
    'urlCopied': '网址已复制到剪贴板',
    'remove': '删除',
    'addRepo': '添加仓库',
    'addRepository': '添加仓库',
    'repositoryUrlLabel': '仓库地址',
    'repositoryUrlHint': 'https://raw.githubusercontent.com/...',
    'adding': '添加中…',
    'dataManagement': '数据管理',
    'currentLibrary': '当前库',
    'actions': '操作',
    'createBackup': '创建备份',
    'backupSubtitle': '将您的库安全保存到本地存储',
    'restoreData': '恢复数据',
    'restoreSubtitle': '导入您的 .anymex 备份文件',
    'passwordsDontMatch': '密码不匹配！',
    'backupSuccess': '备份保存成功！',
    'backupFailed': '备份失败：',
    'invalidBackup': '无效的备份文件或密码错误',
    'restoreSuccess': '备份恢复成功！',
    'restoreFailed': '恢复失败：',
    'errorSelectingFile': '选择文件时出错：',
    'passwordRequired': '需要密码',
    'passwordRequiredHint': '此备份已加密。请输入密码以继续。',
    'backupPassword': '密码',
    'enterPassword': '输入密码',
    'unlock': '解锁',
    'backupOptions': '备份选项',
    'protectBackup': '保护您的备份',
    'passwordProtect': '密码保护',
    'passwordProtectHint': '为您的备份增加额外安全',
    'confirmPassword': '确认密码',
    'reenterPassword': '重新输入密码',
    'restorePreview': '恢复预览',
    'encrypted': '已加密',
    'restoreWarning': '这将完全替换您当前的库。所有现有数据将被覆盖。',
    'confirmRestore': '确认并恢复',
    'backupOwner': '备份所有者',
    'libraryStatistics': '库统计',
    'totalItems': '总项目数',
    'customLists': '自定义列表',
    'lists': '列表',
    'socialPresence': '社交状态',
    'trackingServices': '追踪服务',
    'connectDiscord': '连接 Discord',
    'richPresenceActive': '丰富状态已启用',
    'showWhatYouAreWatching': '显示您正在观看的内容',
    'disconnectDiscord': '断开 Discord 连接？',
    'richPresenceStopUpdate': '您的丰富状态活动将停止更新。',
    'disconnect': '断开连接',
    'notConnected': '未连接',
    'connectedAs': '已连接为',
    'manage': '管理',
    'connect': '连接',
    'user': '用户',
    'experimental': '实验性',
    'enableExperimentalSettings': '启用实验性设置',
    'experimentalDescription': '核心和视觉调整所需。在低端设备上保持关闭。',
    'experimentalGateMessage': '核心和视觉设置已禁用。启用实验性以使用它们。',
    'decoderHwdec': '解码器 (HWDec)',
    'videoSync': '视频同步',
    'frameInterpolation': '帧插值',
    'frameInterpolationDesc': '运动更流畅，可能增加 GPU 使用率',
    'audioPitchCorrection': '音高修正',
    'audioPitchCorrectionDesc': '在高速播放时保持音调稳定',
    'cacheMinutes': '缓存分钟数',
    'cacheMinutesDesc': '预读取时长（分钟）',
    'demuxerReadahead': '解复用器预读',
    'demuxerReadaheadDesc': '预读秒数',
    'demuxerMaxBuffer': '解复用器最大缓冲',
    'demuxerMaxBufferDesc': '最大解复用器缓冲区 (MB)',
    'decoderThreads': '解码器线程数',
    'decoderThreadsDesc': '0 表示自动线程数',
    'bufferSize': '缓冲区大小',
    'bufferSizeDesc': '网络缓冲区大小 (MB)',
    'useBuffering': '使用缓冲',
    'useBufferingDesc': '为不稳定的网络启用缓冲策略',
    'useLibmpv': '使用 LibMpv 播放',
    'useLibmpvDesc': '明智选择！（LibMpv → 功能丰富，ExoPlayer → 性能优先）',
    'useLibass': '使用 Libass 字幕',
    'useLibassDesc': '使用 libass 库提供更好的字幕渲染',
    'jsonThemeManager': 'JSON 主题管理器',
    'jsonThemeInfo': '如果您正在使用 JSON 主题，此处更改不会影响播放器控件。切换回内置主题以应用这些设置。',
    'swipeIndicatorTheme': '滑动指示器主题',
    'defaultPortrait': '默认竖屏',
    'defaultPortraitDesc': '给喜欢竖屏观看的偏执狂',
    'autoSkipOp': '自动跳过片头',
    'autoSkipOpDesc': '自动跳过片头曲',
    'autoSkipEd': '自动跳过片尾',
    'autoSkipEdDesc': '自动跳过片尾曲',
    'autoSkipRecap': '自动跳过回顾',
    'autoSkipRecapDesc': '自动跳过回顾部分',
    'autoSkipOnce': '仅跳过一次',
    'autoSkipOnceDesc': '每次观看仅自动跳过一次',
    'autoSkipFiller': '自动跳过填充集',
    'autoSkipFillerDesc': '当播放下一集时自动跳过填充剧集',
    'enableSwipeControls': '启用滑动控制',
    'enableSwipeControlsDesc': '启用后可以使用亮度/音量滑动调节',
    'saveLastFrame': '保存最后一帧',
    'saveLastFrameDesc': '保存您观看的最后一帧截图。禁用可大幅减少存储占用',
    'doubleTapSeek': '双击快进',
    'doubleTapSeekDesc': '调整双击快进时长',
    'megaSkipDuration': '超大跳转时长',
    'megaSkipDurationDesc': '调整超大跳转时长',
    'markAsWatchedDesc': '标记为已看所需百分比',
    'transitionSubtitle': '字幕过渡动画',
    'transitionSubtitleDesc': '禁用后可避免字幕之间的过渡效果',
    'autoTranslateSubtitles': '自动翻译字幕',
    'autoTranslateSubtitlesDesc': '使用 AI 实时翻译软字幕',
    'subtitleFont': '字幕字体',
    'subtitleTransparency': '字幕透明度',
    'subtitleTransparencyDesc': '调整文字可见度',
    'bottomMargin': '底部边距',
    'bottomMarginDesc': '距离屏幕底部的距离',
    'changeSubtitleColor': '更改字幕颜色',
    'subtitleColor': '字幕颜色',
    'selectSubtitleColor': '选择字幕颜色',
    'subtitleOutlineColor': '字幕描边颜色',
    'changeSubtitleOutlineColor': '更改字幕描边颜色',
    'selectSubtitleOutlineColor': '选择字幕描边颜色',
    'subtitleBackgroundColor': '字幕背景颜色',
    'changeSubtitleBackgroundColor': '更改字幕背景颜色',
    'selectSubtitleBackgroundColor': '选择字幕背景颜色',
    'selectSubtitleFont': '选择字幕字体',
    'outlineType': '描边类型',
    'subtitleOutlineWidth': '字幕描边宽度',
    'adjustSubtitleOutlineWidth': '调整字幕描边宽度',
    'subtitlePreview': '字幕预览',
    'subtitlePreviewText': '字幕预览文本',
    'bottomControls': '底部控件',
    'leftSide': '左侧',
    'rightSide': '右侧',
    'hidden': '隐藏',
    'showOnLeft': '显示在左侧',
    'showOnRight': '显示在右侧',
    'hideButton': '隐藏按钮',
    'moveToRight': '移至右侧',
    'moveToLeft': '移至左侧',
    'controlTheme': '控制主题',
    'playbackSpeed': '播放速度',
    'appearance': '外观',
    'defaultTheme': '默认主题',
    'defaultThemeDesc': '随心改变应用主题',
    'materialYou': 'Material You',
    'materialYouDesc': '从壁纸取色 (Android 12+)',
    'liquidMode': '液态模式',
    'liquidModeDesc': '让界面变得晶莹剔透…',
    'liquidBackground': '液态背景',
    'liquidBackgroundDesc': '为液态模式选择自定义背景。',
    'retainOriginalColor': '保留原色',
    'retainOriginalColorDesc': '保留壁纸原始颜色',
    'usePosterColor': '使用海报颜色',
    'usePosterColorDesc': '在详情页应用动漫/漫画海报颜色',
    'resetToDefaultPicture': '重置为默认图片',
    'resetToDefaultPictureDesc': '重置为默认壁纸',
    'extras': '额外',
    'bloom': '绽放',
    'bloomDesc': '启用柔和的光晕渐变效果。',
    'palette': '调色板',
    'paletteDesc': '选择你喜爱的调色板！',
    'oledMode': 'OLED 模式',
    'oledModeDesc': '进入超级暗黑模式！',
    'customTheme': '自定义主题',
    'customThemeDesc': '选择你喜爱的颜色！',
    'logoAnimation': 'Logo 动画',
    'logoAnimationDesc': '自定义 Logo 动画样式',
    'customThemes': '自定义主题',
    'palettes': '调色板',
    'common': '通用',
    'universal': '通用',
    'askForTrackingPermission': '询问跟踪权限',
    'askForTrackingPermissionDesc': '如果启用，AnymeX 将询问跟踪权限；否则将默认跟踪。',
    'hideAdultContent': '隐藏成人内容',
    'hideAdultContentDesc': '如果启用，你将不会收到启用成人内容的提示。',
    'showContinueWatchingCard': '显示继续观看卡片',
    'showContinueWatchingCardDesc': '在主屏幕上显示来自离线进度的继续观看卡片。',
    'anilist': 'AniList',
    'manageAnilistLists': '管理 AniList 列表',
    'myAnimeList': 'MyAnimeList',
    'manageMyAnimeListLists': '管理 MyAnimeList 列表',
    'chooseListToShowOnHome': '选择要在主页显示的列表',
    'manageHomePageCards': '管理主页卡片',
    'chapter': '章',
    'unknown': '??',
    'errorMissingData': '错误：缺少必要数据。您可能在阅读章节后直接关闭了应用！',
    'cannotPlayAbruptClose': '无法播放，因为您突然关闭了应用。',
    'installExtensionFirst': '请先安装 {sourceName}，再点击。',
    'page': '页',
    'holdToAccessHistoryEditor': '长按以访问历史编辑器',
    'installExtension': '安装',
    'adult': '成人内容',
    'image': '图片搜索',
    'searchResults': '搜索结果',
    'tryAgain': '重试',
    'searching': '搜索中...',
    'oopsSomethingWrong': '哎呀，出错了',
    'pleaseTryAgainLater': '请稍后重试',
    'noResultsFound': '未找到结果',
    'tryAdjustingSearch': '请尝试调整搜索词或筛选条件',
    'networkError': '网络错误，请检查连接',
    'timeoutError': '搜索超时，请重试',
    'serviceUnavailable': '服务不可用，请稍后再试',
    'somethingWentWrong': '出了点问题，请重试',
    'myAnimeOnly': '仅我的动漫',
    'hideMyAnime': '隐藏我的动漫',
    'myMangaOnly': '仅我的漫画',
    'hideMyManga': '隐藏我的漫画',
    'season': '季度',
    'country': '国家/地区',
    'countryOfOrigin': '原产国',
    'year': '年份',
    'duration': '时长（分钟）',
    'chapters': '章节',
    'volumes': '卷',
    'episodes': '集数',
    'format': '格式',
    'source': '来源',
    'status': '状态',
    'sort': '排序',
    'airingStatus': '播出状态',
    'publishingStatus': '出版状态',
    'useYearRange': '使用年份范围',
    'episodesAndDuration': '集数与时长',
    'filterByEpisodeCount': '按集数筛选',
    'filterByDuration': '按时长筛选（分钟）',
    'minutesShort': '分钟',
    'episodesShort': '集',
    'chaptersAndVolumes': '章节与卷数',
    'filterByChapterCount': '按章节数筛选',
    'filterByVolumeCount': '按卷数筛选',
    'chaptersShort': '章',
    'volumesShort': '卷',
    'selectSort': '选择排序',
    'sortBy': '排序方式',
    'order': '顺序',
    'addTags': '添加标签',
    'editTags': '编辑标签 ({count})',
    'selectTags': '选择标签',
    'searchTagsHint': '搜索标签...',
    'doneWithCount': '完成 ({count} 个已选)',
    'streamingOn': '流媒体平台',
    'readableOn': '可阅读平台',
    'selectStreamingService': '选择流媒体服务',
    'selectReadingPlatform': '选择阅读平台',
    'editServices': '编辑服务 ({count})',
    'editPlatforms': '编辑平台 ({count})',
    'options': '选项',
    'applyFilters': '应用筛选',
  };

  Map<String, String> get _strings {
    switch (locale.languageCode) {
      case 'zh':
        return _zh;
      default:
        return _en;
    }
  }

  // 基础 getter - 避免重复
  String get appTitle => _strings['appTitle']!;
  String get home => _strings['home']!;
  String get search => _strings['search']!;
  String get library => _strings['library']!;
  String get settings => _strings['settings']!;
  String get cancel => _strings['cancel']!;
  String get ok => _strings['ok']!;
  String get save => _strings['save']!;
  String get delete => _strings['delete']!;
  String get confirm => _strings['confirm']!;
  String get loading => _strings['loading']!;
  String get error => _strings['error']!;
  String get retry => _strings['retry']!;
  String get noData => _strings['noData']!;
  String get back => _strings['back']!;
  String get next => _strings['next']!;
  String get previous => _strings['previous']!;
  String get close => _strings['close']!;
  String get done => _strings['done']!;
  String get continueWatching => _strings['continueWatching']!;
  String get loginPrompt => _strings['loginPrompt']!;
  String get greetingHey => _strings['greetingHey']!;
  String get greetingQuestion => _strings['greetingQuestion']!;
  String get homeSubtitle => _strings['homeSubtitle']!;
  String get recommendedNovels => _strings['recommendedNovels']!;
  String get guest => _strings['guest']!;
  String get anime => _strings['anime']!;
  String get manga => _strings['manga']!;
  String get novel => _strings['novel']!;
  String get profile => _strings['profile']!;
  String get extensions => _strings['extensions']!;
  String get watch => _strings['watch']!;
  String get read => _strings['read']!;
  String get score => _strings['score']!;
  String get status => _strings['status']!;
  String get addToList => _strings['addToList']!;
  String get removeFromList => _strings['removeFromList']!;
  String get updateProgress => _strings['updateProgress']!;
  String get markAsWatched => _strings['markAsWatched']!;
  String get markAsUnwatched => _strings['markAsUnwatched']!;
  String get rate => _strings['rate']!;
  String get review => _strings['review']!;
  String get share => _strings['share']!;
  String get copy => _strings['copy']!;
  String get openInBrowser => _strings['openInBrowser']!;
  String get download => _strings['download']!;
  String get downloading => _strings['downloading']!;
  String get install => _strings['install']!;
  String get uninstall => _strings['uninstall']!;
  String get update => _strings['update']!;
  String get reset => _strings['reset']!;
  String get apply => _strings['apply']!;
  String get clear => _strings['clear']!;
  String get play => _strings['play']!;
  String get pause => _strings['pause']!;
  String get volume => _strings['volume']!;
  String get brightness => _strings['brightness']!;
  String get fullscreen => _strings['fullscreen']!;
  String get exitFullscreen => _strings['exitFullscreen']!;
  String get skipIntro => _strings['skipIntro']!;
  String get skipOutro => _strings['skipOutro']!;
  String get nextEpisode => _strings['nextEpisode']!;
  String get previousEpisode => _strings['previousEpisode']!;
  String get quality => _strings['quality']!;
  String get subtitle => _strings['subtitle']!;
  String get audioTrack => _strings['audioTrack']!;
  String get playerSettings => _strings['playerSettings']!;
  String get generalSettings => _strings['generalSettings']!;
  String get account => _strings['account']!;
  String get login => _strings['login']!;
  String get logout => _strings['logout']!;
  String get signUp => _strings['signUp']!;
  String get username => _strings['username']!;
  String get userPassword => _strings['userPassword']!;
  String get email => _strings['email']!;
  String get forgotPassword => _strings['forgotPassword']!;
  String get resetPassword => _strings['resetPassword']!;
  String get changePassword => _strings['changePassword']!;
  String get profileSettings => _strings['profileSettings']!;
  String get editProfile => _strings['editProfile']!;
  String get avatar => _strings['avatar']!;
  String get name => _strings['name']!;
  String get bio => _strings['bio']!;
  String get following => _strings['following']!;
  String get followers => _strings['followers']!;
  String get language => _strings['language']!;
  String get theme => _strings['theme']!;
  String get darkMode => _strings['darkMode']!;
  String get lightMode => _strings['lightMode']!;
  String get systemDefault => _strings['systemDefault']!;
  String get autoPlay => _strings['autoPlay']!;
  String get autoSkip => _strings['autoSkip']!;
  String get version => _strings['version']!;
  String get license => _strings['license']!;
  String get privacyPolicy => _strings['privacyPolicy']!;
  String get termsOfService => _strings['termsOfService']!;
  String get about => _strings['about']!;
  String get help => _strings['help']!;
  String get feedback => _strings['feedback']!;
  String get support => _strings['support']!;
  String get donate => _strings['donate']!;
  String get notifications => _strings['notifications']!;
  String get offlineMode => _strings['offlineMode']!;
  String get cache => _strings['cache']!;
  String get clearCache => _strings['clearCache']!;
  String get backup => _strings['backup']!;
  String get restore => _strings['restore']!;
  String get export => _strings['export']!;
  String get import => _strings['import']!;
  String get refresh => _strings['refresh']!;
  String get reload => _strings['reload']!;
  String get synopsis => _strings['synopsis']!;
  String get background => _strings['background']!;
  String get relations => _strings['relations']!;
  String get externalLinks => _strings['externalLinks']!;
  String get airingSchedule => _strings['airingSchedule']!;
  String get releaseDate => _strings['releaseDate']!;
  String get endDate => _strings['endDate']!;
  String get genres => _strings['genres']!;
  String get tags => _strings['tags']!;
  String get source => _strings['source']!;
  String get rating => _strings['rating']!;
  String get popularity => _strings['popularity']!;
  String get favoritesCount => _strings['favoritesCount']!;
  String get members => _strings['members']!;
  String get meanScore => _strings['meanScore']!;
  String get rank => _strings['rank']!;
  String get studio => _strings['studio']!;
  String get producer => _strings['producer']!;
  String get licensor => _strings['licensor']!;
  String get cast => _strings['cast']!;
  String get staff => _strings['staff']!;
  String get characters => _strings['characters']!;
  String get episodes => _strings['episodes']!;
  String get chapters => _strings['chapters']!;
  String get volumes => _strings['volumes']!;
  String get lists => _strings['lists']!;
  String get history => _strings['history']!;
  String get favorites => _strings['favorites']!;
  String get recommendations => _strings['recommendations']!;
  String get related => _strings['related']!;
  String get similar => _strings['similar']!;
  String get searchHint => _strings['searchHint']!;
  String get filter => _strings['filter']!;
  String get sort => _strings['sort']!;
  String get comments => _strings['comments']!;
  String get replies => _strings['replies']!;
  String get report => _strings['report']!;
  String get block => _strings['block']!;
  String get mute => _strings['mute']!;
  String get unmute => _strings['unmute']!;
  String get follow => _strings['follow']!;
  String get unfollow => _strings['unfollow']!;
  String get subscribe => _strings['subscribe']!;
  String get unsubscribe => _strings['unsubscribe']!;
  String get compactMode => _strings['compactMode']!;
  String get detailedMode => _strings['detailedMode']!;
  String get sauceFinder => _strings['sauceFinder']!;
  String get contributors => _strings['contributors']!;
  String get dependencies => _strings['dependencies']!;
  String get versionCopied => _strings['versionCopied']!;
  String get developer => _strings['developer']!;
  String get coreTeam => _strings['coreTeam']!;
  String get specialThanks => _strings['specialThanks']!;
  String get communityContributors => _strings['communityContributors']!;
  String get noContributors => _strings['noContributors']!;
  String get failedToLoadContributors => _strings['failedToLoadContributors']!;
  String get cardStyle => _strings['cardStyle']!;
  String get cardStyleSaikou => _strings['cardStyleSaikou']!;
  String get cardStyleSaikouDesc => _strings['cardStyleSaikouDesc']!;
  String get cardStyleModern => _strings['cardStyleModern']!;
  String get cardStyleModernDesc => _strings['cardStyleModernDesc']!;
  String get cardStyleExotic => _strings['cardStyleExotic']!;
  String get cardStyleExoticDesc => _strings['cardStyleExoticDesc']!;
  String get carouselStyle => _strings['carouselStyle']!;
  String get carouselStyleName0 => _strings['carouselStyleName0']!;
  String get carouselStyleDesc0 => _strings['carouselStyleDesc0']!;
  String get carouselStyleName1 => _strings['carouselStyleName1']!;
  String get carouselStyleDesc1 => _strings['carouselStyleDesc1']!;
  String get historyCardStyle => _strings['historyCardStyle']!;
  String get historyCardStyleRegular => _strings['historyCardStyleRegular']!;
  String get historyCardStyleBlurred => _strings['historyCardStyleBlurred']!;
  String get historyCardStyleBootiful => _strings['historyCardStyleBootiful']!;
  String get commentSystem => _strings['commentSystem']!;
  String get aboutCommentum => _strings['aboutCommentum']!;
  String get aboutCommentumDesc => _strings['aboutCommentumDesc']!;
  String get userRole => _strings['userRole']!;
  String get superAdminDesc => _strings['superAdminDesc']!;
  String get adminDesc => _strings['adminDesc']!;
  String get moderatorDesc => _strings['moderatorDesc']!;
  String get userDesc => _strings['userDesc']!;
  String get moderationPanel => _strings['moderationPanel']!;
  String get moderationPanelDesc => _strings['moderationPanelDesc']!;
  String get reportedComments => _strings['reportedComments']!;
  String get reportedCommentsDesc => _strings['reportedCommentsDesc']!;
  String get commentPreferences => _strings['commentPreferences']!;
  String get commentPreferencesDesc => _strings['commentPreferencesDesc']!;
  String get notificationSettings => _strings['notificationSettings']!;
  String get notificationSettingsDesc => _strings['notificationSettingsDesc']!;
  String get helpAndSupport => _strings['helpAndSupport']!;
  String get helpAndSupportDesc => _strings['helpAndSupportDesc']!;
  String get privacyAndSafety => _strings['privacyAndSafety']!;
  String get privacyAndSafetyDesc => _strings['privacyAndSafetyDesc']!;
  String get commentumFeatures => _strings['commentumFeatures']!;
  String get feature1 => _strings['feature1']!;
  String get feature2 => _strings['feature2']!;
  String get feature3 => _strings['feature3']!;
  String get feature4 => _strings['feature4']!;
  String get feature5 => _strings['feature5']!;
  String get feature6 => _strings['feature6']!;
  String get userRolesPermissions => _strings['userRolesPermissions']!;
  String get currentRolePermissions => _strings['currentRolePermissions']!;
  String get userPermissions => _strings['userPermissions']!;
  String get moderatorPermissions => _strings['moderatorPermissions']!;
  String get adminPermissions => _strings['adminPermissions']!;
  String get superAdminPermissions => _strings['superAdminPermissions']!;
  String get noModeratorPermission => _strings['noModeratorPermission']!;
  String get moderationPanelComingSoon => _strings['moderationPanelComingSoon']!;
  String get reportsPanelComingSoon => _strings['reportsPanelComingSoon']!;
  String get commentPrefFuture => _strings['commentPrefFuture']!;
  String get plannedFeatures => _strings['plannedFeatures']!;
  String get sortDefault => _strings['sortDefault']!;
  String get commentDensity => _strings['commentDensity']!;
  String get showHideAvatars => _strings['showHideAvatars']!;
  String get fontSizeAdjust => _strings['fontSizeAdjust']!;
  String get autoPlayVideos => _strings['autoPlayVideos']!;
  String get notificationFuture => _strings['notificationFuture']!;
  String get notifReplies => _strings['notifReplies']!;
  String get notifMentions => _strings['notifMentions']!;
  String get notifModeration => _strings['notifModeration']!;
  String get notifReportResolution => _strings['notifReportResolution']!;
  String get howToUse => _strings['howToUse']!;
  String get step1 => _strings['step1']!;
  String get step2 => _strings['step2']!;
  String get step3 => _strings['step3']!;
  String get step4 => _strings['step4']!;
  String get step5 => _strings['step5']!;
  String get needHelp => _strings['needHelp']!;
  String get helpText => _strings['helpText']!;
  String get privacyImportant => _strings['privacyImportant']!;
  String get privacy1 => _strings['privacy1']!;
  String get privacy2 => _strings['privacy2']!;
  String get privacy3 => _strings['privacy3']!;
  String get privacy4 => _strings['privacy4']!;
  String get safetyFeatures => _strings['safetyFeatures']!;
  String get safety1 => _strings['safety1']!;
  String get safety2 => _strings['safety2']!;
  String get safety3 => _strings['safety3']!;
  String get safety4 => _strings['safety4']!;
  String get experimentalSettings => _strings['experimentalSettings']!;
  String get reader => _strings['reader']!;
  String get cacheDuration => _strings['cacheDuration']!;
  String get cacheDurationDesc => _strings['cacheDurationDesc']!;
  String get player => _strings['player']!;
  String get anime4kEnhancement => _strings['anime4kEnhancement']!;
  String get anime4kDesc => _strings['anime4kDesc']!;
  String get enableShaders => _strings['enableShaders']!;
  String get shadersDescMobile => _strings['shadersDescMobile']!;
  String get shadersDescDesktop => _strings['shadersDescDesktop']!;
  String get chooseShaderProfile => _strings['chooseShaderProfile']!;
  String get shaderProfileDesc => _strings['shaderProfileDesc']!;
  String get selectProfile => _strings['selectProfile']!;
  String get warning => _strings['warning']!;
  String get warningBlackScreen => _strings['warningBlackScreen']!;
  String get warningLag => _strings['warningLag']!;
  String get shaderProfilesInit => _strings['shaderProfilesInit']!;
  String get shaderShortcuts => _strings['shaderShortcuts']!;
  String get keybindings => _strings['keybindings']!;
  String get downloadShaders => _strings['downloadShaders']!;
  String get downloadSize => _strings['downloadSize']!;
  String get midEnd => _strings['midEnd']!;
  String get highEnd => _strings['highEnd']!;
  String get yourRole => _strings['yourRole']!;
  String get moderationQueue => _strings['moderationQueue']!;
  String get pendingReports => _strings['pendingReports']!;
  String get userManagement => _strings['userManagement']!;
  String get userManagementDesc => _strings['userManagementDesc']!;
  String get moderationHistory => _strings['moderationHistory']!;
  String get moderationHistoryDesc => _strings['moderationHistoryDesc']!;
  String get searchUser => _strings['searchUser']!;
  String get searchUserDesc => _strings['searchUserDesc']!;
  String get searchComments => _strings['searchComments']!;
  String get searchCommentsDesc => _strings['searchCommentsDesc']!;
  String get statisticsDesc => _strings['statisticsDesc']!;
  String get moderationNotifDesc => _strings['moderationNotifDesc']!;
  String get moderationRules => _strings['moderationRules']!;
  String get moderationRulesDesc => _strings['moderationRulesDesc']!;
  String get noAdminPermission => _strings['noAdminPermission']!;
  String get moderationQueueComingSoon => _strings['moderationQueueComingSoon']!;
  String get userManagementComingSoon => _strings['userManagementComingSoon']!;
  String get modHistoryFuture => _strings['modHistoryFuture']!;
  String get filterActionType => _strings['filterActionType']!;
  String get filterDateRange => _strings['filterDateRange']!;
  String get filterModerator => _strings['filterModerator']!;
  String get exportLogs => _strings['exportLogs']!;
  String get appealSystem => _strings['appealSystem']!;
  String get userSearchFuture => _strings['userSearchFuture']!;
  String get searchByUsername => _strings['searchByUsername']!;
  String get searchByUserId => _strings['searchByUserId']!;
  String get searchByCommentHistory => _strings['searchByCommentHistory']!;
  String get advancedFiltering => _strings['advancedFiltering']!;
  String get commentSearchFuture => _strings['commentSearchFuture']!;
  String get searchByContent => _strings['searchByContent']!;
  String get searchByDateRange => _strings['searchByDateRange']!;
  String get searchByReportStatus => _strings['searchByReportStatus']!;
  String get statisticsFuture => _strings['statisticsFuture']!;
  String get plannedMetrics => _strings['plannedMetrics']!;
  String get reportsResolved => _strings['reportsResolved']!;
  String get usersWarnedBanned => _strings['usersWarnedBanned']!;
  String get commentsModerated => _strings['commentsModerated']!;
  String get responseTimes => _strings['responseTimes']!;
  String get trendsAnalytics => _strings['trendsAnalytics']!;
  String get modNotifFuture => _strings['modNotifFuture']!;
  String get plannedNotifications => _strings['plannedNotifications']!;
  String get newReports => _strings['newReports']!;
  String get reportResolutions => _strings['reportResolutions']!;
  String get userAppeals => _strings['userAppeals']!;
  String get systemAlerts => _strings['systemAlerts']!;
  String get modRulesFuture => _strings['modRulesFuture']!;
  String get customBannedKeywords => _strings['customBannedKeywords']!;
  String get autoModThresholds => _strings['autoModThresholds']!;
  String get rolePermissions => _strings['rolePermissions']!;
  String get contentFilteringRules => _strings['contentFilteringRules']!;
  String get imageCacheCleared => _strings['imageCacheCleared']!;
  String get clearCacheFailed => _strings['clearCacheFailed']!;
  String get factoryReset => _strings['factoryReset']!;
  String get factoryResetWarning => _strings['factoryResetWarning']!;
  String get deleteAll => _strings['deleteAll']!;
  String get isarDataDeleted => _strings['isarDataDeleted']!;
  String get factoryResetFailed => _strings['factoryResetFailed']!;
  String get cachedImages => _strings['cachedImages']!;
  String get threshold => _strings['threshold']!;
  String get autoClearThreshold => _strings['autoClearThreshold']!;
  String get autoClearDesc => _strings['autoClearDesc']!;
  String get clearImageCacheNow => _strings['clearImageCacheNow']!;
  String get clearImageCacheDesc => _strings['clearImageCacheDesc']!;
  String get factoryResetDesc => _strings['factoryResetDesc']!;
  String get cacheExceededCleared => _strings['cacheExceededCleared']!;
  String get tapZones => _strings['tapZones']!;
  String get resetToDefault => _strings['resetToDefault']!;
  String get resetLayout => _strings['resetLayout']!;
  String get resetLayoutWarning => _strings['resetLayoutWarning']!;
  String get paged => _strings['paged']!;
  String get webtoon => _strings['webtoon']!;
  String get enableTapZones => _strings['enableTapZones']!;
  String get useCustomGestures => _strings['useCustomGestures']!;
  String get tapZoneInstruction => _strings['tapZoneInstruction']!;
  String get tapAction => _strings['tapAction']!;
  String get noExtensionManagers => _strings['noExtensionManagers']!;
  String get failedToRemoveRepo => _strings['failedToRemoveRepo']!;
  String get notSupported => _strings['notSupported']!;
  String get animeNotSupported => _strings['animeNotSupported']!;
  String get mangaNotSupported => _strings['mangaNotSupported']!;
  String get novelNotSupported => _strings['novelNotSupported']!;
  String get noRepositoriesYet => _strings['noRepositoriesYet']!;
  String get tapToAddRepo => _strings['tapToAddRepo']!;
  String get urlCopied => _strings['urlCopied']!;
  String get remove => _strings['remove']!;
  String get addRepo => _strings['addRepo']!;
  String get addRepository => _strings['addRepository']!;
  String get repositoryUrlLabel => _strings['repositoryUrlLabel']!;
  String get repositoryUrlHint => _strings['repositoryUrlHint']!;
  String get adding => _strings['adding']!;
  String get dataManagement => _strings['dataManagement']!;
  String get currentLibrary => _strings['currentLibrary']!;
  String get actions => _strings['actions']!;
  String get createBackup => _strings['createBackup']!;
  String get backupSubtitle => _strings['backupSubtitle']!;
  String get restoreData => _strings['restoreData']!;
  String get restoreSubtitle => _strings['restoreSubtitle']!;
  String get passwordsDontMatch => _strings['passwordsDontMatch']!;
  String get backupSuccess => _strings['backupSuccess']!;
  String get backupFailed => _strings['backupFailed']!;
  String get invalidBackup => _strings['invalidBackup']!;
  String get restoreSuccess => _strings['restoreSuccess']!;
  String get restoreFailed => _strings['restoreFailed']!;
  String get errorSelectingFile => _strings['errorSelectingFile']!;
  String get passwordRequired => _strings['passwordRequired']!;
  String get passwordRequiredHint => _strings['passwordRequiredHint']!;
  String get backupPassword => _strings['backupPassword']!;
  String get enterPassword => _strings['enterPassword']!;
  String get unlock => _strings['unlock']!;
  String get backupOptions => _strings['backupOptions']!;
  String get protectBackup => _strings['protectBackup']!;
  String get passwordProtect => _strings['passwordProtect']!;
  String get passwordProtectHint => _strings['passwordProtectHint']!;
  String get confirmPassword => _strings['confirmPassword']!;
  String get reenterPassword => _strings['reenterPassword']!;
  String get restorePreview => _strings['restorePreview']!;
  String get encrypted => _strings['encrypted']!;
  String get restoreWarning => _strings['restoreWarning']!;
  String get confirmRestore => _strings['confirmRestore']!;
  String get backupOwner => _strings['backupOwner']!;
  String get libraryStatistics => _strings['libraryStatistics']!;
  String get totalItems => _strings['totalItems']!;
  String get customLists => _strings['customLists']!;
  String get lists => _strings['lists']!;
  String get socialPresence => _strings['socialPresence']!;
  String get trackingServices => _strings['trackingServices']!;
  String get connectDiscord => _strings['connectDiscord']!;
  String get richPresenceActive => _strings['richPresenceActive']!;
  String get showWhatYouAreWatching => _strings['showWhatYouAreWatching']!;
  String get disconnectDiscord => _strings['disconnectDiscord']!;
  String get richPresenceStopUpdate => _strings['richPresenceStopUpdate']!;
  String get disconnect => _strings['disconnect']!;
  String get notConnected => _strings['notConnected']!;
  String get connectedAs => _strings['connectedAs']!;
  String get manage => _strings['manage']!;
  String get connect => _strings['connect']!;
  String get user => _strings['user']!;
  String get experimental => _strings['experimental']!;
  String get enableExperimentalSettings => _strings['enableExperimentalSettings']!;
  String get experimentalDescription => _strings['experimentalDescription']!;
  String get experimentalGateMessage => _strings['experimentalGateMessage']!;
  String get decoderHwdec => _strings['decoderHwdec']!;
  String get videoSync => _strings['videoSync']!;
  String get frameInterpolation => _strings['frameInterpolation']!;
  String get frameInterpolationDesc => _strings['frameInterpolationDesc']!;
  String get audioPitchCorrection => _strings['audioPitchCorrection']!;
  String get audioPitchCorrectionDesc => _strings['audioPitchCorrectionDesc']!;
  String get cacheMinutes => _strings['cacheMinutes']!;
  String get cacheMinutesDesc => _strings['cacheMinutesDesc']!;
  String get demuxerReadahead => _strings['demuxerReadahead']!;
  String get demuxerReadaheadDesc => _strings['demuxerReadaheadDesc']!;
  String get demuxerMaxBuffer => _strings['demuxerMaxBuffer']!;
  String get demuxerMaxBufferDesc => _strings['demuxerMaxBufferDesc']!;
  String get decoderThreads => _strings['decoderThreads']!;
  String get decoderThreadsDesc => _strings['decoderThreadsDesc']!;
  String get bufferSize => _strings['bufferSize']!;
  String get bufferSizeDesc => _strings['bufferSizeDesc']!;
  String get useBuffering => _strings['useBuffering']!;
  String get useBufferingDesc => _strings['useBufferingDesc']!;
  String get useLibmpv => _strings['useLibmpv']!;
  String get useLibmpvDesc => _strings['useLibmpvDesc']!;
  String get useLibass => _strings['useLibass']!;
  String get useLibassDesc => _strings['useLibassDesc']!;
  String get jsonThemeManager => _strings['jsonThemeManager']!;
  String get jsonThemeInfo => _strings['jsonThemeInfo']!;
  String get swipeIndicatorTheme => _strings['swipeIndicatorTheme']!;
  String get defaultPortrait => _strings['defaultPortrait']!;
  String get defaultPortraitDesc => _strings['defaultPortraitDesc']!;
  String get autoSkipOp => _strings['autoSkipOp']!;
  String get autoSkipOpDesc => _strings['autoSkipOpDesc']!;
  String get autoSkipEd => _strings['autoSkipEd']!;
  String get autoSkipEdDesc => _strings['autoSkipEdDesc']!;
  String get autoSkipRecap => _strings['autoSkipRecap']!;
  String get autoSkipRecapDesc => _strings['autoSkipRecapDesc']!;
  String get autoSkipOnce => _strings['autoSkipOnce']!;
  String get autoSkipOnceDesc => _strings['autoSkipOnceDesc']!;
  String get autoSkipFiller => _strings['autoSkipFiller']!;
  String get autoSkipFillerDesc => _strings['autoSkipFillerDesc']!;
  String get enableSwipeControls => _strings['enableSwipeControls']!;
  String get enableSwipeControlsDesc => _strings['enableSwipeControlsDesc']!;
  String get saveLastFrame => _strings['saveLastFrame']!;
  String get saveLastFrameDesc => _strings['saveLastFrameDesc']!;
  String get doubleTapSeek => _strings['doubleTapSeek']!;
  String get doubleTapSeekDesc => _strings['doubleTapSeekDesc']!;
  String get megaSkipDuration => _strings['megaSkipDuration']!;
  String get megaSkipDurationDesc => _strings['megaSkipDurationDesc']!;
  String get markAsWatchedDesc => _strings['markAsWatchedDesc']!;
  String get transitionSubtitle => _strings['transitionSubtitle']!;
  String get transitionSubtitleDesc => _strings['transitionSubtitleDesc']!;
  String get autoTranslateSubtitles => _strings['autoTranslateSubtitles']!;
  String get autoTranslateSubtitlesDesc => _strings['autoTranslateSubtitlesDesc']!;
  String get subtitleFont => _strings['subtitleFont']!;
  String get subtitleTransparency => _strings['subtitleTransparency']!;
  String get subtitleTransparencyDesc => _strings['subtitleTransparencyDesc']!;
  String get bottomMargin => _strings['bottomMargin']!;
  String get bottomMarginDesc => _strings['bottomMarginDesc']!;
  String get changeSubtitleColor => _strings['changeSubtitleColor']!;
  String get subtitleColor => _strings['subtitleColor']!;
  String get selectSubtitleColor => _strings['selectSubtitleColor']!;
  String get subtitleOutlineColor => _strings['subtitleOutlineColor']!;
  String get changeSubtitleOutlineColor => _strings['changeSubtitleOutlineColor']!;
  String get selectSubtitleOutlineColor => _strings['selectSubtitleOutlineColor']!;
  String get subtitleBackgroundColor => _strings['subtitleBackgroundColor']!;
  String get changeSubtitleBackgroundColor => _strings['changeSubtitleBackgroundColor']!;
  String get selectSubtitleBackgroundColor => _strings['selectSubtitleBackgroundColor']!;
  String get selectSubtitleFont => _strings['selectSubtitleFont']!;
  String get outlineType => _strings['outlineType']!;
  String get subtitleOutlineWidth => _strings['subtitleOutlineWidth']!;
  String get adjustSubtitleOutlineWidth => _strings['adjustSubtitleOutlineWidth']!;
  String get subtitlePreview => _strings['subtitlePreview']!;
  String get subtitlePreviewText => _strings['subtitlePreviewText']!;
  String get bottomControls => _strings['bottomControls']!;
  String get leftSide => _strings['leftSide']!;
  String get rightSide => _strings['rightSide']!;
  String get hidden => _strings['hidden']!;
  String get showOnLeft => _strings['showOnLeft']!;
  String get showOnRight => _strings['showOnRight']!;
  String get hideButton => _strings['hideButton']!;
  String get moveToRight => _strings['moveToRight']!;
  String get moveToLeft => _strings['moveToLeft']!;
  String get controlTheme => _strings['controlTheme']!;
  String get playbackSpeed => _strings['playbackSpeed']!;
  String get appearance => _strings['appearance']!;
  String get defaultTheme => _strings['defaultTheme']!;
  String get defaultThemeDesc => _strings['defaultThemeDesc']!;
  String get materialYou => _strings['materialYou']!;
  String get materialYouDesc => _strings['materialYouDesc']!;
  String get liquidMode => _strings['liquidMode']!;
  String get liquidModeDesc => _strings['liquidModeDesc']!;
  String get liquidBackground => _strings['liquidBackground']!;
  String get liquidBackgroundDesc => _strings['liquidBackgroundDesc']!;
  String get retainOriginalColor => _strings['retainOriginalColor']!;
  String get retainOriginalColorDesc => _strings['retainOriginalColorDesc']!;
  String get usePosterColor => _strings['usePosterColor']!;
  String get usePosterColorDesc => _strings['usePosterColorDesc']!;
  String get resetToDefaultPicture => _strings['resetToDefaultPicture']!;
  String get resetToDefaultPictureDesc => _strings['resetToDefaultPictureDesc']!;
  String get extras => _strings['extras']!;
  String get bloom => _strings['bloom']!;
  String get bloomDesc => _strings['bloomDesc']!;
  String get palette => _strings['palette']!;
  String get paletteDesc => _strings['paletteDesc']!;
  String get oledMode => _strings['oledMode']!;
  String get oledModeDesc => _strings['oledModeDesc']!;
  String get customTheme => _strings['customTheme']!;
  String get customThemeDesc => _strings['customThemeDesc']!;
  String get logoAnimation => _strings['logoAnimation']!;
  String get logoAnimationDesc => _strings['logoAnimationDesc']!;
  String get customThemes => _strings['customThemes']!;
  String get palettes => _strings['palettes']!;
  String get common => _strings['common']!;
  String get universal => _strings['universal']!;
  String get askForTrackingPermission => _strings['askForTrackingPermission']!;
  String get askForTrackingPermissionDesc => _strings['askForTrackingPermissionDesc']!;
  String get hideAdultContent => _strings['hideAdultContent']!;
  String get hideAdultContentDesc => _strings['hideAdultContentDesc']!;
  String get showContinueWatchingCard => _strings['showContinueWatchingCard']!;
  String get showContinueWatchingCardDesc => _strings['showContinueWatchingCardDesc']!;
  String get anilist => _strings['anilist']!;
  String get manageAnilistLists => _strings['manageAnilistLists']!;
  String get myAnimeList => _strings['myAnimeList']!;
  String get manageMyAnimeListLists => _strings['manageMyAnimeListLists']!;
  String get chooseListToShowOnHome => _strings['chooseListToShowOnHome']!;
  String get manageHomePageCards => _strings['manageHomePageCards']!;
  String get chapter => _strings['chapter']!;
  String get unknown => _strings['unknown']!;
  String get errorMissingData => _strings['errorMissingData']!;
  String get cannotPlayAbruptClose => _strings['cannotPlayAbruptClose']!;
  String get page => _strings['page']!;
  String get holdToAccessHistoryEditor => _strings['holdToAccessHistoryEditor']!;
  String get installExtension => _strings['installExtension']!;
  String get adult => _strings['adult']!;
  String get image => _strings['image']!;
  String get searchResults => _strings['searchResults']!;
  String get tryAgain => _strings['tryAgain']!;
  String get searching => _strings['searching']!;
  String get oopsSomethingWrong => _strings['oopsSomethingWrong']!;
  String get pleaseTryAgainLater => _strings['pleaseTryAgainLater']!;
  String get noResultsFound => _strings['noResultsFound']!;
  String get tryAdjustingSearch => _strings['tryAdjustingSearch']!;
  String get networkError => _strings['networkError']!;
  String get timeoutError => _strings['timeoutError']!;
  String get serviceUnavailable => _strings['serviceUnavailable']!;
  String get somethingWentWrong => _strings['somethingWentWrong']!;
  String get myAnimeOnly => _strings['myAnimeOnly']!;
  String get hideMyAnime => _strings['hideMyAnime']!;
  String get myMangaOnly => _strings['myMangaOnly']!;
  String get hideMyManga => _strings['hideMyManga']!;
  String get season => _strings['season']!;
  String get country => _strings['country']!;
  String get countryOfOrigin => _strings['countryOfOrigin']!;
  String get year => _strings['year']!;
  String get duration => _strings['duration']!;
  String get format => _strings['format']!;
  String get airingStatus => _strings['airingStatus']!;
  String get publishingStatus => _strings['publishingStatus']!;
  String get useYearRange => _strings['useYearRange']!;
  String get episodesAndDuration => _strings['episodesAndDuration']!;
  String get filterByEpisodeCount => _strings['filterByEpisodeCount']!;
  String get filterByDuration => _strings['filterByDuration']!;
  String get minutesShort => _strings['minutesShort']!;
  String get episodesShort => _strings['episodesShort']!;
  String get chaptersAndVolumes => _strings['chaptersAndVolumes']!;
  String get filterByChapterCount => _strings['filterByChapterCount']!;
  String get filterByVolumeCount => _strings['filterByVolumeCount']!;
  String get chaptersShort => _strings['chaptersShort']!;
  String get volumesShort => _strings['volumesShort']!;
  String get selectSort => _strings['selectSort']!;
  String get sortBy => _strings['sortBy']!;
  String get order => _strings['order']!;
  String get addTags => _strings['addTags']!;
  String get selectTags => _strings['selectTags']!;
  String get searchTagsHint => _strings['searchTagsHint']!;
  String get streamingOn => _strings['streamingOn']!;
  String get readableOn => _strings['readableOn']!;
  String get selectStreamingService => _strings['selectStreamingService']!;
  String get selectReadingPlatform => _strings['selectReadingPlatform']!;
  String get options => _strings['options']!;
  String get applyFilters => _strings['applyFilters']!;

  // 带参数的方法
  String installExtensionFirst(String sourceName) => _strings['installExtensionFirst']!.replaceAll('{sourceName}', sourceName);
  String editTags(int count) => _strings['editTags']!.replaceAll('{count}', count.toString());
  String doneWithCount(int count) => _strings['doneWithCount']!.replaceAll('{count}', count.toString());
  String editServices(int count) => _strings['editServices']!.replaceAll('{count}', count.toString());
  String editPlatforms(int count) => _strings['editPlatforms']!.replaceAll('{count}', count.toString());
  String repoAdded(int count) {
    if (count == 1) {
      return _strings['repoAddedSingular']!;
    } else {
      return _strings['repoAddedPlural']!.replaceFirst('\$count', count.toString());
    }
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) => false;
}