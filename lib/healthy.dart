import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HealthyPage extends StatefulWidget {
  const HealthyPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HealthyPageState();
  }

}

class _HealthyPageState extends State<HealthyPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("healthy page"),),
      body: Container(),
    );
  }
}