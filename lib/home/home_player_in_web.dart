import 'dart:developer';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video/home/video_model.dart';
import 'package:video/home/widgets/moviecard4_item_widget.dart';
import 'package:video/home/widgets/video_info_desc_widget.dart';
import 'package:video_player/video_player.dart';

import '../core/utils/image_constant.dart';
import '../core/utils/size_utils.dart';
import '../theme/app_decoration.dart';
import '../theme/custom_text_style.dart';
import '../utils/navigation.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/custom_image_view.dart';
import '../widgets/home_rate_widget.dart';
import 'home_info_page.dart';
import 'home_request.dart';

class HomePlayerInWeb extends StatefulWidget {
  const HomePlayerInWeb({super.key, required this.model});
  final VideoModel model;
  @override
  State<StatefulWidget> createState() {
    return HomePlayerInWebState();
  }
}

class HomePlayerInWebState extends State<HomePlayerInWeb> {
  TargetPlatform? _platform;
  late VideoPlayerController _videoPlayerController1;
  ChewieController? _chewieController;
  int? bufferDelay;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController1 =
        VideoPlayerController.networkUrl(Uri.parse(widget.model.url));
    await Future.wait([
      _videoPlayerController1.initialize(),
    ]);
    _createChewieController();
    setState(() {});
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController?.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> toggleVideo() async {
    await _videoPlayerController1.pause();
    await initializePlayer();
  }

  void _createChewieController() {
    final subtitles = [
      Subtitle(
        index: 0,
        start: Duration.zero,
        end: const Duration(seconds: 10),
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Hello',
              style: TextStyle(color: Colors.red, fontSize: 22),
            ),
            TextSpan(
              text: ' from ',
              style: TextStyle(color: Colors.green, fontSize: 20),
            ),
            TextSpan(
              text: 'subtitles',
              style: TextStyle(color: Colors.blue, fontSize: 18),
            )
          ],
        ),
      ),
      Subtitle(
        index: 0,
        start: const Duration(seconds: 10),
        end: const Duration(seconds: 20),
        text: 'Whats up? :)',
        // text: const TextSpan(
        //   text: 'Whats up? :)',
        //   style: TextStyle(color: Colors.amber, fontSize: 22, fontStyle: FontStyle.italic),
        // ),
      ),
    ];

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      autoPlay: true,
      looping: true,
      progressIndicatorDelay:
          bufferDelay != null ? Duration(milliseconds: bufferDelay!) : null,
      additionalOptions: (context) {
        return <OptionItem>[
          OptionItem(
            onTap: toggleVideo,
            iconData: Icons.live_tv_sharp,
            title: 'Toggle Video Src',
          ),
        ];
      },
      subtitle: Subtitles(subtitles),
      subtitleBuilder: (context, dynamic subtitle) => Container(
        padding: const EdgeInsets.all(10.0),
        child: subtitle is InlineSpan
            ? RichText(
                text: subtitle,
              )
            : Text(
                subtitle.toString(),
                style: const TextStyle(color: Colors.black),
              ),
      ),
      hideControlsTimer: const Duration(seconds: 1),
    );
  }

  bool show = false;

  // 如果是连续剧，
  VideoModel? subList;
  List<VideoModel> sameList = [];

  void watch() async {
    watchRequest(widget.model.id, 1);
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
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: _chewieController != null &&
                      _chewieController!
                          .videoPlayerController.value.isInitialized
                  ? Chewie(
                      controller: _chewieController!,
                    )
                  : const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 20),
                        Text('Loading'),
                      ],
                    ),
            ),
          ),
          TextButton(
            onPressed: () {
              _chewieController?.enterFullScreen();
            },
            child: const Text('Fullscreen'),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      _videoPlayerController1.pause();
                      _videoPlayerController1.seekTo(Duration.zero);
                      _createChewieController();
                    });
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Text("Landscape Video"),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(left: 25, top: 10),
            child: HomeRateWidget(
              model: widget.model,
            ),
          ),
          VideoInfoDescWidget(
            show: show,
            clickMore: (val) {
              setState(() {
                show = val;
              });
            },
            desc: widget.model.desc,
          ),
          Container(
            margin: getMargin(top: 12),
            padding: getPadding(left: 24, top: 16, right: 24, bottom: 16),
            decoration: AppDecoration.gradientPrimaryToGray,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Trailers", style: CustomTextStyles.titleMediumPrimary),
                Container(
                  height: getVerticalSize(183),
                  width: getHorizontalSize(327),
                  margin: getMargin(top: 6, bottom: 6),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgPlayertrailer7,
                          height: getVerticalSize(183),
                          width: getHorizontalSize(327),
                          radius: BorderRadius.circular(getHorizontalSize(4)),
                          alignment: Alignment.center),
                      CustomIconButton(
                          height: getSize(48),
                          width: getSize(48),
                          padding: getPadding(all: 14),
                          decoration: IconButtonStyleHelper.fillPrimary,
                          alignment: Alignment.center,
                          child: CustomImageView(svgPath: ImageConstant.imgEye))
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: getPadding(left: 2, right: 2, top: 10),
                    child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return SizedBox(height: getVerticalSize(16));
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
    );
  }
}

class DelaySlider extends StatefulWidget {
  const DelaySlider({Key? key, required this.delay, required this.onSave})
      : super(key: key);

  final int? delay;
  final void Function(int?) onSave;
  @override
  State<DelaySlider> createState() => _DelaySliderState();
}

class _DelaySliderState extends State<DelaySlider> {
  int? delay;
  bool saved = false;

  @override
  void initState() {
    super.initState();
    delay = widget.delay;
  }

  @override
  Widget build(BuildContext context) {
    const int max = 1000;
    return ListTile(
      title: Text(
        "Progress indicator delay ${delay != null ? "${delay.toString()} MS" : ""}",
      ),
      subtitle: Slider(
        value: delay != null ? (delay! / max) : 0,
        onChanged: (value) async {
          delay = (value * max).toInt();
          setState(() {
            saved = false;
          });
        },
      ),
      trailing: IconButton(
        icon: const Icon(Icons.save),
        onPressed: saved
            ? null
            : () {
                widget.onSave(delay);
                setState(() {
                  saved = true;
                });
              },
      ),
    );
  }
}
