import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:video/home/video_model.dart';
import 'package:video/home/widgets/moviecard4_item_widget.dart';
import 'package:video/home/widgets/video_info_desc_widget.dart';
import 'package:video/widgets/palyer/video_player_bottom.dart';
import 'package:video/widgets/palyer/video_player_top.dart';
import 'package:video_player/video_player.dart';

import '../core/utils/image_constant.dart';
import '../core/utils/size_utils.dart';
import '../theme/app_decoration.dart';
import '../theme/custom_text_style.dart';
import '../theme/theme_helper.dart';
import '../utils/navigation.dart';
import '../utils/video_payer_utils.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/custom_image_view.dart';
import '../widgets/home_rate_widget.dart';
import '../widgets/palyer/video_player_center.dart';
import '../widgets/palyer/video_player_gestures.dart';
import 'home_request.dart';

class HomeInfoPage extends StatefulWidget {
  VideoModel model;

  HomeInfoPage({super.key, required this.model});

  @override
  State<StatefulWidget> createState() {
    return _HomeInfoPageState();
  }
}

class _HomeInfoPageState extends State<HomeInfoPage> {
  Widget? _playerUI;
  VideoPlayerTop? _top;
  LockIcon? _lockIcon;
  VideoPlayerBottom? _bottom;
  final bool _isFullScreen = false;
  bool show = false;
  late VideoPlayerController _controller;

  // 如果是连续剧，
  VideoModel? subList;
  List<VideoModel> sameList = [];

  @override
  void initState() {
    if (kIsWeb) {
      try {
        Uri? uri = Uri.tryParse(widget.model.url);
        _controller = VideoPlayerController.networkUrl(uri!)
          ..initialize().then((_) {
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {
              _controller.play();
              _playerUI = VideoPlayer(_controller);
              VideoPlayerUtils.playerHandle(widget.model.url);
            });
          });
        _controller.setVolume(1.0);
      } catch (e) {
        log("init err -->>> $e");
      }
    } else {
      Future.delayed(Duration.zero, () {
        // 播放视频
        VideoPlayerUtils.playerHandle(widget.model.url);
        // 播放新视频，初始化监听
        VideoPlayerUtils.initializedListener(
            key: this,
            listener: (initialize, widget) {
              if (initialize) {
                _playerUI = widget;
                if (!mounted) return;
                setState(() {});
              }
            });
      });
    }

    Future.delayed(const Duration(seconds: 0), () {
      getData();
      _top = VideoPlayerTop(
          clickBack: () {
            VideoPlayerUtils.dispose();
            Navigator.of(context).pop();
          },
          title: widget.model.title);
      _lockIcon = LockIcon(
        lockCallback: () {
          log("click lock icon value");
        },
      );
      _bottom = VideoPlayerBottom(
        clickPause: () {
          if (kIsWeb) {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          }
        },
      );
      watch();
    });
    super.initState();
  }

  void watch() async {
    watchRequest(widget.model.id);
  }

  void getData() async {
    VideoModel? model = await getVideosById(widget.model.id);
    List<VideoModel> list = await getVideosByName(widget.model.actor);
    setState(() {
      if (mounted && model != null) {
        subList = model;
      }
      if (mounted && list.isNotEmpty) {
        sameList = list;
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    VideoPlayerUtils.removeInitializedListener(this);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: null,
        body: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Stack(
            children: [
              SafeArea(
                top: !_isFullScreen,
                bottom: !_isFullScreen,
                left: !_isFullScreen,
                right: !_isFullScreen,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: FadeInImage(
                                placeholder:
                                    AssetImage(ImageConstant.imgNetworkError),
                                fit: BoxFit.fill,
                                image: NetworkImage(widget.model.themeUrl),
                                fadeInDuration: const Duration(milliseconds: 5),
                                fadeOutDuration:
                                    const Duration(milliseconds: 5),
                                imageErrorBuilder: (c, o, s) => Image.asset(
                                  ImageConstant.imgNetworkError,
                                  height: 200,
                                  width: 200,
                                  fit: BoxFit.cover,
                                ),
                              ).image)),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * 9 / 16,
                      child: _playerUI != null
                          ? VideoPlayerGestures(
                              appearCallback: (appear) {
                                _top?.opacityCallback(appear);
                                _lockIcon?.opacityCallback(appear);
                                _bottom?.opacityCallback(appear);
                              },
                              children: [
                                const SizedBox(height: 22),
                                Center(child: _playerUI),
                                _top!,
                                _lockIcon!,
                                _bottom!,
                              ],
                            )
                          : Container(
                              alignment: Alignment.center,
                              color: Colors.black26,
                              child: const CircularProgressIndicator(
                                strokeWidth: 3,
                              ),
                            ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 25, top: 10),
                      child: HomeRateWidget(
                        model: widget.model,
                      ),
                    ),
                    VideoInfoDescWidget(
                        desc: widget.model.desc,
                        show: show,
                        clickMore: (val) {
                          setState(() {
                            show = val;
                          });
                        }),
                    Container(
                      margin: getMargin(top: 12),
                      padding:
                          getPadding(left: 24, top: 16, right: 24, bottom: 16),
                      decoration: AppDecoration.gradientPrimaryToGray,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Trailers",
                              style: CustomTextStyles.titleMediumPrimary),
                          // Container(
                          //   height: getVerticalSize(183),
                          //   width: getHorizontalSize(327),
                          //   margin: getMargin(top: 6, bottom: 6),
                          //   child: Stack(
                          //     alignment: Alignment.center,
                          //     children: [
                          //       CustomImageView(
                          //           imagePath: ImageConstant.imgPlayertrailer7,
                          //           height: getVerticalSize(183),
                          //           width: getHorizontalSize(327),
                          //           radius: BorderRadius.circular(
                          //               getHorizontalSize(4)),
                          //           alignment: Alignment.center),
                          //       CustomIconButton(
                          //           height: getSize(48),
                          //           width: getSize(48),
                          //           padding: getPadding(all: 14),
                          //           decoration:
                          //               IconButtonStyleHelper.fillPrimary,
                          //           alignment: Alignment.center,
                          //           child: CustomImageView(
                          //               svgPath: ImageConstant.imgEye))
                          //     ],
                          //   ),
                          // ),
                          Container(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: getPadding(left: 2, right: 2, top: 10),
                              child: ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                        height: getVerticalSize(16));
                                  },
                                  itemCount: sameList.length,
                                  itemBuilder: (context, index) {
                                    return MovieCard4ItemWidget(
                                      model: sameList[index],
                                      click: () {
                                        log("click item");
                                        Navigation.navigateTo(
                                          context: context,
                                          screen: HomeInfoPage(
                                            model: sameList[index],
                                          ),
                                          style: NavigationRouteStyle.material,
                                        );
                                      },
                                    );
                                  }),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Visibility(
                visible: show,
                child: infoWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget infoWidget() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: getPadding(top: 34, bottom: 0),
        decoration: AppDecoration.fillBlack,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Spacer(),
            Container(
              padding: getPadding(left: 24, top: 26, right: 24, bottom: 46),
              decoration: AppDecoration.fillPrimary
                  .copyWith(borderRadius: BorderRadiusStyle.customBorderTL24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      CustomIconButton(
                        width: 40,
                        height: 40,
                        child: const Icon(
                          Icons.close,
                          size: 20,
                          color: Colors.red,
                        ),
                        onTap: () {
                          setState(() {
                            show = false;
                          });
                        },
                      )
                    ],
                  ),
                  Text(widget.model.title,
                      style: theme.textTheme.headlineSmall),
                  Container(
                      width: getHorizontalSize(322),
                      margin: getMargin(top: 16),
                      child: Text(widget.model.desc,
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.bodyMediumGray500
                              .copyWith(height: 1.40))),
                  Container(
                      width: getHorizontalSize(323),
                      margin: getMargin(top: 14, bottom: 74),
                      child: Text(
                          "该片的主演包括${widget.model.actor}。主要拍摄于2015年8月上旬至2016年2月在邻近伦敦的工作室进行，并在${widget.model.years}发行。",
                          maxLines: 7,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.bodyMediumGray500
                              .copyWith(height: 1.40)))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
