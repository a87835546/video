import 'package:flutter/material.dart';
import 'package:video/core/app_export.dart';
import 'package:video/widgets/app_bar/appbar_image_1.dart';
import 'package:video/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:video/widgets/app_bar/custom_app_bar.dart';
import 'package:video/widgets/custom_bottom_bar.dart';

import '../generated/l10n.dart';

// ignore_for_file: must_be_immutable
class MineInfoPage extends StatelessWidget {
  MineInfoPage({Key? key}) : super(key: key);
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        appBar: CustomAppBar(
            leadingWidth: getHorizontalSize(48),
            leading: AppbarImage1(
                svgPath: ImageConstant.imgArrowleftOnprimarycontainer,
                margin: getMargin(left: 24, top: 14, bottom: 17),
                onTap: () {
                  Navigator.pop(context);
                }),
            centerTitle: true,
            title: AppbarSubtitle1(text: S.of(context).mineInfo)),
        body: Container(
          width: double.maxFinite,
          padding: getPadding(left: 27, top: 18, right: 27, bottom: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgOval,
                  height: getSize(80),
                  width: getSize(80),
                  radius: BorderRadius.circular(getHorizontalSize(40)),
                  alignment: Alignment.center),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: getPadding(top: 16),
                  child: Text("Jane Anastasia",
                      style: CustomTextStyles.titleMediumOnPrimaryContainer),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: getPadding(top: 3),
                  child: Text(S.of(context).modifyAvatar,
                      style: CustomTextStyles.titleSmallLightblueA70001Medium),
                ),
              ),
              Padding(
                  padding: getPadding(top: 35),
                  child: Row(children: [
                    Text(S.of(context).lastName,
                        style: CustomTextStyles.bodyMediumGray500),
                    Padding(
                        padding: getPadding(left: 25),
                        child: Text("Jane",
                            style: CustomTextStyles
                                .bodyMediumOnPrimaryContainer_1))
                  ])),
              Padding(
                padding: getPadding(top: 14),
                child: Row(
                  children: [
                    Text(S.of(context).firstName,
                        style: CustomTextStyles.bodyMediumGray500),
                    Padding(
                        padding: getPadding(left: 25),
                        child: Text("Anastasia",
                            style: CustomTextStyles
                                .bodyMediumOnPrimaryContainer_1))
                  ],
                ),
              ),
              Padding(
                padding: getPadding(top: 14),
                child: Row(
                  children: [
                    Text(S.of(context).birthday,
                        style: CustomTextStyles.bodyMediumGray500),
                    Padding(
                        padding: getPadding(left: 27),
                        child: Text("16/08/95",
                            style: CustomTextStyles
                                .bodyMediumOnPrimaryContainer_1))
                  ],
                ),
              ),
              Padding(
                padding: getPadding(top: 14),
                child: Row(
                  children: [
                    Text(S.of(context).gender,
                        style: CustomTextStyles.bodyMediumGray500),
                    Padding(
                        padding: getPadding(left: 25),
                        child: Text("Female",
                            style: CustomTextStyles
                                .bodyMediumOnPrimaryContainer_1))
                  ],
                ),
              ),
              Padding(
                padding: getPadding(top: 14, bottom: 5),
                child: Row(
                  children: [
                    Padding(
                        padding: getPadding(bottom: 1),
                        child: Text(S.of(context).area,
                            style: CustomTextStyles.bodyMediumGray500)),
                    Padding(
                        padding: getPadding(left: 25),
                        child: Text("Los Angeles",
                            style: CustomTextStyles
                                .bodyMediumOnPrimaryContainer_1))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
