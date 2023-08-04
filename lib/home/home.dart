import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import 'home_banner_widget.dart';

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
    return DefaultTabController(
      length: 3,
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
              Tab(
                icon: Icon(Icons.settings),
                text: "Settings",
              )
            ],
            labelColor: Colors.black,
          ),
        ),
        body: const TabBarView(
          children: [
            VideoList(),
            // Center(
            //   child: Text("Chats"),
            // ),
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

class VideoList extends StatefulWidget {
  const VideoList({super.key});

  @override
  State<StatefulWidget> createState() {
    return VideoListState();
  }
}

class VideoListState extends State<VideoList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [HomeBanner()],
      ),
    );
  }
}
