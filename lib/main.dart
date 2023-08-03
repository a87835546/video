import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video/tabbar.dart';

import 'app_singleton.dart';
import 'generated/l10n.dart';
import 'info_model.dart';

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

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChangeLanguage()),
      ],
      child: const MyApp(),
    ),
  );

  // runApp(const MyApp());
}

class ChangeLanguage with ChangeNotifier, DiagnosticableTreeMixin {
  Locale _count = const Locale("en", "US");

  Locale get count => _count;

  void update(String l, String country) {
    _count = Locale(l, country);
    notifyListeners();
    log("count --->>>> $_count");
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ObjectFlagProperty('count', count));
  }
}

class StringModel {}

var _locale = const Locale("en", "US");

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final value = context.watch<String?>();
    log("message ${context.watch<ChangeLanguage>().count}");
    return MaterialApp(
      title: 'PetsCare',
      localizationsDelegates: const [
        AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: context.watch<ChangeLanguage>().count,
      localeResolutionCallback: (locale, supportedLocales) {
        var result = supportedLocales
            .where((element) => element.languageCode == locale?.languageCode);
        if (result.isNotEmpty) {
          return locale;
        }
        return context.watch<ChangeLanguage>().count;
      },
      localeListResolutionCallback: (locale, sup) {
        log("localeListResolutionCallback ${context.watch<ChangeLanguage>().count}");
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
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
