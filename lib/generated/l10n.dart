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

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '选择语言地方的显示',
      args: [],
    );
  }

  /// `Healthy Page`
  String get healthyPage {
    return Intl.message(
      'Healthy Page',
      name: 'healthyPage',
      desc: '宠物健康页面',
      args: [],
    );
  }

  /// `Community Page`
  String get communityPage {
    return Intl.message(
      'Community Page',
      name: 'communityPage',
      desc: '宠物社交页面',
      args: [],
    );
  }

  /// `Care Page`
  String get carePage {
    return Intl.message(
      'Care Page',
      name: 'carePage',
      desc: '宠物社交页面',
      args: [],
    );
  }

  /// `Mine Page`
  String get minePage {
    return Intl.message(
      'Mine Page',
      name: 'minePage',
      desc: '我的页面',
      args: [],
    );
  }

  /// `General`
  String get general {
    return Intl.message(
      'General',
      name: 'general',
      desc: '通用',
      args: [],
    );
  }

  /// `search Page`
  String get searchPage {
    return Intl.message(
      'search Page',
      name: 'searchPage',
      desc: '搜索页面',
      args: [],
    );
  }

  /// `Menu Page`
  String get menuPage {
    return Intl.message(
      'Menu Page',
      name: 'menuPage',
      desc: '菜单页面',
      args: [],
    );
  }

  /// `Movie`
  String get movie {
    return Intl.message(
      'Movie',
      name: 'movie',
      desc: '电影',
      args: [],
    );
  }

  /// `Series`
  String get series {
    return Intl.message(
      'Series',
      name: 'series',
      desc: '电视',
      args: [],
    );
  }

  /// `Animation`
  String get animation {
    return Intl.message(
      'Animation',
      name: 'animation',
      desc: '动漫',
      args: [],
    );
  }

  /// `Variety`
  String get variety {
    return Intl.message(
      'Variety',
      name: 'variety',
      desc: '综艺',
      args: [],
    );
  }

  /// `Pron`
  String get pron {
    return Intl.message(
      'Pron',
      name: 'pron',
      desc: '午夜',
      args: [],
    );
  }

  /// `Play`
  String get play {
    return Intl.message(
      'Play',
      name: 'play',
      desc: '立即观看',
      args: [],
    );
  }

  /// `Billboard`
  String get billboard {
    return Intl.message(
      'Billboard',
      name: 'billboard',
      desc: '热门',
      args: [],
    );
  }

  /// `View All`
  String get more {
    return Intl.message(
      'View All',
      name: 'more',
      desc: '更多',
      args: [],
    );
  }

  /// `Movies Billboard`
  String get movieBillboard {
    return Intl.message(
      'Movies Billboard',
      name: 'movieBillboard',
      desc: '院线大片',
      args: [],
    );
  }

  /// `Action Films`
  String get actionFilms {
    return Intl.message(
      'Action Films',
      name: 'actionFilms',
      desc: '动作片',
      args: [],
    );
  }

  /// `Comedy Films`
  String get comedyFilms {
    return Intl.message(
      'Comedy Films',
      name: 'comedyFilms',
      desc: '喜剧片',
      args: [],
    );
  }

  /// ` Other Films`
  String get otherFilms {
    return Intl.message(
      ' Other Films',
      name: 'otherFilms',
      desc: '其他类型',
      args: [],
    );
  }

  /// `Popular Star Billboard`
  String get popularStarBillboard {
    return Intl.message(
      'Popular Star Billboard',
      name: 'popularStarBillboard',
      desc: '明星排行榜',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '立即查找',
      args: [],
    );
  }

  /// `No Data`
  String get noData {
    return Intl.message(
      'No Data',
      name: 'noData',
      desc: '没有数据',
      args: [],
    );
  }

  /// `No Data Of Watch List`
  String get historyListNoData {
    return Intl.message(
      'No Data Of Watch List',
      name: 'historyListNoData',
      desc: '目录页没有观看数据',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message(
      'History',
      name: 'history',
      desc: '影单',
      args: [],
    );
  }

  /// `Headline Film`
  String get appName {
    return Intl.message(
      'Headline Film',
      name: 'appName',
      desc: '头条影视',
      args: [],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message(
      'Setting',
      name: 'setting',
      desc: '设置',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '电子邮箱',
      args: [],
    );
  }

  /// `Contract Number`
  String get contractNumber {
    return Intl.message(
      'Contract Number',
      name: 'contractNumber',
      desc: '联系方式',
      args: [],
    );
  }

  /// `About US`
  String get aboutUs {
    return Intl.message(
      'About US',
      name: 'aboutUs',
      desc: '关于我们',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '密码',
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
