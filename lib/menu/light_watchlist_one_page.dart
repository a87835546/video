import 'package:flutter/material.dart';
import 'package:video/core/app_export.dart';
import 'package:video/menu/widgets/movieprofile_item_widget.dart';
import 'package:video/widgets/custom_icon_button.dart';

// ignore_for_file: must_be_immutable
class LightWatchlistOnePage extends StatelessWidget {
  const LightWatchlistOnePage({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        body: Container(
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
                    style: CustomTextStyles.titleMediumOnPrimaryContainer,
                  ),
                ),
                Container(
                  height: getVerticalSize(183),
                  width: getHorizontalSize(327),
                  margin: getMargin(
                    top: 8,
                  ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgPlayertrailer212x375,
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomIconButton(
                                height: getSize(48),
                                width: getSize(48),
                                padding: getPadding(
                                  all: 14,
                                ),
                                decoration: IconButtonStyleHelper.fillPrimary,
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
                                decoration: AppDecoration.fillOnError.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder4,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: getVerticalSize(1),
                                      width: getHorizontalSize(236),
                                      margin: getMargin(
                                        top: 8,
                                        bottom: 8,
                                      ),
                                      child: Stack(
                                        alignment: Alignment.centerLeft,
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: SizedBox(
                                              width: getHorizontalSize(236),
                                              child: Divider(
                                                color: theme.colorScheme.primary
                                                    .withOpacity(0.24),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: SizedBox(
                                              width: getHorizontalSize(69),
                                              child: Divider(
                                                color:
                                                    theme.colorScheme.primary,
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
                                        style:
                                            CustomTextStyles.bodySmallPrimary,
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
                    top: 10,
                  ),
                  child: Text(
                    "The Falcon and The Winter Soldier",
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
                          "7.6",
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 16,
                          bottom: 1,
                        ),
                        child: Text(
                          "2021",
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 17,
                          bottom: 1,
                        ),
                        child: Text(
                          "1 Season",
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 16,
                        ),
                        child: Text(
                          "7 Episode",
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
                    style: CustomTextStyles.titleMediumOnPrimaryContainer,
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
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return MovieprofileItemWidget();
                      },
                    ),
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
