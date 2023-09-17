import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video/home/video_model.dart';
import '../core/utils/image_constant.dart';
import 'home_hot_banner_widget.dart';

class HomePopularStarWidget extends StatefulWidget {
  final List<VideoModel> list;
  final String title;
  final Function(VideoModel data, int index)? click;

  const HomePopularStarWidget(
      {super.key, required this.list, required this.title, this.click});

  @override
  State<StatefulWidget> createState() {
    return HomePopularStarWidgetState();
  }
}

class HomePopularStarWidgetState extends State<HomePopularStarWidget> {
  double fem = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: HomeBannerTopView(
            menu: "123",
            clickMore: () {
              log("click popular star view more");
            },
          ),
        ),
        Container(
            padding: EdgeInsets.fromLTRB(24 * fem, 17 * fem, 0 * fem, 16 * fem),
            width: 454 * fem,
            height: 194 * fem,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.list.length,
                itemBuilder: (BuildContext context, int index) {
                  VideoModel model = widget.list[index];
                  return GestureDetector(
                    onTap: () {
                      if (widget.click != null) {
                        widget.click!(model, index);
                      }
                    },
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 8 * fem, 0 * fem),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 10 * fem),
                            width: 100 * fem,
                            height: 100 * fem,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4 * fem),
                              child: FadeInImage(
                                placeholder:
                                    AssetImage(ImageConstant.imgNetworkError),
                                fit: BoxFit.fill,
                                image: NetworkImage(model.themeUrl),
                                fadeInDuration: const Duration(milliseconds: 5),
                                fadeOutDuration:
                                    const Duration(milliseconds: 5),
                                imageErrorBuilder: (c, o, s) => Image.asset(
                                  ImageConstant.imgNetworkError,
                                  height: 200,
                                  width: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            model.title ?? 'Emma Watson',
                            style: GoogleFonts.zenKakuGothicNew(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.2000000477,
                              color: const Color(0xff757575),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                })),
      ],
    );
  }
}
