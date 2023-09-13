import 'dart:developer';

import 'package:flutter/cupertino.dart';

import '../../core/utils/size_utils.dart';
import '../../theme/custom_text_style.dart';

class VideoInfoDescWidget extends StatefulWidget {
  String desc;
  bool show;
  Function(bool) clickMore;

  VideoInfoDescWidget(
      {super.key,
      required this.show,
      required this.clickMore,
      required this.desc});

  @override
  State<StatefulWidget> createState() {
    return VideoInfoDescWidgetState();
  }
}

class VideoInfoDescWidgetState extends State<VideoInfoDescWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        child: Container(
          width: getHorizontalSize(325),
          margin: getMargin(left: 24, top: 16, right: 25),
          child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: widget.desc,
                    style: CustomTextStyles.bodyMediumGray400),
                TextSpan(
                    text: widget.desc.length < 20 ? "" : "More",
                    style: CustomTextStyles.titleSmallLightblueA70001_1)
              ]),
              textAlign: TextAlign.left),
        ),
        onTap: () {
          widget.show = !widget.show;
          widget.clickMore(widget.show);
        },
      ),
    );
  }
}
