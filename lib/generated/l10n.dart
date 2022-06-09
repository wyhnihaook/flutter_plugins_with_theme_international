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
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `AppName`
  String get appName {
    return Intl.message(
      'AppName',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Auto`
  String get autoBySystem {
    return Intl.message(
      'Auto',
      name: 'autoBySystem',
      desc: '',
      args: [],
    );
  }

  /// `Flutter Demo`
  String get title1 {
    return Intl.message(
      'Flutter Demo',
      name: 'title1',
      desc: '',
      args: [],
    );
  }

  /// `Flutter Demo Home Page`
  String get title2 {
    return Intl.message(
      'Flutter Demo Home Page',
      name: 'title2',
      desc: '',
      args: [],
    );
  }

  /// `You have pushed the button this many times:`
  String get content1 {
    return Intl.message(
      'You have pushed the button this many times:',
      name: 'content1',
      desc: '',
      args: [],
    );
  }

  /// `test content`
  String get content2 {
    return Intl.message(
      'test content',
      name: 'content2',
      desc: '',
      args: [],
    );
  }

  /// `click refresh local widget`
  String get content3 {
    return Intl.message(
      'click refresh local widget',
      name: 'content3',
      desc: '',
      args: [],
    );
  }

  /// `switch theme to dark`
  String get content4 {
    return Intl.message(
      'switch theme to dark',
      name: 'content4',
      desc: '',
      args: [],
    );
  }

  /// `switch theme to light`
  String get content5 {
    return Intl.message(
      'switch theme to light',
      name: 'content5',
      desc: '',
      args: [],
    );
  }

  /// `switch locale to english`
  String get content6 {
    return Intl.message(
      'switch locale to english',
      name: 'content6',
      desc: '',
      args: [],
    );
  }

  /// `switch locale to chinese`
  String get content7 {
    return Intl.message(
      'switch locale to chinese',
      name: 'content7',
      desc: '',
      args: [],
    );
  }

  /// `goto next page`
  String get content8 {
    return Intl.message(
      'goto next page',
      name: 'content8',
      desc: '',
      args: [],
    );
  }

  /// `change theme color to red`
  String get content9 {
    return Intl.message(
      'change theme color to red',
      name: 'content9',
      desc: '',
      args: [],
    );
  }

  /// `custom text`
  String get content10 {
    return Intl.message(
      'custom text',
      name: 'content10',
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
      Locale.fromSubtags(languageCode: 'zh'),
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
