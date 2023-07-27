import 'package:flutter/material.dart';
import 'package:pets_care/app_singleton.dart';

import '../generated/l10n.dart';
import '../main.dart';

class ChangeLanguagePage extends StatefulWidget {
  const ChangeLanguagePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ChangeLanguagePageState();
  }
}

enum Language { en, zh, jp }

class _ChangeLanguagePageState extends State<ChangeLanguagePage> {
  Language? _lang = Language.en;

  List<String> l = [];
  @override
  void initState() {
    super.initState();
    List<Locale> locales = S.delegate.supportedLocales;
    for (int i = 0; i < locales.length; i++) {
      var locale = locales[i];
      l.add(locale.languageCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("change language"),
      ),
      body: Column(
        children: [
          RadioListTile<Language>(
            title: const Text('English'),
            value: Language.en,
            groupValue: _lang,
            onChanged: (Language? value) {
              setState(() {
                _lang = value;
                AppSingleton.getInstance().info?.language = "en";
                changeLocalizationStateKey.currentState
                    ?.changeLocale(const Locale('en', 'US'));
              });
            },
          ),
          RadioListTile<Language>(
            title: const Text('简体中文'),
            value: Language.zh,
            groupValue: _lang,
            onChanged: (Language? value) {
              setState(() {
                _lang = value;
                AppSingleton.getInstance().info?.language = "zh";
                changeLocalizationStateKey.currentState
                    ?.changeLocale(const Locale('zh', 'CH'));
              });
            },
          ),
          RadioListTile<Language>(
            title: const Text('日本語'),
            value: Language.jp,
            groupValue: _lang,
            onChanged: (Language? value) {
              setState(() {
                _lang = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
