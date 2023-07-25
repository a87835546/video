import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarePage extends StatefulWidget {
  const CarePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CarePageState();
  }

}

class _CarePageState extends State<CarePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("care page"),),
      body: Container(),
    );
  }
}