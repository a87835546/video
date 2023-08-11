import 'dart:developer';
import 'dart:ui';

import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_banner_model.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeBannerState();
  }
}

class HomeBannerState extends State<HomeBanner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Column(
        children: [
          BannerCarousel.fullScreen(
            height: 466,
            animation: true,
            viewportFraction: 1,
            showIndicator: false,
            customizedBanners: [
              HomeBannerItemWidget(
                model: HomeBannerModel(),
              ),
              HomeBannerItemWidget(
                model: HomeBannerModel(),
              ),
              HomeBannerItemWidget(
                model: HomeBannerModel(),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                child: Text("热门电影"),
              ),
              Container(
                child: Text("更多"),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class HomeBannerItemWidget extends StatefulWidget {
  final Function? play;
  final Function? favor;
  final HomeBannerModel model;
  const HomeBannerItemWidget(
      {super.key, this.play, this.favor, required this.model});

  @override
  State<StatefulWidget> createState() {
    return _HomeBannerItemWidgetState();
  }
}

class _HomeBannerItemWidgetState extends State<HomeBannerItemWidget> {
  double fem = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 14 * fem),
      padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 16 * fem),
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 23 * fem),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 9 * fem),
                  width: double.infinity,
                  height: 334 * fem,
                  child: Container(
                    // bannerfPF (17:20423)
                    padding: EdgeInsets.fromLTRB(
                        26 * fem, 16 * fem, 17 * fem, 11 * fem),
                    width: double.infinity,
                    height: double.infinity,
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
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        Container(
                          // Jyw (17:20446)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 173 * fem, 0 * fem),
                          child: Text(widget.model.title ?? '侠盗一号：星球大战故事',
                              style: GoogleFonts.zenKakuGothicNew(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffffffff),
                                  height: 1.4)),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  // autogroupnyb7Dr1 (3kojGpj2nk4cwAie1yNyB7)
                  margin: EdgeInsets.fromLTRB(
                      25.33 * fem, 0 * fem, 0 * fem, 0 * fem),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // movieinfo8xy (17:20426)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 2 * fem, 22 * fem, 0 * fem),
                        height: 20 * fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // ratingFnh (17:20427)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 15 * fem, 0 * fem),
                              height: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // iconlyboldstaraa5 (17:20428)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 7.33 * fem, 0 * fem),
                                    width: 13.33 * fem,
                                    height: 12.67 * fem,
                                    child: const Icon(
                                      Icons.star_rate_rounded,
                                      size: 14,
                                      color: Color(0xffffbb38),
                                    ),
                                  ),
                                  Text(
                                      // frR (17:20429)
                                      "${widget.model.rate ?? 8.4}",
                                      style: GoogleFonts.zenKakuGothicNew(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xffffbb38),
                                          height: 1.4)),
                                ],
                              ),
                            ),
                            Text(
                                // durationcFs (17:20430)
                                widget.model.public ?? '2016',
                                style: GoogleFonts.zenKakuGothicNew(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff757575),
                                    height: 1.4)),
                          ],
                        ),
                      ),
                      Container(
                        // ZB7 (17:20447)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 27 * fem, 0 * fem),
                        child: Text('01小时54分',
                            style: GoogleFonts.zenKakuGothicNew(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff757575),
                                height: 1.4)),
                      ),
                      Container(
                        // HN1 (17:20448)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 26 * fem, 0 * fem),
                        child: Text('动作  剧情',
                            style: GoogleFonts.zenKakuGothicNew(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff757575),
                                height: 1.4)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            // ctamY5 (17:20419)
            margin: EdgeInsets.fromLTRB(24 * fem, 0 * fem, 24 * fem, 0 * fem),
            width: double.infinity,
            height: 48 * fem,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4 * fem),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Container(
                      // cardhgd (17:20421)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 10 * fem, 0 * fem),
                      // padding: EdgeInsets.fromLTRB(
                      //     88.5 * fem, 12 * fem, 111.5 * fem, 12 * fem),
                      width: 269,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xff048bf8),
                        borderRadius: BorderRadius.circular(4 * fem),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                // iconlyboldplayy8M (I17:20421;15:1183)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 10 * fem, 0 * fem),
                                width: 20 * fem,
                                height: 20 * fem,
                                child: const Icon(
                                  Icons.play_circle_fill_rounded,
                                  size: 20,
                                  color: Color(0xffffffff),
                                )),
                            Text('立即观看',
                                style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffffffff),
                                    height: 1.5)),
                          ],
                        ),
                      )),
                  onTap: () {
                    log("play");
                    if (widget.play != null) {
                      widget.play!();
                    }
                  },
                ),
                GestureDetector(
                  child: ClipRect(
                    // navigationiosbuttonsecondaryla (17:20420)
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 8 * fem,
                        sigmaY: 8 * fem,
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(
                            12 * fem, 12 * fem, 12 * fem, 12 * fem),
                        width: 48 * fem,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0x1effffff),
                          borderRadius: BorderRadius.circular(4 * fem),
                        ),
                        child: Container(
                          // text5j7 (I17:20420;15:1186)
                          padding: EdgeInsets.fromLTRB(
                              4.3 * fem, 2.78 * fem, 4.21 * fem, 2 * fem),
                          width: double.infinity,
                          height: double.infinity,
                          child: Center(
                            // iconlylightbookmarkcyw (I17:20420;15:1187)
                            child: SizedBox(
                                width: 15.5 * fem,
                                height: 19.22 * fem,
                                child: Icon(
                                  Icons.favorite,
                                  size: 20,
                                  color: Color(0xffC2C2C2),
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    if (widget.favor != null) {
                      widget.favor!();
                    }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
