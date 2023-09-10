/// Created by RongCheng on 2022/1/19.

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../utils/video_payer_utils.dart';

// ignore: must_be_immutable
class VideoPlayerTop extends StatefulWidget {
  String title;
  VideoPlayerTop({Key? key, this.clickBack, required this.title})
      : super(key: key);
  late Function(bool) opacityCallback;
  Function? clickBack;
  @override
  _VideoPlayerTopState createState() => _VideoPlayerTopState();
}

class _VideoPlayerTopState extends State<VideoPlayerTop> {
  double _opacity = TempValue.isLocked ? 0.0 : 1.0; // 不能固定值，横竖屏触发会重置
  bool get _isFullScreen =>
      MediaQuery.of(context).orientation == Orientation.landscape;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.opacityCallback = (appear) {
      _opacity = appear ? 1.0 : 0.0;
      if (!mounted) return;
      setState(() {});
    };
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 0,
      right: 0,
      child: AnimatedOpacity(
        opacity: _opacity,
        duration: const Duration(milliseconds: 250),
        child: Container(
            width: double.maxFinite,
            height: 40,
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(0, 0, 0, .7),
                  Color.fromRGBO(0, 0, 0, 0)
                ],
              ),
            ),
            child: Row(
              children: [
                _isFullScreen
                    ? IconButton(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        onPressed: () => VideoPlayerUtils.setPortrait(), // 切换竖屏
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      )
                    : IconButton(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        onPressed: () {
                          log("click back");
                          if (widget.clickBack != null) {
                            widget.clickBack!();
                          }
                        }, // 切换竖屏
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                Text(
                  widget.title,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    if (kDebugMode) {
                      print("点击了：开发者可自行定义");
                    }
                  },
                  icon: const Icon(
                    Icons.more_horiz_outlined,
                    color: Colors.white,
                    size: 32,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
