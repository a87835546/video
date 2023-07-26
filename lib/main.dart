import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pets_care/tabbar.dart';

import 'generated/l10n.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'PetsCare',
      localizationsDelegates: const [
          AppLocalizationDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [
         Locale('en', 'US'), // 美国英语
         Locale('zh', 'CN'), // 中文简体
      ],
      locale: const Locale("zh_CN"),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CustomBottomNavigationBar(),// SignInPage(),
      color: Colors.redAccent,
      builder: EasyLoading.init(),
    );
  }
}