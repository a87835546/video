import 'package:flutter/material.dart';
import 'package:video/core/app_export.dart';
import 'package:video/home/widgets/moviecard4_item_widget.dart';
import 'package:video/home/widgets/userprofile8_item_widget.dart';
import 'package:video/widgets/custom_elevated_button.dart';
import 'package:video/widgets/custom_icon_button.dart';

class VideoInfoPage extends StatefulWidget {
  const VideoInfoPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return VideoInfoPageState();
  }
}

class VideoInfoPageState extends State<VideoInfoPage> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    height: getVerticalSize(290),
                    width: double.maxFinite,
                    child: Stack(alignment: Alignment.center, children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgRectangle5407,
                          height: getVerticalSize(290),
                          width: getHorizontalSize(375),
                          alignment: Alignment.center),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              padding: getPadding(
                                  left: 16, top: 4, right: 16, bottom: 4),
                              decoration:
                                  AppDecoration.gradientPrimaryToPrimary,
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomIconButton(
                                        height: getSize(40),
                                        width: getSize(40),
                                        margin: getMargin(top: 3),
                                        padding: getPadding(all: 8),
                                        decoration:
                                            IconButtonStyleHelper.fillBlack,
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: CustomImageView(
                                            svgPath: ImageConstant
                                                .imgArrowleftGray800)),
                                    Padding(
                                        padding: getPadding(left: 8, top: 202),
                                        child: Text("曼达洛人 第2季",
                                            style:
                                                theme.textTheme.headlineSmall))
                                  ])))
                    ])),
                Padding(
                    padding: getPadding(left: 24, top: 10),
                    child: Row(children: [
                      CustomImageView(
                          svgPath: ImageConstant.imgStar,
                          height: getSize(16),
                          width: getSize(16),
                          margin: getMargin(bottom: 3)),
                      Padding(
                          padding: getPadding(left: 6),
                          child:
                              Text("8.4", style: theme.textTheme.titleSmall)),
                      Padding(
                          padding: getPadding(left: 16),
                          child:
                              Text("2016", style: theme.textTheme.bodyMedium)),
                      Padding(
                          padding: getPadding(left: 16),
                          child: Text("更新至第18集",
                              style: theme.textTheme.bodyMedium))
                    ])),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: getVerticalSize(81),
                    width: getHorizontalSize(322),
                    margin: getMargin(top: 4),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                                width: getHorizontalSize(322),
                                child: Text(
                                    "每周四上午10点更新\n技、动作场面、配乐及暗色调，虽然有些批评是针对其性格描写，和电影中使用电脑合成图像来显示演员相似的肖像。该片在全球获得超过10亿美元的...",
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles.bodyMediumGray500
                                        .copyWith(height: 1.40)))),
                        GestureDetector(
                          child: Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                  padding: getPadding(right: 2),
                                  child: Text("更多",
                                      style: CustomTextStyles
                                          .titleSmallLightblueA70001))),
                          onTap: () {
                            setState(() {
                              show = true;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                    padding: getPadding(left: 24, top: 14),
                    child: Text("主要演员", style: theme.textTheme.titleMedium)),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: getPadding(left: 24, top: 7, right: 24),
                    child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: getVerticalSize(131),
                            crossAxisCount: 3,
                            mainAxisSpacing: getHorizontalSize(13),
                            crossAxisSpacing: getHorizontalSize(13)),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Userprofile8ItemWidget();
                        }),
                  ),
                ),
                Container(
                  margin: getMargin(top: 20),
                  padding: getPadding(top: 22, bottom: 22),
                  decoration: AppDecoration.gradientPrimaryToGray,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: getPadding(left: 24),
                          child: Text("本季剧集（已更新至18集）",
                              style: theme.textTheme.titleMedium)),
                      Container(
                        height: getVerticalSize(560),
                        width: getHorizontalSize(374),
                        margin: getMargin(top: 18, bottom: 7),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: getPadding(left: 23, right: 23),
                                child: ListView.separated(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                          height: getVerticalSize(16));
                                    },
                                    itemCount: 6,
                                    itemBuilder: (context, index) {
                                      return Moviecard4ItemWidget();
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                margin: getMargin(top: 374, bottom: 6),
                                padding: getPadding(
                                    left: 23, top: 44, right: 23, bottom: 44),
                                decoration:
                                    AppDecoration.gradientPrimaryToPrimary1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: CustomElevatedButton(
                                        text: "立即观看 第1集",
                                        margin: getMargin(top: 44),
                                        leftIcon: Container(
                                          margin: getMargin(right: 8),
                                          child: CustomImageView(
                                              svgPath: ImageConstant.imgPlay),
                                        ),
                                      ),
                                    ),
                                    CustomIconButton(
                                        height: getSize(48),
                                        width: getSize(48),
                                        margin: getMargin(left: 10, top: 44),
                                        padding: getPadding(all: 12),
                                        decoration:
                                            IconButtonStyleHelper.outlineBlack,
                                        child: CustomImageView(
                                            svgPath: ImageConstant.imgBookmark))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
