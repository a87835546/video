import 'package:flutter/material.dart';
import 'package:video/core/app_export.dart';
import 'package:video/home/player_info/widgets/moviegrid_item_widget.dart';
import 'package:video/home/player_info/widgets/userprofile_item_widget.dart';
import 'package:video/widgets/app_bar/appbar_image.dart';
import 'package:video/widgets/app_bar/appbar_subtitle.dart';
import 'package:video/widgets/app_bar/appbar_subtitle_3.dart';
import 'package:video/widgets/app_bar/appbar_subtitle_4.dart';
import 'package:video/widgets/app_bar/custom_app_bar.dart';
import 'package:video/widgets/custom_elevated_button.dart';
import 'package:video/widgets/custom_icon_button.dart';

class PlayerInfoPage extends StatelessWidget {
  const PlayerInfoPage({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        appBar: CustomAppBar(
          height: getVerticalSize(33),
          title: Padding(
            padding: getPadding(
              left: 26,
            ),
            child: Row(
              children: [
                AppbarSubtitle(
                  text: "电影",
                ),
                AppbarSubtitle4(
                  text: "电视",
                  margin: getMargin(
                    left: 19,
                    bottom: 3,
                  ),
                ),
                AppbarSubtitle4(
                  text: "动漫",
                  margin: getMargin(
                    left: 19,
                    top: 1,
                    bottom: 2,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            AppbarSubtitle3(
              text: "综艺",
              margin: getMargin(
                left: 19,
                right: 3,
              ),
            ),
            AppbarSubtitle3(
              text: "午夜",
              margin: getMargin(
                left: 19,
                right: 3,
              ),
            ),
            AppbarImage(
              svgPath: ImageConstant.imgSearch,
              margin: getMargin(
                left: 14,
                top: 1,
                right: 30,
                bottom: 3,
              ),
            ),
          ],
        ),
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            padding: getPadding(
              top: 9,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: getVerticalSize(334),
                  width: double.maxFinite,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgRectangle5407,
                        height: getVerticalSize(334),
                        width: getHorizontalSize(375),
                        alignment: Alignment.center,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          padding: getPadding(
                            left: 17,
                            top: 6,
                            right: 17,
                            bottom: 6,
                          ),
                          decoration: AppDecoration.gradientPrimaryToPrimary,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomImageView(
                                svgPath: ImageConstant.imgSignal,
                                height: getVerticalSize(8),
                                width: getHorizontalSize(28),
                                alignment: Alignment.centerRight,
                                margin: getMargin(
                                  top: 9,
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 9,
                                  top: 268,
                                ),
                                child: Text(
                                  "侠盗一号：星球大战故事",
                                  style: theme.textTheme.headlineSmall,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(
                      left: 24,
                      top: 9,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgStar,
                          height: getSize(16),
                          width: getSize(16),
                          margin: getMargin(
                            top: 3,
                            bottom: 3,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 6,
                            top: 2,
                          ),
                          child: Text(
                            "8.4",
                            style: theme.textTheme.titleSmall,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 16,
                            top: 2,
                          ),
                          child: Text(
                            "2016",
                            style: CustomTextStyles.bodyMediumGray500,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 24,
                            bottom: 2,
                          ),
                          child: Text(
                            "01小时54分",
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 15,
                            bottom: 2,
                          ),
                          child: Text(
                            "动作",
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 15,
                            bottom: 2,
                          ),
                          child: Text(
                            "剧情",
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 24,
                    top: 21,
                    right: 24,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomElevatedButton(
                          text: "立即观看",
                          leftIcon: Container(
                            margin: getMargin(
                              right: 8,
                            ),
                            child: CustomImageView(
                              svgPath: ImageConstant.imgPlay,
                            ),
                          ),
                        ),
                      ),
                      CustomIconButton(
                        height: getSize(48),
                        width: getSize(48),
                        margin: getMargin(
                          left: 10,
                        ),
                        padding: getPadding(
                          all: 12,
                        ),
                        decoration: IconButtonStyleHelper.fillOnError,
                        child: CustomImageView(
                          svgPath: ImageConstant.imgComputer,
                        ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: getPadding(
                    top: 30,
                  ),
                  child: IntrinsicWidth(
                    child: SizedBox(
                      height: getVerticalSize(267),
                      width: double.maxFinite,
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              height: getVerticalSize(266),
                              width: getHorizontalSize(602),
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      width: double.maxFinite,
                                      margin: getMargin(
                                        right: 227,
                                        bottom: 9,
                                      ),
                                      padding: getPadding(
                                        left: 23,
                                        top: 16,
                                        right: 23,
                                        bottom: 16,
                                      ),
                                      decoration:
                                          AppDecoration.gradientPrimaryToGray,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: getPadding(
                                              bottom: 199,
                                            ),
                                            child: Text(
                                              "热门电影",
                                              style:
                                                  theme.textTheme.titleMedium,
                                            ),
                                          ),
                                          Padding(
                                            padding: getPadding(
                                              bottom: 199,
                                            ),
                                            child: Text(
                                              "View All",
                                              style: theme.textTheme.bodyMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgRectangle5404,
                                                height: getVerticalSize(160),
                                                width: getHorizontalSize(284),
                                                radius: BorderRadius.circular(
                                                  getHorizontalSize(4),
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  top: 10,
                                                ),
                                                child: Text(
                                                  "沙丘",
                                                  style: CustomTextStyles
                                                      .titleMediumMedium,
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  top: 4,
                                                ),
                                                child: Row(
                                                  children: [
                                                    CustomImageView(
                                                      svgPath:
                                                          ImageConstant.imgStar,
                                                      height: getSize(16),
                                                      width: getSize(16),
                                                    ),
                                                    Padding(
                                                      padding: getPadding(
                                                        left: 6,
                                                      ),
                                                      child: Text(
                                                        "8.9",
                                                        style: theme.textTheme
                                                            .titleSmall,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: getPadding(
                                                        left: 16,
                                                      ),
                                                      child: Text(
                                                        "2021",
                                                        style: theme.textTheme
                                                            .bodyMedium,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: getPadding(
                                              left: 10,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgRectangle5404160x284,
                                                  height: getVerticalSize(160),
                                                  width: getHorizontalSize(284),
                                                  radius: BorderRadius.circular(
                                                    getHorizontalSize(4),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: getPadding(
                                                    top: 11,
                                                  ),
                                                  child: Text(
                                                    "Shang-Chi and the Legend of the T..",
                                                    style: theme
                                                        .textTheme.bodyLarge,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: getPadding(
                                                    top: 3,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgStar,
                                                        height: getSize(16),
                                                        width: getSize(16),
                                                      ),
                                                      Padding(
                                                        padding: getPadding(
                                                          left: 6,
                                                        ),
                                                        child: Text(
                                                          "8.4",
                                                          style: theme.textTheme
                                                              .titleSmall,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: getPadding(
                                                          left: 16,
                                                        ),
                                                        child: Text(
                                                          "2016",
                                                          style: theme.textTheme
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: getPadding(
                                                          left: 16,
                                                        ),
                                                        child: Text(
                                                          "1h 54m",
                                                          style: theme.textTheme
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: getPadding(
                                                          left: 16,
                                                        ),
                                                        child: Text(
                                                          "Sci-Fi",
                                                          style: theme.textTheme
                                                              .bodyMedium,
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
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: getPadding(
                                left: 131,
                              ),
                              child: Text(
                                "01小时54分",
                                style: theme.textTheme.bodyMedium,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: getPadding(
                                right: 133,
                              ),
                              child: Text(
                                "动作",
                                style: theme.textTheme.bodyMedium,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: getVerticalSize(327),
                  width: double.maxFinite,
                  margin: getMargin(
                    top: 12,
                  ),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      CustomImageView(
                        svgPath: ImageConstant.imgSignal,
                        height: getVerticalSize(8),
                        width: getHorizontalSize(28),
                        alignment: Alignment.bottomCenter,
                        margin: getMargin(
                          bottom: 6,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: getPadding(
                            left: 26,
                            bottom: 55,
                          ),
                          child: Text(
                            "自杀小队",
                            style: CustomTextStyles.titleMediumMedium,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          padding: getPadding(
                            all: 24,
                          ),
                          decoration: AppDecoration.gradientGrayToGray,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: getPadding(
                                  right: 3,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "院线大片",
                                      style: theme.textTheme.titleMedium,
                                    ),
                                    Text(
                                      "View All",
                                      style: theme.textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgPlayertrailer,
                                height: getVerticalSize(183),
                                width: getHorizontalSize(327),
                                radius: BorderRadius.circular(
                                  getHorizontalSize(4),
                                ),
                                margin: getMargin(
                                  top: 7,
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  top: 8,
                                ),
                                child: Text(
                                  "自杀小队",
                                  style: CustomTextStyles.titleMediumMedium,
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  top: 5,
                                  bottom: 3,
                                ),
                                child: Row(
                                  children: [
                                    CustomImageView(
                                      svgPath: ImageConstant.imgStar,
                                      height: getSize(16),
                                      width: getSize(16),
                                      margin: getMargin(
                                        bottom: 3,
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 6,
                                      ),
                                      child: Text(
                                        "7.6",
                                        style: theme.textTheme.titleSmall,
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 16,
                                      ),
                                      child: Text(
                                        "2015",
                                        style: theme.textTheme.bodyMedium,
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 16,
                                      ),
                                      child: Text(
                                        "01小时54分",
                                        style: theme.textTheme.bodyMedium,
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 16,
                                      ),
                                      child: Text(
                                        "动作",
                                        style: theme.textTheme.bodyMedium,
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
                ),
                Padding(
                  padding: getPadding(
                    left: 23,
                    top: 15,
                    right: 23,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "明星榜",
                        style: theme.textTheme.titleMedium,
                      ),
                      Text(
                        "View All",
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    height: getVerticalSize(140),
                    child: ListView.separated(
                      padding: getPadding(
                        left: 24,
                        top: 8,
                      ),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (
                        context,
                        index,
                      ) {
                        return SizedBox(
                          width: getHorizontalSize(10),
                        );
                      },
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return UserprofileItemWidget();
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 13,
                  ),
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (
                      context,
                      index,
                    ) {
                      return SizedBox(
                        height: getVerticalSize(1),
                      );
                    },
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return MovieGridItemWidget();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
