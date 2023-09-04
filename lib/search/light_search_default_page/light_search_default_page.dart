import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:video/home/video_model.dart';

import '../light_search_default_page/widgets/usercard_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:video/core/app_export.dart';
import 'package:video/widgets/custom_search_view.dart';

import '../search_request.dart';

// ignore_for_file: must_be_immutable
class LightSearchDefaultPage extends StatefulWidget {
  const LightSearchDefaultPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LightSearchDefaultState();
  }
}

class LightSearchDefaultState extends State<LightSearchDefaultPage> {
  TextEditingController searchController = TextEditingController();
  List<VideoModel> list = [];
  @override
  void initState() {
    super.initState();
  }

  void search() async {
    List<VideoModel> _list = await searchVideos(searchController.value.text);
    setState(() {
      list = _list;
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        resizeToAvoidBottomInset: false,
        body: RawKeyboardListener(
          autofocus: true,
          focusNode: FocusNode(),
          onKey: (RawKeyEvent event) {
            if (event is RawKeyDownEvent) {
              // handle key down
              log("input value --->>> ${searchController.value.text}");
              search();
            } else if (event is RawKeyUpEvent) {
              // handle key up
            }
          },
          child: Container(
            width: double.maxFinite,
            decoration: AppDecoration.fillPrimary,
            child: Container(
              padding: getPadding(
                top: 14,
                bottom: 14,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "搜索",
                    style: theme.textTheme.titleLarge,
                  ),
                  CustomSearchView(
                    margin: getMargin(
                      left: 24,
                      top: 32,
                      right: 24,
                    ),
                    controller: searchController,
                    hintText: "搜索影片名称、类型、主演",
                    hintStyle: CustomTextStyles.bodyLargeGray500,
                    suffix: Container(
                      margin: getMargin(
                        left: 30,
                        top: 12,
                        right: 16,
                        bottom: 12,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          log("click search--->> ${searchController.value.text}");
                          search();
                        },
                        behavior: HitTestBehavior.translucent,
                        child: CustomImageView(
                          svgPath: ImageConstant.imgSearchGray600,
                        ),
                      ),
                    ),
                    suffixConstraints: BoxConstraints(
                      maxHeight: getVerticalSize(48),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: getPadding(
                      top: 20,
                    ),
                    child: IntrinsicWidth(
                      child: SizedBox(
                        height: getVerticalSize(282),
                        width: getHorizontalSize(602),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                padding: getPadding(
                                  left: 24,
                                  top: 15,
                                  right: 24,
                                  bottom: 15,
                                ),
                                decoration: AppDecoration.gradientPrimaryToGray,
                                child: Text(
                                  "热门搜索",
                                  style: CustomTextStyles
                                      .titleMediumOnPrimaryContainer,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: getPadding(
                                  bottom: 16,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CustomImageView(
                                            imagePath:
                                                ImageConstant.imgRectangle5404,
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
                                              "Dune",
                                              style: theme.textTheme.bodyLarge,
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
                                                    style: theme
                                                        .textTheme.titleSmall,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: getPadding(
                                                    left: 16,
                                                  ),
                                                  child: Text(
                                                    "2021",
                                                    style: theme
                                                        .textTheme.bodyMedium,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: getPadding(
                                                    left: 17,
                                                  ),
                                                  child: Text(
                                                    "2h 35m",
                                                    style: theme
                                                        .textTheme.bodyMedium,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: getPadding(
                                                    left: 17,
                                                  ),
                                                  child: Text(
                                                    "Action",
                                                    style: theme
                                                        .textTheme.bodyMedium,
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
                                                style:
                                                    theme.textTheme.bodyLarge,
                                              ),
                                            ),
                                            Padding(
                                              padding: getPadding(
                                                top: 3,
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
                                                      "8.4",
                                                      style: theme
                                                          .textTheme.titleSmall,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: getPadding(
                                                      left: 16,
                                                    ),
                                                    child: Text(
                                                      "2016",
                                                      style: theme
                                                          .textTheme.bodyMedium,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: getPadding(
                                                      left: 16,
                                                    ),
                                                    child: Text(
                                                      "1h 54m",
                                                      style: theme
                                                          .textTheme.bodyMedium,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: getPadding(
                                                      left: 16,
                                                    ),
                                                    child: Text(
                                                      "Sci-Fi",
                                                      style: theme
                                                          .textTheme.bodyMedium,
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: getPadding(
                        left: 24,
                        top: 15,
                      ),
                      child: Text(
                        "明星榜",
                        style: CustomTextStyles.titleMediumOnPrimaryContainer,
                      ),
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
                          return const UsercardItemWidget();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
