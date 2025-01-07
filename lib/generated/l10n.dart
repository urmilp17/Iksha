// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null, 'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;
 
      return instance;
    });
  } 

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null, 'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hey, {userName} 👋`
  String hey_user(Object userName) {
    return Intl.message(
      'Hey, $userName 👋',
      name: 'hey_user',
      desc: 'Greeting for the user',
      args: [userName],
    );
  }

  /// `Welcome to Iksha`
  String get welcome_message {
    return Intl.message(
      'Welcome to Iksha',
      name: 'welcome_message',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Search...`
  String get search_placeholder {
    return Intl.message(
      'Search...',
      name: 'search_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Sampradayas`
  String get sampradayas_title {
    return Intl.message(
      'Sampradayas',
      name: 'sampradayas_title',
      desc: '',
      args: [],
    );
  }

  /// `According to Gita 4.2, Sampradayas (spiritual lineages) preserve and transmit sacred knowledge, ensuring its authenticity and continuity, thereby guiding seekers on the path to self-realization.`
  String get sampradayas_description {
    return Intl.message(
      'According to Gita 4.2, Sampradayas (spiritual lineages) preserve and transmit sacred knowledge, ensuring its authenticity and continuity, thereby guiding seekers on the path to self-realization.',
      name: 'sampradayas_description',
      desc: '',
      args: [],
    );
  }

  /// `Sadhana Chatusthaya`
  String get sadhana_title {
    return Intl.message(
      'Sadhana Chatusthaya',
      name: 'sadhana_title',
      desc: '',
      args: [],
    );
  }

  /// `Sadhana Chatushtaya provides a foundation for spiritual growth, enabling seekers to discern reality, detach from worldly desires, cultivate self-control, and intensely yearn for liberation, leading to Self-realization.`
  String get sadhana_description {
    return Intl.message(
      'Sadhana Chatushtaya provides a foundation for spiritual growth, enabling seekers to discern reality, detach from worldly desires, cultivate self-control, and intensely yearn for liberation, leading to Self-realization.',
      name: 'sadhana_description',
      desc: '',
      args: [],
    );
  }

  /// `DISCRIMINATION`
  String get discrimination {
    return Intl.message(
      'DISCRIMINATION',
      name: 'discrimination',
      desc: '',
      args: [],
    );
  }

  /// `DISPASSION`
  String get dispassion {
    return Intl.message(
      'DISPASSION',
      name: 'dispassion',
      desc: '',
      args: [],
    );
  }

  /// `SHAD SAMPATI`
  String get shad_sampati {
    return Intl.message(
      'SHAD SAMPATI',
      name: 'shad_sampati',
      desc: '',
      args: [],
    );
  }

  /// `MUMUKSHUTVA`
  String get mumukshutva {
    return Intl.message(
      'MUMUKSHUTVA',
      name: 'mumukshutva',
      desc: '',
      args: [],
    );
  }

  /// `Explore`
  String get explore {
    return Intl.message(
      'Explore',
      name: 'explore',
      desc: '',
      args: [],
    );
  }

  /// `Video Recommendation`
  String get video_recommendation {
    return Intl.message(
      'Video Recommendation',
      name: 'video_recommendation',
      desc: '',
      args: [],
    );
  }

  /// `Explore a curated selection \nof videos on various topics.`
  String get video_recommendation_description {
    return Intl.message(
      'Explore a curated selection \nof videos on various topics.',
      name: 'video_recommendation_description',
      desc: '',
      args: [],
    );
  }

  /// `Books to Read`
  String get books_to_read {
    return Intl.message(
      'Books to Read',
      name: 'books_to_read',
      desc: '',
      args: [],
    );
  }

  /// `Recommended reading materials for your growth.`
  String get books_to_read_description {
    return Intl.message(
      'Recommended reading materials for your growth.',
      name: 'books_to_read_description',
      desc: '',
      args: [],
    );
  }

  /// `Trigunas`
  String get trigunas {
    return Intl.message(
      'Trigunas',
      name: 'trigunas',
      desc: '',
      args: [],
    );
  }

  /// `Understanding the three gunas \nin daily life.`
  String get trigunas_description {
    return Intl.message(
      'Understanding the three gunas \nin daily life.',
      name: 'trigunas_description',
      desc: '',
      args: [],
    );
  }

  /// `Error fetching user name: {error}`
  String fetch_error_message(Object error) {
    return Intl.message(
      'Error fetching user name: $error',
      name: 'fetch_error_message',
      desc: 'Error message displayed when username fetching fails.',
      args: [error],
    );
  }

  /// `Shaivism`
  String get shaivism {
    return Intl.message(
      'Shaivism',
      name: 'shaivism',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'hi'),
      Locale.fromSubtags(languageCode: 'mr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}