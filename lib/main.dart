import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pets_care/info_model.dart';
import 'package:pets_care/tabbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_singleton.dart';
import 'generated/l10n.dart';

GlobalKey<ChangeLocalizationsState> changeLocalizationStateKey =
    GlobalKey<ChangeLocalizationsState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String info = await _prefs.then((SharedPreferences prefs) {
    return prefs.getString('info') ?? "";
  });
  if (info.isNotEmpty) {
    Map<String, dynamic> mp = jsonDecode(info);
    if (mp.isNotEmpty) {
      InfoModel model = InfoModel.fromJson(mp);
      AppSingleton.getInstance().info = model;
    }
  }
  runApp(const MyApp());
}

var _locale = const Locale("en");

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    log("message `${AppSingleton.getInstance().info?.language}");
    return MaterialApp(
      title: 'PetsCare',
      localizationsDelegates: const [
        AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: AppSingleton.getInstance().info?.locale ?? _locale,
      localeResolutionCallback: (locale, supportedLocales) {
        log("localeResolutionCallback --->>> `${locale}`");
        var result = supportedLocales
            .where((element) => element.languageCode == locale?.languageCode);
        if (result.isNotEmpty) {
          return locale;
        }
        return Locale(AppSingleton.getInstance().info?.language ?? "en");
      },
      localeListResolutionCallback: (locale, sup) {
        log("localeListResolutionCallback");
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ChangeLocalizations(
        key: changeLocalizationStateKey,
        child: const CustomBottomNavigationBar(),
      ), // SignInPage(),
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
