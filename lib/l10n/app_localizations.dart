import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const List<Locale> supportedLocales = [Locale('en'), Locale('zh')];

  // 英文资源
  static const Map<String, String> _en = {
    'appTitle': 'AnymeX',
    'continueWatching': 'Continue Watching',
    'loginPrompt': 'W-what are you doing step-bro, login before you do that (●´⌓`●)',
    'greetingHey': 'Hey ',
    'greetingQuestion': ', what are we doing today?',
    'homeSubtitle': 'Find your favourite anime or manga, manhwa or whatever you like!',
    'recommendedNovels': 'Recommended Novels',
    'guest': 'Guest',
  };

  // 中文资源
  static const Map<String, String> _zh = {
    'appTitle': 'AnymeX',
    'continueWatching': '继续观看',
    'loginPrompt': '哎呀，先登录再操作吧 (●´⌓`●)',
    'greetingHey': '嘿 ',
    'greetingQuestion': '，今天想做什么？',
    'homeSubtitle': '找到你喜欢的动漫、漫画、韩漫或任何内容！',
    'recommendedNovels': '推荐小说',
    'guest': '访客',
  };

  Map<String, String> get _strings {
    switch (locale.languageCode) {
      case 'zh':
        return _zh;
      default:
        return _en;
    }
  }

  String get appTitle => _strings['appTitle']!;
  String get continueWatching => _strings['continueWatching']!;
  String get loginPrompt => _strings['loginPrompt']!;
  String get greetingHey => _strings['greetingHey']!;
  String get greetingQuestion => _strings['greetingQuestion']!;
  String get homeSubtitle => _strings['homeSubtitle']!;
  String get recommendedNovels => _strings['recommendedNovels']!;
  String get guest => _strings['guest']!;
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