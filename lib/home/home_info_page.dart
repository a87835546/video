import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video/home/video_model.dart';
import 'package:video/widgets/palyer/video_player_bottom.dart';
import 'package:video/widgets/palyer/video_player_top.dart';

import '../utils/video_payer_utils.dart';
import '../widgets/home_rate_widget.dart';
import '../widgets/palyer/video_player_center.dart';
import '../widgets/palyer/video_player_gestures.dart';

class HomeInfoPage extends StatefulWidget {
  VideoModel model;

  HomeInfoPage({super.key, required this.model});

  @override
  State<StatefulWidget> createState() {
    return _HomeInfoPageState();
  }
}

class _HomeInfoPageState extends State<HomeInfoPage> {
  Widget? _playerUI;
  VideoPlayerTop? _top;
  LockIcon? _lockIcon;
  VideoPlayerBottom? _bottom;
  final bool _isFullScreen = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      // 播放视频
      VideoPlayerUtils.playerHandle(widget.model.url);
      // 播放新视频，初始化监听
      VideoPlayerUtils.initializedListener(
          key: this,
          listener: (initialize, widget) {
            if (initialize) {
              _playerUI = widget;
              if (!mounted) return;
              setState(() {});
            }
          });
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
      _bottom = VideoPlayerBottom();
      watch();
    });
  }

  void watch() {}

  @override
  void dispose() {
    // TODO: implement dispose
    VideoPlayerUtils.removeInitializedListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: null,
        body: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: SafeArea(
            top: !_isFullScreen,
            bottom: !_isFullScreen,
            left: !_isFullScreen,
            right: !_isFullScreen,
            child: ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.model.themeUrl),
                          fit: BoxFit.fill)),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 9 / 16,
                  child: _playerUI != null
                      ? VideoPlayerGestures(
                          appearCallback: (appear) {
                            _top?.opacityCallback(appear);
                            _lockIcon?.opacityCallback(appear);
                            _bottom?.opacityCallback(appear);
                          },
                          children: [
                            const SizedBox(height: 22),
                            Center(child: _playerUI),
                            _top!,
                            _lockIcon!,
                            _bottom!,
                          ],
                        )
                      : Container(
                          alignment: Alignment.center,
                          color: Colors.black26,
                          child: const CircularProgressIndicator(
                            strokeWidth: 3,
                          ),
                        ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 25, top: 10),
                  child: HomeRateWidget(
                    model: widget.model,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
