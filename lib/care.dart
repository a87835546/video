import 'package:flutter/material.dart';

import 'generated/l10n.dart';

class CarePage extends StatefulWidget {
  const CarePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CarePageState();
  }
}

class _CarePageState extends State<CarePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.carePage),
      ),
      body: Container(),
    );
  }
}
