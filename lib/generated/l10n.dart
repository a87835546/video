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

  /// `国际化示例App`
  String get title {
    return Intl.message(
      '国际化示例App',
      name: 'title',
      desc: '应用标题',
      args: [],
    );
  }

  /// `点击`
  String get click {
    return Intl.message(
      '点击',
      name: 'click',
      desc: '点击',
      args: [],
    );
  }

  /// `你好呀~`
  String get helloFromDemo {
    return Intl.message(
      '你好呀~',
      name: 'helloFromDemo',
      desc: '一句问候',
      args: [],
    );
  }

  /// `HOME`
  String get home {
    return Intl.message(
      'HOME',
      name: 'home',
      desc: '首页',
      args: [],
    );
  }

  /// `HEALTHY`
  String get healthy {
    return Intl.message(
      'HEALTHY',
      name: 'healthy',
      desc: 'bottom tab bar医院',
      args: [],
    );
  }

  /// `CARE`
  String get care {
    return Intl.message(
      'CARE',
      name: 'care',
      desc: 'bottom tab bar',
      args: [],
    );
  }

  /// `COMMUNITY`
  String get community {
    return Intl.message(
      'COMMUNITY',
      name: 'community',
      desc: 'bottom tab bar',
      args: [],
    );
  }

  /// `MINE`
  String get mine {
    return Intl.message(
      'MINE',
      name: 'mine',
      desc: 'bottom tab bar',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
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