import 'package:flutter/cupertino.dart';
import 'package:video/home/video_model.dart';
import 'package:video/widgets/home_rate_widget.dart';

import '../utils/fonts.dart';

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
                      fit: BoxFit.fill,
                      image: FadeInImage(
                        placeholder: AssetImage("assets/error.png"),
                        fit: BoxFit.fill,
                        image: NetworkImage(widget.model.themeUrl ??
                            "https://cdn.dribbble.com/users/28726/screenshots/1192614/img-placeholder.gif"),
                        fadeInDuration: const Duration(milliseconds: 5),
                        fadeOutDuration: const Duration(milliseconds: 5),
                        imageErrorBuilder: (c, o, s) => Image.asset(
                          "assets/error.png",
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ).image),
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
                widget.model.title,
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
