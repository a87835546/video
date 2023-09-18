import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:video/home/video_model.dart';
import 'package:vimeo_video_player/vimeo_video_player.dart';

class HomePlayPage extends StatefulWidget {
  VideoModel model;

  HomePlayPage({super.key, required this.model});

  @override
  State<StatefulWidget> createState() {
    return _HomePlayPageState();
  }
}

class _HomePlayPageState extends State<HomePlayPage> {
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    log("init state ---");
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.model.title),
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: 1,
              child: VimeoVideoPlayer(
                vimeoPlayerModel: VimeoPlayerModel(url: widget.model.url),
              ),
            );
          } else {
            return Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.model.themeUrl))),
                child: const Center(
                  child: CircularProgressIndicator(),
                ));
          }
        },
      ),
    );
  }
}
