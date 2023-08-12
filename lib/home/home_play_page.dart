import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video/home/home_banner_model.dart';
import 'package:video/widgets/home_rate_widget.dart';

import '../utils/fonts.dart';
import '../utils/video_payer_utils.dart';

class HomePlayPage extends StatefulWidget {
  const HomePlayPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePlayPageState();
  }
}

class _HomePlayPageState extends State<HomePlayPage> {
  Widget? _playerUI;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 播放视频
    VideoPlayerUtils.playerHandle("https://youtu.be/YxY3RzkzSLU");
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
  }

  @override
  void dispose() {
    // TODO: implement dispose
    VideoPlayerUtils.removeInitializedListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 9 / 16,
                color: Colors.black26,
                child: _playerUI ??
                    const CircularProgressIndicator(
                      strokeWidth: 3,
                    )),
            Container(
              alignment: Alignment.centerLeft,
              height: 30,
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text("title 1111"),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: HomeRateWidget(
                  model: HomeBannerModel(
                      rate: 6.6,
                      duration: 112,
                      type: 0,
                      isFavor: false,
                      title: "111")),
            ),
            Container(
                padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                child: Text(
                    '《侠盗一号》广泛获得积极的评价，包括赞赏它的演技、动作场面、配乐及暗色调，虽然有些批评是针对其性格描写，和电影中使用电脑合成图像啊哈来...',
                    style: Fonts.sub(14, Color(0xff9e9e9e))))
          ],
        ),
      ),
    );
  }
}
