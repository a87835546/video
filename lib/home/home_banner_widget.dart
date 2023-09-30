import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video/home/home_info_page.dart';
import 'package:video/home/home_player_in_web.dart';
import 'package:video/home/video_model.dart';

import '../core/utils/image_constant.dart';
import '../generated/l10n.dart';
import '../utils/navigation.dart';
import '../widgets/home_rate_widget.dart';
import 'home_banner_model.dart';
import 'home_hot_banner_widget.dart';
import 'home_model.dart';
import 'home_player_hls.dart';
import 'home_popular_star_widget.dart';
import 'home_request.dart';
import 'package:universal_html/html.dart' as html;

class HomeBanner extends StatefulWidget {
  final int type;
  final String title;
  HomeModel? model;

  HomeBanner({super.key, required this.type, required this.title, this.model});

  @override
  State<StatefulWidget> createState() {
    return HomeBannerState();
  }
}

class HomeBannerState extends State<HomeBanner>
    with AutomaticKeepAliveClientMixin {
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );
  HomeModel? defaultModel;
  bool pull = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      getDefaultData();
      getData();
    });
  }

  void getDefaultData() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? val = _prefs.getString("videos/queryList?menu_id=${widget.type}");
    if (val != null) {
      Map<String, dynamic> data = json.decode(val);
      HomeModel mo = HomeModel.fromJson(data);
      setState(() {
        defaultModel = mo;
      });
    }
  }

  void getData() async {
    var videos = await getVideos(widget.type, pull);
    setState(() {
      defaultModel = videos;
      pull = false;
    });
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
        enablePullUp: false,
        enablePullDown: true,
        header: const WaterDropHeader(),
        footer: const ClassicFooter(
          loadStyle: LoadStyle.ShowWhenLoading,
        ),
        onRefresh: () {
          log("refresh");
          setState(() {
            pull = true;
          });
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
                defaultModel != null && defaultModel!.bannerModel.isNotEmpty
                    ? BannerCarousel.fullScreen(
                        height: 466,
                        animation: true,
                        viewportFraction: 1,
                        // showIndicator: true,
                        indicatorBottom: true,
                        customizedIndicators: const IndicatorModel.animation(
                            width: 20,
                            height: 5,
                            spaceBetween: 2,
                            widthAnimation: 50),
                        customizedBanners: defaultModel?.bannerModel.map((e) {
                          var vm = VideoModel(
                              title: e.title,
                              desc: e.desc,
                              id: 0,
                              themeUrl: e.videoThemeUrl,
                              url: e.videoUrl);
                          vm.types = e.types;
                          vm.rate = e.rate;
                          vm.actor = e.actor;
                          vm.menuTitle = e.menuTitle;
                          vm.years = e.years;
                          return HomeBannerItemWidget(
                              model: e,
                              isFavor: e.isFavorite,
                              favor: () async {
                                var res = await favor(e.videoId);
                              },
                              play: () {
                                Navigation.navigateTo(
                                  context: context,
                                  screen: HomeInfoPage(
                                    model: vm,
                                  ),
                                  style: NavigationRouteStyle.material,
                                );
                              },
                              videoModel: vm);
                        }).toList())
                    : const SizedBox(height: 10),
                Column(
                  children: (defaultModel?.videoModel ??
                          widget.model?.videoModel ??
                          [])
                      .map((e) {
                    if (e.type == "周星驰集选") {
                      return HomePopularStarWidget(
                        list: e.list,
                        menu: e.type,
                        click: (val, index) {
                          Navigation.navigateTo(
                            context: context,
                            screen: HomePlayerInWeb(
                              model: e.list[index],
                            ),
                            style: NavigationRouteStyle.material,
                          );
                        },
                      );
                    } else {
                      return Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: HomeHotBannerWidget(
                          clickMore: () {
                            log("click more ${e.type}");
                          },
                          clickItem: (data, index) {
                            log("click index:$index  item:$data  is web:$kIsWeb");

                            if (kIsWeb) {
                              Navigation.navigateTo(
                                context: context,
                                screen: VideoApp(
                                  model: e.list[index],
                                ),
                                style: NavigationRouteStyle.material,
                              );
                            } else {
                              Navigation.navigateTo(
                                context: context,
                                screen: HomeInfoPage(
                                  model: e.list[index],
                                ),
                                style: NavigationRouteStyle.material,
                              );
                            }

                            // Navigation.navigateTo(
                            //   context: context,
                            //   screen: HomePlayerInWeb(
                            //     model: e.list[index],
                            //   ),
                            //   style: NavigationRouteStyle.material,
                            // );
                          },
                          menu: e.type,
                          videos: e.list,
                        ),
                      );
                    }
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class HomeBannerItemWidget extends StatefulWidget {
  final Function? play;
  final Function? favor;
  final bool isFavor;
  final HomeBannerModel model;
  final VideoModel? videoModel;

  const HomeBannerItemWidget(
      {super.key,
      this.play,
      this.favor,
      required this.isFavor,
      required this.model,
      required this.videoModel});

  @override
  State<StatefulWidget> createState() {
    return _HomeBannerItemWidgetState();
  }
}

class _HomeBannerItemWidgetState extends State<HomeBannerItemWidget> {
  double fem = 1;
  bool isFavor = false;
  @override
  void initState() {
    isFavor = widget.isFavor;

    super.initState();
  }

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
                    padding: EdgeInsets.fromLTRB(
                        26 * fem, 16 * fem, 17 * fem, 11 * fem),
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: FadeInImage(
                            placeholder:
                                AssetImage(ImageConstant.imgNetworkError),
                            fit: BoxFit.fill,
                            image: NetworkImage(widget.model.videoThemeUrl),
                            fadeInDuration: const Duration(milliseconds: 5),
                            fadeOutDuration: const Duration(milliseconds: 5),
                            imageErrorBuilder: (c, o, s) => Image.asset(
                              ImageConstant.imgNetworkError,
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
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 173 * fem, 0 * fem),
                          child: Text(widget.model.title,
                              style: GoogleFonts.zenKakuGothicNew(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xffffffff),
                                  height: 1.4)),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 25),
                  child: HomeRateWidget(
                    model: widget.videoModel,
                  ),
                )
              ],
            ),
          ),
          Container(
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
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 10 * fem, 0 * fem),
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
                                    color: const Color(0xffffffff),
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
                          padding: EdgeInsets.fromLTRB(
                              4.3 * fem, 2.78 * fem, 4.21 * fem, 2 * fem),
                          width: double.infinity,
                          height: double.infinity,
                          child: Center(
                            child: SizedBox(
                                width: 25 * fem,
                                height: 25 * fem,
                                child: Icon(
                                  Icons.favorite,
                                  size: 20,
                                  color: isFavor
                                      ? Theme.of(context).primaryColor
                                      : const Color(0xffC2C2C2),
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      isFavor = !isFavor;
                    });
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
