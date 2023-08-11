import 'package:flutter/material.dart';

import '../generated/l10n.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.current.home),
          backgroundColor: Colors.redAccent,
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.chat_bubble),
                text: "Chats",
              ),
              Tab(
                icon: Icon(Icons.video_call),
                text: "Calls",
              ),
            ],
            labelColor: Colors.black,
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text("Calls"),
            ),
            Center(
              child: Text("Settings"),
            ),
          ],
        ),
      ),
    );
  }
}
