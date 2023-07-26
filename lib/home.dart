import 'package:flutter/material.dart';

import 'generated/l10n.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }

}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text( S.of(context).title??'title'),),
      body: Container(
        child: TextButton(onPressed: (){

        }, child: const Text("跳转"),),
      ),
    );
  }
}