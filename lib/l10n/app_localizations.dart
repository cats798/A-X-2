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
    // 所有键(与app_en.arb一致)
    'appTitle': 'AnymeX',
    'continueWatching': 'Continue Watching',
    'loginPrompt': 'W-what are you doing step-bro, login before you do that (●´⌓`●)',
    'greetingHey': 'Hey ',
    'greetingQuestion': ', what are we doing today?',
    'homeSubtitle': 'Find your favourite anime or manga, manhwa or whatever you like!',
    'recommendedNovels': 'Recommended Novels',
    'guest': 'Guest',
    'shareLogs': 'Share Logs',
    'shareLogsDescription': 'Share app log files to help developers diagnose issues',
    'extensionsDescription': 'Extensions',
    'themeDescription': 'Theme description',
    'readerDescription': 'Reader settings description',
    'playerDescription': 'Player Description',
    'uiDescription': 'UI Settings',
    'ui': 'UI',
    'days': 'days',
    'downloadFailed': 'Download failed',
    'shadersInstalledSuccess': 'Shaders installed successfully!',
    'installComplete': 'Installation complete',
    'finalizingInstall': 'Finalizing installation...',
    'extractingShaders': 'Extracting shaders...',
    'downloadCompleteExtracting': 'Download complete, extracting...',
    'downloadingShaders': 'Downloading shaders...',
    'connecting': 'Connecting...',
    'episode': 'Episode',
    'initDownload': 'Initialize download',
    'storageManagerDescription': 'Manage storage and cache settings',
    'storageManager': 'Storage Manager',
    'backupRestoreDescription': 'Backup and restore your data',
    'backupAndRestore': 'Backup & Restore',
    'tweakSettings': 'Tweak Settings',
    'accountsDescription': 'Manage your connected accounts',
    'accounts': 'Accounts',
    'versionCopied': 'Version copied',
    'developer': 'Developer',
    'coreTeam': 'Core Team',
    'specialThanks': 'Special Thanks',
    'communityContributors': 'Community Contributors',
    'staff': 'Staff',
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
    'about': 'About',
    'aboutDescription': 'About this application',
    'common': 'Common',
    'experimental': 'Experimental',
    'experimentalDescription': 'Experimental features (may be unstable)',
    'extensions': 'Extensions',
    'player': 'Player',
    'reader': 'Reader',
    'settings': 'Settings',
    'theme': 'Theme',
    'playerTheme': 'Player Theme',
    'controlTheme': 'Control Theme',
    'swipeIndicatorTheme': 'Swipe Indicator Theme',
    'resizeMode': 'Resize Mode',
    'selectSubtitleFont': 'Select Subtitle Font',
    'outlineType': 'Outline Type',
    'enableExperimentalSettings': 'Enable Experimental Settings',
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
    'subtitleSize': 'Subtitle Size',
    'adjustSubtitleSize': 'Adjust subtitle size',
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
    'playbackSpeed': 'Playback Speed',
    'mpvDecoder': 'Mpv Decoder',
    'translateTo': 'Translate to',
  };

  static const Map<String, String> _zh = {
    // 所有中文键(与app_zh.arb一致)
    'appTitle': 'AnymeX',
    'continueWatching': '继续观看',
    'loginPrompt': '诶？你在干什么啊，兄弟！请先登录再操作哦 (●´⌓`●)',
    'greetingHey': '你好，',
    'greetingQuestion': '今天想看什么？',
    'homeSubtitle': '发现你最爱的动漫、漫画、网络小说，或者任何你喜欢的内容！',
    'recommendedNovels': '推荐小说',
    'guest': '访客',
    'shareLogs': '分享日志',
    'shareLogsDescription': '分享应用日志文件以帮助开发者诊断问题',
    'extensionsDescription': '扩展功能',
    'themeDescription': '主题设置说明',
    'readerDescription': '阅读器设置说明',
    'playerDescription': '播放器设置说明',
    'uiDescription': '用户界面设置',
    'ui': '界面',
    'days': '天',
    'downloadFailed': '下载失败',
    'shadersInstalledSuccess': '着色器安装成功！',
    'installComplete': '安装完成',
    'finalizingInstall': '正在完成安装...',
    'extractingShaders': '正在解压着色器...',
    'downloadCompleteExtracting': '下载完成，正在解压...',
    'downloadingShaders': '正在下载着色器...',
    'connecting': '连接中...',
    'episode': '集',
    'initDownload': '初始化下载',
    'storageManagerDescription': '管理存储和缓存设置',
    'storageManager': '存储管理',
    'backupRestoreDescription': '备份和恢复你的数据',
    'backupAndRestore': '备份与恢复',
    'tweakSettings': '高级设置',
    'accountsDescription': '管理你的连接账户',
    'accounts': '账户',
    'versionCopied': '版本号已复制',
    'developer': '开发者',
    'coreTeam': '核心团队',
    'specialThanks': '特别感谢',
    'communityContributors': '社区贡献者',
    'staff': '工作人员',
    'noContributors': '暂无贡献者',
    'failedToLoadContributors': '加载贡献者失败',
    'cardStyle': '卡片样式',
    'cardStyleSaikou': '极致简约',
    'cardStyleSaikouDesc': '极简主义设计，专注于效率，减少视觉元素',
    'cardStyleModern': '现代风格',
    'cardStyleModernDesc': '干净、现代的设计，比例均衡，阴影柔和',
    'cardStyleExotic': '传统风格',
    'cardStyleExoticDesc': '传统卡片布局，熟悉元素，标准格式',
    'carouselStyle': '轮播样式',
    'carouselStyleName0': '样式 1',
    'carouselStyleDesc0': '样式 1 的描述',
    'carouselStyleName1': '样式 2',
    'carouselStyleDesc1': '样式 2 的描述',
    'historyCardStyle': '历史卡片样式',
    'historyCardStyleRegular': '常规',
    'historyCardStyleBlurred': '模糊效果',
    'historyCardStyleBootiful': '精美效果',
    'commentSystem': '评论系统',
    'aboutCommentum': '关于 Commentum v2',
    'aboutCommentumDesc': '由 Commentum v2 驱动 - 具有审核功能的高级评论系统',
    'userRole': '用户角色',
    'superAdminDesc': '拥有系统的完全访问和控制权限',
    'adminDesc': '可以审核和管理用户',
    'moderatorDesc': '可以审核内容',
    'userDesc': '基本评论权限',
    'moderationPanel': '审核面板',
    'moderationPanelDesc': '访问审核工具和报告',
    'reportedComments': '已举报评论',
    'reportedCommentsDesc': '查看和管理已举报内容',
    'commentPreferences': '评论偏好设置',
    'commentPreferencesDesc': '自定义评论显示和行为',
    'notificationSettings': '通知设置',
    'notificationSettingsDesc': '配置评论通知',
    'helpAndSupport': '帮助与支持',
    'helpAndSupportDesc': '获取评论系统的帮助',
    'privacyAndSafety': '隐私与安全',
    'privacyAndSafetyDesc': '隐私设置和安全功能',
    'about': '关于',
    'aboutDescription': '关于此应用',
    'common': '通用',
    'experimental': '实验性功能',
    'experimentalDescription': '实验性功能(可能不稳定)',
    'extensions': '扩展功能',
    'player': '播放器',
    'reader': '阅读器',
    'settings': '设置',
    'theme': '主题',
    'playerTheme': '播放器主题',
    'controlTheme': '控制主题',
    'swipeIndicatorTheme': '滑动指示器主题',
    'resizeMode': '缩放模式',
    'selectSubtitleFont': '选择字幕字体',
    'outlineType': '描边类型',
    'enableExperimentalSettings': '启用实验性设置',
    'experimentalGateMessage': '核心和视觉设置已禁用。启用实验性以使用它们。',
    'decoderHwdec': '解码器 (HWDec)',
    'videoSync': '视频同步',
    'frameInterpolation': '帧插值',
    'frameInterpolationDesc': '运动更流畅，可能增加 GPU 使用率',
    'audioPitchCorrection': '音高修正',
    'audioPitchCorrectionDesc': '在高速播放时保持音调稳定',
    'cacheMinutes': '缓存分钟数',
    'cacheMinutesDesc': '预读取时长(分钟)',
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
    'useLibmpvDesc': '明智选择！(LibMpv → 功能丰富，ExoPlayer → 性能优先)',
    'useLibass': '使用 Libass 字幕',
    'useLibassDesc': '使用 libass 库提供更好的字幕渲染',
    'jsonThemeManager': 'JSON 主题管理器',
    'jsonThemeInfo': '如果您正在使用 JSON 主题，此处更改不会影响播放器控件。切换回内置主题以应用这些设置。',
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
    'subtitleSize': '字幕大小',
    'adjustSubtitleSize': '调整字幕大小',
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
    'playbackSpeed': '播放速度',
    'mpvDecoder': 'Mpv 解码器',
    'translateTo': '翻译到',
  };

  Map<String, String> get _strings {
    switch (locale.languageCode) {
      case 'zh':
        return _zh;
      default:
        return _en;
    }
  }

  // 所有 getter(已完整包含所有键)
  String get appTitle => _strings['appTitle']!;
  String get continueWatching => _strings['continueWatching']!;
  String get loginPrompt => _strings['loginPrompt']!;
  String get greetingHey => _strings['greetingHey']!;
  String get greetingQuestion => _strings['greetingQuestion']!;
  String get homeSubtitle => _strings['homeSubtitle']!;
  String get recommendedNovels => _strings['recommendedNovels']!;
  String get guest => _strings['guest']!;
  String get shareLogs => _strings['shareLogs']!;
  String get shareLogsDescription => _strings['shareLogsDescription']!;
  String get extensionsDescription => _strings['extensionsDescription']!;
  String get themeDescription => _strings['themeDescription']!;
  String get readerDescription => _strings['readerDescription']!;
  String get playerDescription => _strings['playerDescription']!;
  String get uiDescription => _strings['uiDescription']!;
  String get ui => _strings['ui']!;
  String get days => _strings['days']!;
  String get downloadFailed => _strings['downloadFailed']!;
  String get shadersInstalledSuccess => _strings['shadersInstalledSuccess']!;
  String get installComplete => _strings['installComplete']!;
  String get finalizingInstall => _strings['finalizingInstall']!;
  String get extractingShaders => _strings['extractingShaders']!;
  String get downloadCompleteExtracting => _strings['downloadCompleteExtracting']!;
  String get downloadingShaders => _strings['downloadingShaders']!;
  String get connecting => _strings['connecting']!;
  String get episode => _strings['episode']!;
  String get initDownload => _strings['initDownload']!;
  String get storageManagerDescription => _strings['storageManagerDescription']!;
  String get storageManager => _strings['storageManager']!;
  String get backupRestoreDescription => _strings['backupRestoreDescription']!;
  String get backupAndRestore => _strings['backupAndRestore']!;
  String get tweakSettings => _strings['tweakSettings']!;
  String get accountsDescription => _strings['accountsDescription']!;
  String get accounts => _strings['accounts']!;
  String get versionCopied => _strings['versionCopied']!;
  String get developer => _strings['developer']!;
  String get coreTeam => _strings['coreTeam']!;
  String get specialThanks => _strings['specialThanks']!;
  String get communityContributors => _strings['communityContributors']!;
  String get staff => _strings['staff']!;
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
  String get about => _strings['about']!;
  String get aboutDescription => _strings['aboutDescription']!;
  String get common => _strings['common']!;
  String get experimental => _strings['experimental']!;
  String get experimentalDescription => _strings['experimentalDescription']!;
  String get extensions => _strings['extensions']!;
  String get player => _strings['player']!;
  String get reader => _strings['reader']!;
  String get settings => _strings['settings']!;
  String get theme => _strings['theme']!;
  // 新增的getter
  String get playerTheme => _strings['playerTheme']!;
  String get controlTheme => _strings['controlTheme']!;
  String get swipeIndicatorTheme => _strings['swipeIndicatorTheme']!;
  String get resizeMode => _strings['resizeMode']!;
  String get selectSubtitleFont => _strings['selectSubtitleFont']!;
  String get outlineType => _strings['outlineType']!;
  String get enableExperimentalSettings => _strings['enableExperimentalSettings']!;
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
  String get subtitleSize => _strings['subtitleSize']!;
  String get adjustSubtitleSize => _strings['adjustSubtitleSize']!;
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
  String get playbackSpeed => _strings['playbackSpeed']!;
  String get mpvDecoder => _strings['mpvDecoder']!;
  String get translateTo => _strings['translateTo']!;
  
  // 以下补充一些可能缺失的常用getter(如果已有可忽略，但不会冲突)
  String get home => _strings['home'] ?? 'Home';
  String get search => _strings['search'] ?? 'Search';
  String get library => _strings['library'] ?? 'Library';
  String get cancel => _strings['cancel'] ?? 'Cancel';
  String get ok => _strings['ok'] ?? 'OK';
  String get save => _strings['save'] ?? 'Save';
  String get delete => _strings['delete'] ?? 'Delete';
  String get confirm => _strings['confirm'] ?? 'Confirm';
  String get loading => _strings['loading'] ?? 'Loading...';
  String get error => _strings['error'] ?? 'Error';
  String get retry => _strings['retry'] ?? 'Retry';
  String get noData => _strings['noData'] ?? 'No data';
  String get back => _strings['back'] ?? 'Back';
  String get next => _strings['next'] ?? 'Next';
  String get previous => _strings['previous'] ?? 'Previous';
  String get close => _strings['close'] ?? 'Close';
  String get done => _strings['done'] ?? 'Done';
  String get anime => _strings['anime'] ?? 'Anime';
  String get manga => _strings['manga'] ?? 'Manga';
  String get novel => _strings['novel'] ?? 'Novel';
  String get profile => _strings['profile'] ?? 'Profile';
  String get watch => _strings['watch'] ?? 'Watch';
  String get read => _strings['read'] ?? 'Read';
  String get score => _strings['score'] ?? 'Score';
  String get status => _strings['status'] ?? 'Status';
  String get addToList => _strings['addToList'] ?? 'Add to List';
  String get removeFromList => _strings['removeFromList'] ?? 'Remove from List';
  String get updateProgress => _strings['updateProgress'] ?? 'Update Progress';
  String get markAsWatched => _strings['markAsWatched'] ?? 'Mark as Watched';
  String get markAsUnwatched => _strings['markAsUnwatched'] ?? 'Mark as Unwatched';
  String get rate => _strings['rate'] ?? 'Rate';
  String get review => _strings['review'] ?? 'Review';
  String get share => _strings['share'] ?? 'Share';
  String get copy => _strings['copy'] ?? 'Copy';
  String get openInBrowser => _strings['openInBrowser'] ?? 'Open in Browser';
  String get download => _strings['download'] ?? 'Download';
  String get downloading => _strings['downloading'] ?? 'Downloading...';
  String get install => _strings['install'] ?? 'Install';
  String get uninstall => _strings['uninstall'] ?? 'Uninstall';
  String get update => _strings['update'] ?? 'Update';
  String get reset => _strings['reset'] ?? 'Reset';
  String get apply => _strings['apply'] ?? 'Apply';
  String get clear => _strings['clear'] ?? 'Clear';
  String get play => _strings['play'] ?? 'Play';
  String get pause => _strings['pause'] ?? 'Pause';
  String get volume => _strings['volume'] ?? 'Volume';
  String get brightness => _strings['brightness'] ?? 'Brightness';
  String get fullscreen => _strings['fullscreen'] ?? 'Fullscreen';
  String get exitFullscreen => _strings['exitFullscreen'] ?? 'Exit Fullscreen';
  String get skipIntro => _strings['skipIntro'] ?? 'Skip Intro';
  String get skipOutro => _strings['skipOutro'] ?? 'Skip Outro';
  String get nextEpisode => _strings['nextEpisode'] ?? 'Next Episode';
  String get previousEpisode => _strings['previousEpisode'] ?? 'Previous Episode';
  String get quality => _strings['quality'] ?? 'Quality';
  String get subtitle => _strings['subtitle'] ?? 'Subtitle';
  String get audioTrack => _strings['audioTrack'] ?? 'Audio Track';
  String get playerSettings => _strings['playerSettings'] ?? 'Player Settings';
  String get generalSettings => _strings['generalSettings'] ?? 'General Settings';
  String get account => _strings['account'] ?? 'Account';
  String get login => _strings['login'] ?? 'Login';
  String get logout => _strings['logout'] ?? 'Logout';
  String get signUp => _strings['signUp'] ?? 'Sign Up';
  String get username => _strings['username'] ?? 'Username';
  String get email => _strings['email'] ?? 'Email';
  String get forgotPassword => _strings['forgotPassword'] ?? 'Forgot Password?';
  String get resetPassword => _strings['resetPassword'] ?? 'Reset Password';
  String get changePassword => _strings['changePassword'] ?? 'Change Password';
  String get profileSettings => _strings['profileSettings'] ?? 'Profile';
  String get editProfile => _strings['editProfile'] ?? 'Edit Profile';
  String get avatar => _strings['avatar'] ?? 'Avatar';
  String get name => _strings['name'] ?? 'Name';
  String get bio => _strings['bio'] ?? 'Bio';
  String get following => _strings['following'] ?? 'Following';
  String get followers => _strings['followers'] ?? 'Followers';
  String get language => _strings['language'] ?? 'Language';
  String get darkMode => _strings['darkMode'] ?? 'Dark Mode';
  String get lightMode => _strings['lightMode'] ?? 'Light Mode';
  String get systemDefault => _strings['systemDefault'] ?? 'System Default';
  String get autoPlay => _strings['autoPlay'] ?? 'Auto Play';
  String get autoSkip => _strings['autoSkip'] ?? 'Auto Skip';
  String get version => _strings['version'] ?? 'Version';
  String get license => _strings['license'] ?? 'License';
  String get privacyPolicy => _strings['privacyPolicy'] ?? 'Privacy Policy';
  String get termsOfService => _strings['termsOfService'] ?? 'Terms of Service';
  String get help => _strings['help'] ?? 'Help';
  String get feedback => _strings['feedback'] ?? 'Feedback';
  String get support => _strings['support'] ?? 'Support';
  String get donate => _strings['donate'] ?? 'Donate';
  String get synopsis => _strings['synopsis'] ?? 'Synopsis';
  String get background => _strings['background'] ?? 'Background';
  String get relations => _strings['relations'] ?? 'Relations';
  String get externalLinks => _strings['externalLinks'] ?? 'External Links';
  String get airingSchedule => _strings['airingSchedule'] ?? 'Airing Schedule';
  String get releaseDate => _strings['releaseDate'] ?? 'Release Date';
  String get endDate => _strings['endDate'] ?? 'End Date';
  String get genres => _strings['genres'] ?? 'Genres';
  String get tags => _strings['tags'] ?? 'Tags';
  String get source => _strings['source'] ?? 'Source';
  String get rating => _strings['rating'] ?? 'Rating';
  String get popularity => _strings['popularity'] ?? 'Popularity';
  String get favoritesCount => _strings['favoritesCount'] ?? 'Favorites';
  String get members => _strings['members'] ?? 'Members';
  String get meanScore => _strings['meanScore'] ?? 'Mean Score';
  String get rank => _strings['rank'] ?? 'Rank';
  String get studio => _strings['studio'] ?? 'Studio';
  String get producer => _strings['producer'] ?? 'Producer';
  String get licensor => _strings['licensor'] ?? 'Licensor';
  String get cast => _strings['cast'] ?? 'Cast';
  String get characters => _strings['characters'] ?? 'Characters';
  String get episodes => _strings['episodes'] ?? 'Episodes';
  String get chapters => _strings['chapters'] ?? 'Chapters';
  String get volumes => _strings['volumes'] ?? 'Volumes';
  String get lists => _strings['lists'] ?? 'Lists';
  String get history => _strings['history'] ?? 'History';
  String get favorites => _strings['favorites'] ?? 'Favorites';
  String get recommendations => _strings['recommendations'] ?? 'Recommendations';
  String get related => _strings['related'] ?? 'Related';
  String get similar => _strings['similar'] ?? 'Similar';
  String get searchHint => _strings['searchHint'] ?? 'Search anime, manga...';
  String get filter => _strings['filter'] ?? 'Filter';
  String get sort => _strings['sort'] ?? 'Sort';
  String get comments => _strings['comments'] ?? 'Comments';
  String get replies => _strings['replies'] ?? 'Replies';
  String get report => _strings['report'] ?? 'Report';
  String get block => _strings['block'] ?? 'Block';
  String get mute => _strings['mute'] ?? 'Mute';
  String get unmute => _strings['unmute'] ?? 'Unmute';
  String get follow => _strings['follow'] ?? 'Follow';
  String get unfollow => _strings['unfollow'] ?? 'Unfollow';
  String get subscribe => _strings['subscribe'] ?? 'Subscribe';
  String get unsubscribe => _strings['unsubscribe'] ?? 'Unsubscribe';
  String get notifications => _strings['notifications'] ?? 'Notifications';
  String get offlineMode => _strings['offlineMode'] ?? 'Offline Mode';
  String get cache => _strings['cache'] ?? 'Cache';
  String get clearCache => _strings['clearCache'] ?? 'Clear Cache';
  String get backup => _strings['backup'] ?? 'Backup';
  String get restore => _strings['restore'] ?? 'Restore';
  String get export => _strings['export'] ?? 'Export';
  String get import => _strings['import'] ?? 'Import';
  String get refresh => _strings['refresh'] ?? 'Refresh';
  String get reload => _strings['reload'] ?? 'Reload';

  // 带参数的方法
  String installExtensionFirst(String sourceName) => _strings['installExtensionFirst']?.replaceAll('{sourceName}', sourceName) ?? 'Install {sourceName} first, then click.';
  String editTags(int count) => _strings['editTags']?.replaceAll('{count}', count.toString()) ?? 'Edit Tags ({count})';
  String doneWithCount(int count) => _strings['doneWithCount']?.replaceAll('{count}', count.toString()) ?? 'Done ({count} selected)';
  String editServices(int count) => _strings['editServices']?.replaceAll('{count}', count.toString()) ?? 'Edit Services ({count})';
  String editPlatforms(int count) => _strings['editPlatforms']?.replaceAll('{count}', count.toString()) ?? 'Edit Platforms ({count})';
  String reposAdded(int count) {
    if (count == 1) {
      return _strings['repoAddedSingular'] ?? '1 repo added';
    } else {
      return _strings['repoAddedPlural']?.replaceFirst('\$count', count.toString()) ?? '$count repos added';
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