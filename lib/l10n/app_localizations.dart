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
    'chapter': 'Chapter',
    'unknown': '??',
    'errorMissingData': 'Error: Missing required data. It seems you closed the app directly after reading the chapter!',
    'cannotPlayAbruptClose': "Can't play because you closed the app abruptly.",
    'installExtensionFirst': 'Install {sourceName} first, then click.',
    'page': 'Page',
    'holdToAccessHistoryEditor': 'Hold to access history editor',
    'installExtension': 'Install',
    'adult': 'Adult',
    'filter': 'Filters',
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
    'done': 'Done',
    'streamingOn': 'Streaming On',
    'readableOn': 'Readable On',
    'selectStreamingService': 'Select Streaming Service',
    'selectReadingPlatform': 'Select Reading Platform',
    'editServices': 'Edit Services ({count})',
    'editPlatforms': 'Edit Platforms ({count})',
    'options': 'Options',
    'applyFilters': 'Apply Filters',
    'reset': 'Reset',

    // 原有键...
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
    'password': 'Password',
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
    'apply': 'Apply',
    'clear': 'Clear',

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
  };

  static const Map<String, String> _zh = {
    // 通用
    'chapter': '章',
    'unknown': '??',
    'errorMissingData': '错误：缺少必要数据。您可能在阅读章节后直接关闭了应用！',
    'cannotPlayAbruptClose': '无法播放，因为您突然关闭了应用。',
    'installExtensionFirst': '请先安装 {sourceName}，再点击。',
    'page': '页',
    'holdToAccessHistoryEditor': '长按以访问历史编辑器',
    'installExtension': '安装',
    'adult': '成人内容',
    'filter': '筛选',
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
    'done': '完成',
    'streamingOn': '流媒体平台',
    'readableOn': '可阅读平台',
    'selectStreamingService': '选择流媒体服务',
    'selectReadingPlatform': '选择阅读平台',
    'editServices': '编辑服务 ({count})',
    'editPlatforms': '编辑平台 ({count})',
    'options': '选项',
    'applyFilters': '应用筛选',
    'reset': '重置',

    // 原有键...
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
    'password': '密码',
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
    'apply': '应用',
    'clear': '清除',

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
  };

  Map<String, String> get _strings {
    switch (locale.languageCode) {
      case 'zh':
        return _zh;
      default:
        return _en;
    }
  }

  // 通用 getter
  String get chapter => _strings['chapter']!;
  String get unknown => _strings['unknown']!;
  String get errorMissingData => _strings['errorMissingData']!;
  String get cannotPlayAbruptClose => _strings['cannotPlayAbruptClose']!;
  String get installExtensionFirst => _strings['installExtensionFirst']!;
  String get page => _strings['page']!;
  String get holdToAccessHistoryEditor => _strings['holdToAccessHistoryEditor']!;
  String get installExtension => _strings['installExtension']!;
  String get adult => _strings['adult']!;
  String get filter => _strings['filter']!;
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
  String get chapters => _strings['chapters']!;
  String get volumes => _strings['volumes']!;
  String get episodes => _strings['episodes']!;
  String get format => _strings['format']!;
  String get source => _strings['source']!;
  String get status => _strings['status']!;
  String get sort => _strings['sort']!;
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
  String get done => _strings['done']!;
  String get streamingOn => _strings['streamingOn']!;
  String get readableOn => _strings['readableOn']!;
  String get selectStreamingService => _strings['selectStreamingService']!;
  String get selectReadingPlatform => _strings['selectReadingPlatform']!;
  String get options => _strings['options']!;
  String get applyFilters => _strings['applyFilters']!;
  String get reset => _strings['reset']!;

  // 带参数的方法
  String editTags(int count) => _strings['editTags']!.replaceAll('{count}', count.toString());
  String doneWithCount(int count) => _strings['doneWithCount']!.replaceAll('{count}', count.toString());
  String editServices(int count) => _strings['editServices']!.replaceAll('{count}', count.toString());
  String editPlatforms(int count) => _strings['editPlatforms']!.replaceAll('{count}', count.toString());

  // 以下是原有 getter（保留）
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
  String get password => _strings['password']!;
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
  String get synopsis => _strings['synopsis']!;
  String get background => _strings['background']!;
  String get relations => _strings['relations']!;
  String get externalLinks => _strings['externalLinks']!;
  String get airingSchedule => _strings['airingSchedule']!;
  String get releaseDate => _strings['releaseDate']!;
  String get endDate => _strings['endDate']!;
  String get genres => _strings['genres']!;
  String get tags => _strings['tags']!;
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
  String get lists => _strings['lists']!;
  String get history => _strings['history']!;
  String get favorites => _strings['favorites']!;
  String get recommendations => _strings['recommendations']!;
  String get related => _strings['related']!;
  String get similar => _strings['similar']!;
  String get searchHint => _strings['searchHint']!;
  String get apply => _strings['apply']!;
  String get clear => _strings['clear']!;
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