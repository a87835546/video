import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:video/home/video_model.dart';
import 'package:video/widgets/home_rate_widget.dart';

import '../utils/fonts.dart';
import 'home_banner_model.dart';

class HomeHotBannerItemWidget extends StatefulWidget {
  final VideoModel model;
  final Function? click;
  const HomeHotBannerItemWidget({super.key, required this.model, this.click});

  @override
  State<StatefulWidget> createState() {
    return _HomeHotBannerItemWidgetState();
  }
}

class _HomeHotBannerItemWidgetState extends State<HomeHotBannerItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.click != null) {
          widget.click!();
        }
      },
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(26, 16, 17, 11),
              width: double.infinity,
              height: 160,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.model.url ??
                        "https://funylife.in/wp-content/uploads/2023/04/60_Cute-Girl-Pic-WWW.FUNYLIFE.IN_-1-1024x1024.jpg"),
                  ),
                  gradient: const LinearGradient(
                    begin: Alignment(0, -1),
                    end: Alignment(0, 1),
                    colors: <Color>[
                      Color(0x33ffffff),
                      Color(0x00ffffff),
                      Color(0xffffffff)
                    ],
                    stops: <double>[0, 0.74, 1],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(3))),
              child: Container(),
            ),
            Container(
              height: 26,
              alignment: Alignment.centerLeft,
              child: Text(
                widget.model.title ?? "title",
                style: Fonts.title(),
              ),
            ),
            HomeRateWidget(model: widget.model)
          ],
        ),
      ),
    );
  }
}
