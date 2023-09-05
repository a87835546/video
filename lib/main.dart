import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video/mine/changge_language.dart';
import 'package:video/tabbar.dart';

import 'app_singleton.dart';
import 'generated/l10n.dart';
import 'info_model.dart';

GlobalKey<ChangeLocalizationsState> changeLocalizationStateKey =
    GlobalKey<ChangeLocalizationsState>();

void main() async {
  AppSingleton.devMode = DevMode.local;

  WidgetsFlutterBinding.ensureInitialized();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String info = await _prefs.then((SharedPreferences prefs) {
    return prefs.getString('info') ?? "";
  });
  log("info--->>>>${info}");
  if (info != "" && info != "null" && info.isNotEmpty) {
    Map<String, dynamic> mp = jsonDecode(info);
    if (mp.isNotEmpty) {
      InfoModel model = InfoModel.fromJson(mp);
      AppSingleton.getInstance().info = model;
    }
  } else {
    AppSingleton.getInstance().info =
        InfoModel(language: "zh", username: "zhansan", password: "");
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChangeLanguage()),
      ],
      child: const MyApp(),
    ),
  );
}

class ChangeLanguage with ChangeNotifier, DiagnosticableTreeMixin {
  Locale _locale = const Locale("en", "US");

  Locale get locale => _locale;

  void update(String l, String country) {
    _locale = Locale(l, country);
    notifyListeners();
    log("count --->>>> $_locale");
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ObjectFlagProperty('count', locale));
  }
}

class StringModel {}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    log("message ${context.watch<ChangeLanguage>().locale}");
    return MaterialApp(
      title: 'PetsCare',
      localizationsDelegates: const [
        AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: context.watch<ChangeLanguage>().locale,
      localeResolutionCallback: (locale, supportedLocales) {
        var result = supportedLocales
            .where((element) => element.languageCode == locale?.languageCode);
        if (result.isNotEmpty) {
          AppSingleton.singleton?.info?.locale = locale;
          return locale;
        }
        AppSingleton.singleton?.info?.locale =
            context.watch<ChangeLanguage>().locale;
        return context.watch<ChangeLanguage>().locale;
      },
      localeListResolutionCallback: (locale, sup) {
        log("localeListResolutionCallback ${context.watch<ChangeLanguage>().locale}");
      },

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Colors.white),
          primarySwatch: Colors.cyan,
          primaryColorDark: Colors.black,
          primaryColor: const Color(0xff048BF8),
          fontFamily: 'Zen Kaku Gothic New',
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Color(0xff048BF8),
            onPrimary: Colors.black,
            secondary: Colors.grey,
            onSecondary: Colors.grey,
            background: Colors.grey,
            onBackground: Colors.grey,
            surface: Colors.grey,
            onSurface: Colors.grey,
            error: Colors.grey,
            onError: Colors.grey,
          )),
      // theme: ThemeData(
      //     primarySwatch: Colors.cyan,
      //     appBarTheme: const AppBarTheme(color: Colors.white)),
      home: const CustomBottomNavigationBar(), // SignInPage(),
      color: Colors.redAccent,
      builder: EasyLoading.init(),
    );
  }
}

//自定义类 用来应用内切换
class ChangeLocalizations extends StatefulWidget {
  final Widget child;

  const ChangeLocalizations({Key? key, required this.child}) : super(key: key);

  @override
  ChangeLocalizationsState createState() => ChangeLocalizationsState();
}

class ChangeLocalizationsState extends State<ChangeLocalizations> {
  //初始是中文
  Locale _locale = const Locale('zh', 'CH');

  changeLocale(Locale locale) {
    log("changed");
    setState(() {
      _locale = locale;
      AppSingleton.getInstance().info?.locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      context: context,
      locale: _locale,
      child: widget.child,
    );
  }
}
