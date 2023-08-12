import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video/home/home_banner_model.dart';
import 'package:video/home/home_popular_star_model.dart';
import 'home_hot_banner_widget.dart';

class HomePopularStarWidget extends StatefulWidget {
  final HomeBannerModel model;
  final List<HomePopularStarModel> list;
  const HomePopularStarWidget(
      {super.key, required this.model, required this.list});

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
            model: widget.model,
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
                  HomePopularStarModel model = widget.list[index];
                  return Container(
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
                              child: Image.network(
                                model.url ??
                                    "https://k.sinaimg.cn/n/sinacn10111/785/w460h325/20181210/af5d-hphsupy6595023.jpg/w700d1q75cms.jpg",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Text(
                            // chrisevanstK3 (I17:20529;300:7895)
                            model.name ?? 'Emma Watson',
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
