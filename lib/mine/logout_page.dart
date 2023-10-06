import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video/app_singleton.dart';
import 'package:video/core/app_export.dart';
import 'package:video/mine/mine.dart';
import 'package:video/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:video/widgets/app_bar/custom_app_bar.dart';
import 'package:video/widgets/custom_icon_button.dart';

import '../generated/l10n.dart';
import '../utils/navigation.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_outlined_button.dart';
import 'mine_info_page.dart';
import 'mine_tmp.dart';

// ignore_for_file: must_be_immutable
class LogoutPage extends StatefulWidget {
  const LogoutPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return LogoutPageState();
  }
}

class LogoutPageState extends State<LogoutPage> {
  TextEditingController listoneController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: theme.colorScheme.primary,
        appBar: CustomAppBar(
          centerTitle: true,
          title: AppbarSubtitle1(
            text: S.of(context).mineInfo,
          ),
        ),
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            padding: getPadding(
              top: 4,
            ),
            child: Padding(
              padding: getPadding(
                left: 24,
                right: 24,
                bottom: 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: getSize(81),
                      width: getSize(81),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgOval,
                            height: getSize(80),
                            width: getSize(80),
                            radius: BorderRadius.circular(
                              getHorizontalSize(40),
                            ),
                            alignment: Alignment.center,
                          ),
                          CustomIconButton(
                            height: getSize(25),
                            width: getSize(25),
                            padding: getPadding(
                              all: 5,
                            ),
                            decoration: IconButtonStyleHelper
                                .gradientGreenAToOnSecondaryContainer,
                            alignment: Alignment.bottomRight,
                            child: CustomImageView(
                              svgPath: ImageConstant.imgFolder,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: getPadding(
                        top: 16,
                      ),
                      child: Text(
                        AppSingleton.getInstance().userModel?.username ??
                            "Jane Anastasia",
                        style: CustomTextStyles.titleMediumOnPrimaryContainer,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: getPadding(
                        top: 3,
                      ),
                      child: Text(
                        "普通会员",
                        style: CustomTextStyles.titleSmallGray600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 35,
                    ),
                    child: Text(
                      S.of(context).personalInfo,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 12,
                    ),
                    child: GestureDetector(
                      child: Row(
                        children: [
                          CustomImageView(
                            svgPath: ImageConstant.imgUserLightBlueA70001,
                            height: getSize(24),
                            width: getSize(24),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 12,
                              top: 2,
                            ),
                            child: Text(
                              S.of(context).mineInfo,
                              style: CustomTextStyles
                                  .bodyMediumOnPrimaryContainer_1,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigation.navigateTo(
                          context: context,
                          screen: MineInfoPage(),
                          style: NavigationRouteStyle.cupertino,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 16,
                    ),
                    child: Row(
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgBag,
                          height: getSize(24),
                          width: getSize(24),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 12,
                            top: 2,
                          ),
                          child: Text(
                            S.of(context).mineSubscribe,
                            style:
                                CustomTextStyles.bodyMediumOnPrimaryContainer_1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 32,
                    ),
                    child: Text(
                      S.of(context).contractNumber,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomImageView(
                              svgPath: ImageConstant.imgMailLightBlueA70001,
                              height: getSize(24),
                              width: getSize(24),
                            ),
                            Padding(
                              padding: getPadding(
                                left: 12,
                                top: 2,
                              ),
                              child: Text(
                                S.of(context).email,
                                style: CustomTextStyles
                                    .bodyMediumOnPrimaryContainer_1,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: getPadding(
                            top: 6,
                          ),
                          child: Text(
                            AppSingleton.getInstance().userModel?.email ??
                                "ana*******@mail.com",
                            style: CustomTextStyles.bodySmallPrimary12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 15,
                    ),
                    child: Row(
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgCall,
                          height: getSize(24),
                          width: getSize(24),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 12,
                            top: 2,
                          ),
                          child: Text(
                            S.of(context).contractNumber ?? "电话号码",
                            style:
                                CustomTextStyles.bodyMediumOnPrimaryContainer_1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 32,
                    ),
                    child: Text(
                      S.of(context).securitySetting,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    child: Padding(
                      padding: getPadding(
                        top: 12,
                      ),
                      child: Row(
                        children: [
                          CustomImageView(
                            svgPath: ImageConstant.imgLockLightBlueA70001,
                            height: getSize(24),
                            width: getSize(24),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 12,
                              top: 2,
                            ),
                            child: Text(
                              S.of(context).password,
                              style: CustomTextStyles
                                  .bodyMediumOnPrimaryContainer_1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      log("password");
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      log("设置");
                      Navigation.navigateTo(
                        context: context,
                        screen: MinePage(),
                        style: NavigationRouteStyle.cupertino,
                      );
                    },
                    behavior: HitTestBehavior.translucent,
                    child: Padding(
                      padding: getPadding(top: 16),
                      child: Row(
                        children: [
                          CustomImageView(
                            svgPath: ImageConstant.imgSettings,
                            height: getSize(24),
                            width: getSize(24),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 12,
                              top: 2,
                            ),
                            child: Text(
                              S.of(context).setting,
                              style: CustomTextStyles
                                  .bodyMediumOnPrimaryContainer_1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 28,
                    ),
                    child: Text(
                      S.of(context).GeneralSetting,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 16,
                    ),
                    child: Row(
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgSend,
                          height: getSize(24),
                          width: getSize(24),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 13,
                            top: 2,
                          ),
                          child: Text(
                            S.of(context).help,
                            style:
                                CustomTextStyles.bodyMediumOnPrimaryContainer_1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 16,
                    ),
                    child: Row(
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgDashboard,
                          height: getSize(24),
                          width: getSize(24),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 13,
                            top: 2,
                          ),
                          child: Text(
                            S.of(context).aboutUs,
                            style:
                                CustomTextStyles.bodyMediumOnPrimaryContainer_1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 16,
                    ),
                    child: Row(
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgVideocamera,
                          height: getSize(24),
                          width: getSize(24),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          child: Padding(
                            padding: getPadding(
                              left: 12,
                            ),
                            child: Text(
                              S.of(context).logout,
                              style: CustomTextStyles
                                  .bodyMediumOnPrimaryContainer_1,
                            ),
                          ),
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    decoration:
                                        AppDecoration.fillPrimary.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.customBorderTL24,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: getPadding(
                                            left: 24,
                                            top: 38,
                                          ),
                                          child: Text(
                                            S.of(context).logoutConfirm,
                                            style: CustomTextStyles
                                                .headlineSmallOnPrimaryContainer,
                                          ),
                                        ),
                                        Container(
                                          width: getHorizontalSize(308),
                                          margin: getMargin(
                                            left: 24,
                                            top: 11,
                                            right: 42,
                                          ),
                                          child: Text(
                                            "如果您确定退出，则必须重新登录才能继续观看电影。 请知悉！",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: theme.textTheme.bodyMedium!
                                                .copyWith(
                                              height: 1.40,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: getPadding(
                                              left: 24,
                                              top: 38,
                                              right: 24,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CustomOutlinedButton(
                                                  width: getHorizontalSize(155),
                                                  text: S.of(context).logout,
                                                  buttonTextStyle:
                                                      CustomTextStyles
                                                          .bodyLargeInter,
                                                  onTap: () async {
                                                    AppSingleton.getInstance()
                                                        .userModel = null;
                                                    Navigator.pop(context);
                                                    context
                                                        .read<ReloadModel>()
                                                        .reload(true);
                                                    SharedPreferences _prefs =
                                                        await SharedPreferences
                                                            .getInstance();
                                                    bool val = await _prefs
                                                        .remove("userinfo");
                                                  },
                                                ),
                                                CustomElevatedButton(
                                                  width: getHorizontalSize(155),
                                                  text: S.of(context).cancel,
                                                  margin: getMargin(
                                                    left: 17,
                                                  ),
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: getVerticalSize(34),
                                          width: double.maxFinite,
                                          margin: getMargin(
                                            top: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
