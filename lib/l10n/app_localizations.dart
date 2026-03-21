import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

// ignore_for_file: type=lint

class AppLocalizations {
  AppLocalizations(this.localeName);

  static const List<Locale> supportedLocales = [
    Locale('en'),
    Locale('zh'),
  ];

  static Future<AppLocalizations> load(Locale locale) {
    final name = locale.countryCode?.isEmpty ?? true ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return AppLocalizations(localeName);
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  final String localeName;

  String get appTitle => Intl.message('AnymeX', name: 'appTitle', desc: 'The title of the application');
  String get continueWatching => Intl.message('Continue Watching', name: 'continueWatching', desc: 'Section title for continue watching');
  String get loginPrompt => Intl.message('W-what are you doing step-bro, login before you do that (●´⌓`●)', name: 'loginPrompt', desc: 'Snackbar message when trying to refresh without login');
  String get greetingHey => Intl.message('Hey ', name: 'greetingHey', desc: 'Greeting prefix');
  String get greetingQuestion => Intl.message(', what are we doing today?', name: 'greetingQuestion', desc: 'Greeting question');
  String get homeSubtitle => Intl.message('Find your favourite anime or manga, manhwa or whatever you like!', name: 'homeSubtitle', desc: 'Subtitle on home page');
  String get recommendedNovels => Intl.message('Recommended Novels', name: 'recommendedNovels', desc: 'Section title for recommended novels');
  String get guest => Intl.message('Guest', name: 'guest', desc: 'Guest user name');
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

final Map<String, dynamic> messages = {
  'appTitle': MessageLookupByLibrary.simpleMessage('AnymeX'),
  'continueWatching': MessageLookupByLibrary.simpleMessage('Continue Watching'),
  'loginPrompt': MessageLookupByLibrary.simpleMessage('W-what are you doing step-bro, login before you do that (●´⌓`●)'),
  'greetingHey': MessageLookupByLibrary.simpleMessage('Hey '),
  'greetingQuestion': MessageLookupByLibrary.simpleMessage(', what are we doing today?'),
  'homeSubtitle': MessageLookupByLibrary.simpleMessage('Find your favourite anime or manga, manhwa or whatever you like!'),
  'recommendedNovels': MessageLookupByLibrary.simpleMessage('Recommended Novels'),
  'guest': MessageLookupByLibrary.simpleMessage('Guest'),
};

class MessageLookupByLibrary {
  static MessageLookupByLibrary? _instance;
  static MessageLookupByLibrary get instance {
    if (_instance == null) _instance = MessageLookupByLibrary._();
    return _instance!;
  }

  MessageLookupByLibrary._();

  String? lookupMessage(String key, {List<Object>? args, String? locale}) {
    return messages[key]?.toString();
  }

  static MessageLookupByLibrary? of(String? locale) => instance;
}

Future<void> initializeMessages(String locale) async {
  // No initialization needed
  return;
}