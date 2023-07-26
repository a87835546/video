import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pets_care/info_model.dart';
import 'package:pets_care/tabbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_singleton.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String info = await _prefs.then((SharedPreferences prefs) {
    return prefs.getString('info') ?? "";
  });
  Map<String, dynamic> mp = jsonDecode(info);
  InfoModel model = InfoModel.fromJson(mp);
  AppSingleton.getInstance().info = model;
  await S.load(const Locale("zh"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PetsCare',
      localizationsDelegates: const [
        AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale("zh"),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CustomBottomNavigationBar(), // SignInPage(),
      color: Colors.redAccent,
      builder: EasyLoading.init(),
    );
  }
}
