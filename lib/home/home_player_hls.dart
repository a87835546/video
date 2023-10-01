import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video/home/video_model.dart';
import 'package:video_player/video_player.dart';

import '../utils/video_payer_utils.dart';
import '../widgets/palyer/video_player_bottom.dart';
import '../widgets/palyer/video_player_center.dart';
import '../widgets/palyer/video_player_gestures.dart';
import '../widgets/palyer/video_player_top.dart';

class VideoApp extends StatefulWidget {
  VideoModel model;
  VideoApp({super.key, required this.model});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;
  Widget? _playerUI;
  VideoPlayerTop? _top;
  LockIcon? _lockIcon;
  VideoPlayerBottom? _bottom;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      // getData();
      _top = VideoPlayerTop(
          clickBack: () {
            VideoPlayerUtils.dispose();
            Navigator.of(context).pop();
          },
          title: widget.model.title);
      _lockIcon = LockIcon(
        lockCallback: () {
          log("click lock icon value");
        },
      );
      _bottom = VideoPlayerBottom(
        clickPause: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
      );
    });

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    try {
      Uri? uri = Uri.tryParse(widget.model.url);
      _controller = VideoPlayerController.networkUrl(uri!)
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {
            _controller.play();
          });
        });
      _controller.setVolume(1.0);
    } catch (e) {
      log("init err -->>> $e");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VideoPlayerGestures(
        appearCallback: (appear) {
          _top?.opacityCallback(appear);
          _lockIcon?.opacityCallback(appear);
          _bottom?.opacityCallback(appear);
        },
        children: [
          const SizedBox(height: 22),
          Center(child: VideoPlayer(_controller)),
          _top!,
          _lockIcon!,
          _bottom!,
        ],
      ),
    );
    return Scaffold(
      body: Center(
        child: _controller.value.isInitialized
            ? GestureDetector(
                child: AspectRatio(
                  aspectRatio: MediaQuery.of(context).size.width /
                      MediaQuery.of(context).size.height,
                  child: VideoPlayer(_controller),
                ),
                onTap: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
              )
            : Container(
                alignment: Alignment.center,
                color: Colors.black26,
                child: const CircularProgressIndicator(
                  strokeWidth: 3,
                ),
              ),
      ),
    );
  }

  @override
  void dispose() {
    //页面退出时，切换为竖屏
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    _controller.dispose();
    super.dispose();
  }
}
