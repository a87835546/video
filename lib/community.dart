import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CommunityPageState();
  }

}

class _CommunityPageState extends State<CommunityPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("community page"),),
      body: Container(),
    );
  }
}