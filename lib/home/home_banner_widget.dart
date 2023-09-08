import 'dart:developer';
import 'dart:ui';

import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:video/home/home_info_page.dart';
import 'package:video/home/home_play_page.dart';
import 'package:video/home/home_popular_star_model.dart';

import '../generated/l10n.dart';
import '../utils/navigation.dart';
import '../widgets/home_rate_widget.dart';
import 'home_banner_model.dart';
import 'home_hot_banner_widget.dart';
import 'home_list_widget.dart';
import 'home_popular_star_widget.dart';
import 'home_request.dart';

class HomeBanner extends StatefulWidget {
  final int type;
  const HomeBanner({super.key, required this.type});

  @override
  State<StatefulWidget> createState() {
    return HomeBannerState();
  }
}

class HomeBannerState extends State<HomeBanner> {
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      getData();
    });
    log("widget type --- >>> ${widget.type}");
  }

  void getData() async {
    var list = await getSubMenu(widget.type);
    log("list--->>${widget.type} 0--->>> ${list}");
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height -
          MediaQuery.of(context).padding.top -
          49 -
          MediaQuery.of(context).padding.bottom,
      child: SmartRefresher(
        controller: _refreshController,
        physics: const BouncingScrollPhysics(),
        enablePullUp: true,
        enablePullDown: true,
        header: const WaterDropHeader(),
        footer: const ClassicFooter(
          loadStyle: LoadStyle.ShowWhenLoading,
        ),
        onRefresh: () {
          log("refresh");
          _refreshController.refreshCompleted();
          getData();
        },
        onLoading: () {
          log('loading more');
          getData();
          _refreshController.refreshCompleted();
        },
        child: Container(
          color: const Color(0xfff6f6f6),
          child: SingleChildScrollView(
            child: Column(
              // physics: NeverScrollableScrollPhysics(),
              children: [
                BannerCarousel.fullScreen(
                    height: 466,
                    animation: true,
                    viewportFraction: 1,
                    showIndicator: false,
                    customizedBanners: [
                      HomeBannerModel(
                          rate: 5,
                          public: "2021",
                          duration: 122,
                          type: ["0"],
                          isFavor: false,
                          title: "侠盗一号：星球大战故事"),
                      HomeBannerModel(
                          rate: 5,
                          public: "2023",
                          duration: 120,
                          type: ["0"],
                          isFavor: false,
                          title: "侠盗一号：星球大战故事 1",
                          url:
                              "https://static.runoob.com/images/demo/demo2.jpg"),
                      HomeBannerModel(
                          rate: 5.66,
                          public: "2020",
                          duration: 140,
                          type: ["0"],
                          isFavor: true,
                          title: "侠盗一号：星球大战故事 2",
                          url:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFwIT3_0Yf1FiaMhAfqffasuNXUqh3UXCutPhKog5jEQ&s"),
                    ].map((e) {
                      return HomeBannerItemWidget(
                          model: e,
                          play: () {
                            Navigation.navigateTo(
                              context: context,
                              screen: const HomePlayPage(),
                              style: NavigationRouteStyle.material,
                            );
                          });
                    }).toList()),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: HomeHotBannerWidget(
                    clickMore: () {
                      log("click more ${S.of(context).billboard}");
                    },
                    clickItem: (data, index) {
                      log("click index:$index  item:$data");
                      Navigation.navigateTo(
                        context: context,
                        screen: const HomeInfoPage(),
                        style: NavigationRouteStyle.material,
                      );
                    },
                    menu: S.of(context).billboard,
                    list: [
                      HomeBannerModel(
                          rate: 5,
                          duration: 2019,
                          type: ["0"],
                          isFavor: false,
                          title: "侠盗一号：星球大战故事 2-1",
                          url:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_haYcSoRDlLtQIf4gDtz3gPkD2LhDacqPFM6YBEBr&s"),
                      HomeBannerModel(
                          rate: 5,
                          duration: 2019,
                          type: ["0"],
                          isFavor: false,
                          title: "侠盗一号：星球大战故事 2-2",
                          url:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkR5t_k4752DIskLyM3TK1FWhKr1Miy8Lf9743ZY7F&s"),
                      HomeBannerModel(
                          rate: 5,
                          duration: 2019,
                          type: ["0"],
                          isFavor: false,
                          title: "侠盗一号：星球大战故事 2-3",
                          url:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFwIT3_0Yf1FiaMhAfqffasuNXUqh3UXCutPhKog5jEQ&s"),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: HomeHotBannerWidget(
                    menu: S.of(context).movieBillboard,
                    list: [
                      HomeBannerModel(
                          rate: 5.9,
                          duration: 2019,
                          type: ["0"],
                          isFavor: false,
                          title: " 侠盗一号：星球大战故事 3-1"),
                      HomeBannerModel(
                          rate: 5.7,
                          duration: 180,
                          public: "2019",
                          type: ["0"],
                          isFavor: false,
                          title: " 侠盗一号：星球大战故事 3-2"),
                      HomeBannerModel(
                          rate: 5,
                          public: "2019",
                          duration: 130,
                          type: ["0"],
                          isFavor: false,
                          title: " 侠盗一号：星球大战故事 3-3"),
                      HomeBannerModel(
                          rate: 4,
                          duration: 2021,
                          public: "2019",
                          type: ["0"],
                          isFavor: false,
                          title: " 侠盗一号：星球大战故事 3-4"),
                    ],
                    clickMore: () {
                      log("click more");
                    },
                  ),
                ),
                HomePopularStarWidget(
                  click: (val) {
                    log("value --->> ${val.toString()}");
                  },
                  model: HomeBannerModel(
                      rate: 5,
                      duration: 2019,
                      type: ["0"],
                      isFavor: false,
                      menu: S.of(context).popularStarBillboard),
                  list: [
                    HomePopularStarModel(
                        name: "zhansan",
                        url:
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvUvoj9OumBIY6O3dMvuPS76rpSC8OFpeG9F1hSNOT&s"),
                    HomePopularStarModel(
                        name: "lisi",
                        url:
                            "https://img.win3000.com/m00/d1/c9/6f843b5bf7f315a30aca8ba537a36c6e.jpg"),
                    HomePopularStarModel(
                        name: "zhaoliu",
                        url:
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvUvoj9OumBIY6O3dMvuPS76rpSC8OFpeG9F1hSNOT&s"),
                    HomePopularStarModel(
                        name: "zhansan",
                        url:
                            "https://img.win3000.com/m00/d1/c9/6f843b5bf7f315a30aca8ba537a36c6e.jpg")
                  ],
                ),
                HomeListWidget(
                  menu: S.of(context).actionFilms,
                  list: [
                    HomeBannerModel(
                      rate: 3,
                      duration: 100,
                      type: ["0"],
                      isFavor: false,
                      public: "2022",
                      title: "",
                      // url: ""
                    ),
                    HomeBannerModel(
                      rate: 3.3,
                      duration: 120,
                      type: ["0"],
                      isFavor: false,
                      public: "2021",
                      title: "",
                      // url: ""
                    ),
                    HomeBannerModel(
                      rate: 3.4,
                      duration: 110,
                      type: ["0"],
                      isFavor: false,
                      public: "2020",
                      title: "",
                      // url: ""
                    ),
                  ],
                ),
                HomeListWidget(
                  menu: S.of(context).comedyFilms,
                  list: [
                    HomeBannerModel(
                      rate: 3,
                      duration: 100,
                      type: ["0"],
                      isFavor: false,
                      public: "2022",
                      title: "",
                      // url: ""
                    ),
                    HomeBannerModel(
                      rate: 3.3,
                      duration: 120,
                      type: ["0"],
                      isFavor: false,
                      public: "2021",
                      title: "",
                      // url: ""
                    ),
                    HomeBannerModel(
                      rate: 3.4,
                      duration: 110,
                      type: ["0"],
                      isFavor: false,
                      public: "2020",
                      title: "",
                      // url: ""
                    ),
                  ],
                ),
                HomeListWidget(
                  menu: S.of(context).otherFilms,
                  list: [
                    HomeBannerModel(
                      rate: 3,
                      duration: 100,
                      type: ["0"],
                      isFavor: false,
                      public: "2022",
                      title: "",
                      // url: ""
                    ),
                    HomeBannerModel(
                      rate: 3.3,
                      duration: 120,
                      type: ["0"],
                      isFavor: false,
                      public: "2021",
                      title: "",
                      // url: ""
                    ),
                    HomeBannerModel(
                      rate: 3.4,
                      duration: 110,
                      type: ["0"],
                      isFavor: false,
                      public: "2020",
                      title: "",
                      // url: ""
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
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
                  padding: EdgeInsets.only(left: 25),
                  child: HomeRateWidget(
                    model: widget.model,
                  ),
                )
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
                            Text(S.of(context).play,
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
                            child: SizedBox(
                                width: 15.5 * fem,
                                height: 19.22 * fem,
                                child: const Icon(
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
