import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video/widgets/palyer/video_player_bottom.dart';
import 'package:video/widgets/palyer/video_player_top.dart';

import '../utils/video_payer_utils.dart';
import '../widgets/palyer/video_player_center.dart';
import '../widgets/palyer/video_player_gestures.dart';

class HomeInfoPage extends StatefulWidget {
  const HomeInfoPage({super.key});

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
    // 播放视频
    VideoPlayerUtils.playerHandle(
        "http://adsmind.gdtimg.com/0bc3zuaaqaaaseaaupof5rsfbtodbdgqacaa.f10002.mp4?znjson.mp4");
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
    );
    _lockIcon = LockIcon(
      lockCallback: (val) {
        log("click lock icon value :$val");
      },
    );
    _bottom = VideoPlayerBottom();
    watch();
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
      resizeToAvoidBottomInset: false,
      appBar: null,
      // PreferredSize(
      //     child: Offstage(
      //       offstage: true,
      //       child: AppBar(
      //         centerTitle: true,
      //         title: Text("11"),
      //         backgroundColor: Colors.transparent,
      //       ),
      //     ),
      //     preferredSize:
      //         Size.fromHeight(MediaQuery.of(context).size.height * 0.7),
      //   ),
      body: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: SafeArea(
            top: !_isFullScreen,
            bottom: !_isFullScreen,
            left: !_isFullScreen,
            right: !_isFullScreen,
            child: Container(
                color: Colors.redAccent,
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
                          Center(
                            child: _playerUI,
                          ),
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
                      )),
          )),
    ));
  }
}
