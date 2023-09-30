import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:video/app_singleton.dart';
import 'package:video/appbar.dart';
import 'package:video/core/app_export.dart';
import 'package:video/home/video_model.dart';
import 'package:video/menu/widgets/movieprofile_item_widget.dart';
import 'package:video/widgets/custom_elevated_button.dart';

import '../generated/l10n.dart';
import '../home/home_info_page.dart';
import '../home/home_player_hls.dart';
import '../home/home_player_in_web.dart';
import '../utils/navigation.dart';
import '../widgets/custom_icon_button.dart';
import 'history_model.dart';
import 'history_request.dart';

class NoWatchlistPage extends StatefulWidget {
  const NoWatchlistPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return NoWatchlistPageState();
  }
}

class NoWatchlistPageState extends State<NoWatchlistPage> {
  List<HistoryModel> list = [];
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    var val = await getWatchList();
    setState(() {
      list = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: theme.colorScheme.primary,
        body: SafeArea(
          child: list.isEmpty
              ? Container(
                  width: double.maxFinite,
                  padding: getPadding(
                    top: 2,
                    bottom: 14,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(S.of(context).history),
                      Spacer(),
                      Container(
                        height: getVerticalSize(96),
                        width: getHorizontalSize(132),
                        padding: getPadding(
                          left: 47,
                          top: 24,
                          right: 47,
                          bottom: 10,
                        ),
                        decoration: AppDecoration.fillGray.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder20,
                        ),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgBookmark46x37,
                          height: getVerticalSize(46),
                          width: getHorizontalSize(37),
                          alignment: Alignment.center,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          top: 86,
                        ),
                        child: Text(
                          S.of(context).noData,
                          style: CustomTextStyles.titleMediumOnPrimaryContainer,
                        ),
                      ),
                      Container(
                        width: getHorizontalSize(248),
                        margin: getMargin(
                          top: 6,
                        ),
                        child: Text(
                          S.of(context).historyListNoData,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyMedium!.copyWith(
                            height: 1.40,
                          ),
                        ),
                      ),
                      CustomElevatedButton(
                        width: getHorizontalSize(160),
                        text: S.of(context).search,
                        margin: getMargin(
                          top: 30,
                          bottom: 84,
                        ),
                        onTap: () {
                          AppSingleton.index = 2;
                          AppTabBarState.currentInstance().onPageChanged(2);
                          AppSingleton.pageController?.jumpToPage(2);
                        },
                      ),
                    ],
                  ),
                )
              : Container(
                  width: double.maxFinite,
                  decoration: AppDecoration.fillPrimary,
                  child: Container(
                    padding: getPadding(
                      left: 24,
                      right: 24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: getPadding(
                              top: 14,
                            ),
                            child: Text(
                              "影单",
                              style: theme.textTheme.titleLarge,
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 31,
                          ),
                          child: Text(
                            "继续观看",
                            style:
                                CustomTextStyles.titleMediumOnPrimaryContainer,
                          ),
                        ),
                        Container(
                          height: getVerticalSize(183),
                          width: getHorizontalSize(327),
                          margin: getMargin(
                            top: 8,
                          ),
                          child: GestureDetector(
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                CustomImageView(
                                  imagePath:
                                      ImageConstant.imgPlayertrailer212x375,
                                  url: list[0].themeUrl,
                                  fit: BoxFit.fitWidth,
                                  height: getVerticalSize(183),
                                  width: getHorizontalSize(327),
                                  radius: BorderRadius.circular(
                                    getHorizontalSize(4),
                                  ),
                                  alignment: Alignment.center,
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: getPadding(
                                      left: 10,
                                      right: 10,
                                      bottom: 10,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CustomIconButton(
                                          height: getSize(48),
                                          width: getSize(48),
                                          padding: getPadding(
                                            all: 14,
                                          ),
                                          decoration:
                                              IconButtonStyleHelper.fillPrimary,
                                          child: CustomImageView(
                                            svgPath: ImageConstant.imgEye,
                                          ),
                                        ),
                                        Container(
                                          margin: getMargin(
                                            top: 29,
                                          ),
                                          padding: getPadding(
                                            left: 10,
                                            top: 5,
                                            right: 10,
                                            bottom: 5,
                                          ),
                                          decoration: AppDecoration.fillOnError
                                              .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder4,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                height: getVerticalSize(1),
                                                width: getHorizontalSize(236),
                                                margin: getMargin(
                                                  top: 8,
                                                  bottom: 8,
                                                ),
                                                child: Stack(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: SizedBox(
                                                        width:
                                                            getHorizontalSize(
                                                                236),
                                                        child: Divider(
                                                          color: theme
                                                              .colorScheme
                                                              .primary
                                                              .withOpacity(
                                                                  0.24),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: SizedBox(
                                                        width:
                                                            getHorizontalSize(
                                                                69),
                                                        child: Divider(
                                                          color: theme
                                                              .colorScheme
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  left: 17,
                                                  top: 2,
                                                ),
                                                child: Text(
                                                  "00:40:12",
                                                  style: CustomTextStyles
                                                      .bodySmallPrimary,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              var m = VideoModel(
                                  title: list[0].title,
                                  desc: '',
                                  id: list[0].vid,
                                  themeUrl: list[0].themeUrl,
                                  url: list[0].url);
                              if (kIsWeb) {
                                Navigation.navigateTo(
                                  context: context,
                                  screen: VideoApp(
                                    model: m,
                                  ),
                                  style: NavigationRouteStyle.material,
                                );
                              } else {
                                Navigation.navigateTo(
                                  context: context,
                                  screen: HomeInfoPage(
                                    model: m,
                                  ),
                                  style: NavigationRouteStyle.material,
                                );
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 10,
                          ),
                          child: Text(
                            list[0].title,
                            style: theme.textTheme.bodyLarge,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 4,
                            right: 47,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                svgPath: ImageConstant.imgStar,
                                height: getSize(16),
                                width: getSize(16),
                                margin: getMargin(
                                  bottom: 4,
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 6,
                                  bottom: 1,
                                ),
                                child: Text(
                                  list[0].rate,
                                  style: theme.textTheme.titleSmall,
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 16,
                                  bottom: 1,
                                ),
                                child: Text(
                                  "${list[0].years}",
                                  style: theme.textTheme.bodyMedium,
                                ),
                              ),
                              // Padding(
                              //   padding: getPadding(
                              //     left: 17,
                              //     bottom: 1,
                              //   ),
                              //   child: Text(
                              //     "1 Season",
                              //     style: theme.textTheme.bodyMedium,
                              //   ),
                              // ),
                              Padding(
                                padding: getPadding(
                                  left: 16,
                                ),
                                child: Text(
                                  list[0].actor,
                                  style: theme.textTheme.bodyMedium,
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 16,
                                  bottom: 1,
                                ),
                                child: Text(
                                  "Action",
                                  style: theme.textTheme.bodyMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 30,
                          ),
                          child: Text(
                            "My Watchlist",
                            style:
                                CustomTextStyles.titleMediumOnPrimaryContainer,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: getPadding(
                              top: 6,
                              right: 3,
                            ),
                            child: ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: getVerticalSize(16),
                                );
                              },
                              itemCount: list.length,
                              itemBuilder: (context, index) {
                                return MovieProfileItemWidget(
                                    click: () {
                                      var m = VideoModel(
                                          title: list[index].title,
                                          desc: '',
                                          id: list[index].vid,
                                          themeUrl: list[index].themeUrl,
                                          url: list[index].url);
                                      if (kIsWeb) {
                                        Navigation.navigateTo(
                                          context: context,
                                          screen: VideoApp(
                                            model: m,
                                          ),
                                          style: NavigationRouteStyle.material,
                                        );
                                      } else {
                                        Navigation.navigateTo(
                                          context: context,
                                          screen: HomeInfoPage(
                                            model: m,
                                          ),
                                          style: NavigationRouteStyle.material,
                                        );
                                      }
                                    },
                                    model: list[index]);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ));
  }
}
