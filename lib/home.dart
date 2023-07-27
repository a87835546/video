import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).title ?? 'title'),
      ),
      body: Container(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                context.read<ChangeLanguage>().update("zh", "CN");
              },
              child: const Text("中文"),
            ),
            TextButton(
              onPressed: () {
                context.read<ChangeLanguage>().update("en", "US");
              },
              child: const Text("英语"),
            ),
            Text("${context.watch<ChangeLanguage>().count}")
          ],
        ),
      ),
    );
  }
}
