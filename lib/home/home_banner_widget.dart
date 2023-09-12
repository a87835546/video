import 'dart:developer';
import 'dart:ui';

import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:video/home/home_info_page.dart';
import 'package:video/home/video_model.dart';

import '../generated/l10n.dart';
import '../utils/navigation.dart';
import '../widgets/home_rate_widget.dart';
import 'home_banner_model.dart';
import 'home_hot_banner_widget.dart';
import 'home_list_widget.dart';
import 'home_model.dart';
import 'home_popular_star_widget.dart';
import 'home_request.dart';

class HomeBanner extends StatefulWidget {
  final int type;
  final String title;

  const HomeBanner({super.key, required this.type, required this.title});

  @override
  State<StatefulWidget> createState() {
    return HomeBannerState();
  }
}

class HomeBannerState extends State<HomeBanner> {
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );
  HomeModel? model;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      getData();
    });
  }

  void getData() async {
    var videos = await getVideos(widget.type);
    log("list--->>${widget.type} --->>> $videos");
    setState(() {
      model = videos;
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
                model != null && model!.bannerModel.isNotEmpty
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
                        customizedBanners: model?.bannerModel.map((e) {
                          return HomeBannerItemWidget(
                            model: e,
                            play: () {
                              Navigation.navigateTo(
                                context: context,
                                screen: HomeInfoPage(
                                  model: VideoModel(
                                      title: e.title,
                                      desc: e.desc,
                                      id: 0,
                                      categoryId: "",
                                      author: "",
                                      themeUrl: e.videoThemeUrl,
                                      types: e.types,
                                      rate: e.rate,
                                      actor: e.actor,
                                      menuTitle: widget.title,
                                      years: e.years,
                                      url: e.videoUrl),
                                ),
                                style: NavigationRouteStyle.material,
                              );
                            },
                            videoModel: null,
                          );
                        }).toList())
                    : const SizedBox(height: 10),
                Column(
                  children: model!.videoModel.map((e) {
                    return e.type == "测试分类"
                        ? HomeListWidget(
                            list: e.list,
                            menu: e.type,
                            click: (element) {
                              Navigation.navigateTo(
                                context: context,
                                screen: HomeInfoPage(
                                  model: element,
                                ),
                                style: NavigationRouteStyle.material,
                              );
                            },
                            clickMore: () {},
                          )
                        : Container(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: HomeHotBannerWidget(
                              clickMore: () {
                                log("click more ${e.type}");
                              },
                              clickItem: (data, index) {
                                log("click index:$index  item:$data");
                                Navigation.navigateTo(
                                  context: context,
                                  screen: HomeInfoPage(
                                    model: e.list[index],
                                  ),
                                  style: NavigationRouteStyle.material,
                                );
                              },
                              menu: e.type,
                              videos: e.list,
                            ));
                  }).toList(),
                ),
                HomePopularStarWidget(
                  list: model?.videoModel.first.list ?? [],
                  title: model?.videoModel.first.type ?? "123",
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
  final VideoModel? videoModel;

  const HomeBannerItemWidget(
      {super.key,
      this.play,
      this.favor,
      required this.model,
      required this.videoModel});

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
                    padding: EdgeInsets.fromLTRB(
                        26 * fem, 16 * fem, 17 * fem, 11 * fem),
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(widget.model.videoThemeUrl),
                          onError: (val, val2) {}),
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
                          child: Text(widget.model.title ?? '侠盗一号：星球大战故事',
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
