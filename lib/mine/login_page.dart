import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video/app_singleton.dart';
import 'package:video/core/app_export.dart';
import 'package:video/mine/mine_request.dart';
import 'package:video/mine/register_page.dart';
import 'package:video/mine/user_model.dart';
import 'package:video/widgets/app_bar/appbar_image_1.dart';
import 'package:video/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:video/widgets/app_bar/custom_app_bar.dart';
import 'package:video/widgets/custom_elevated_button.dart';
import 'package:video/widgets/custom_outlined_button.dart';
import 'package:video/widgets/custom_text_form_field.dart';

import '../generated/l10n.dart';
import '../utils/navigation.dart';
import 'mine_tmp.dart';

// ignore_for_file: must_be_immutable
class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  TextEditingController mailController = TextEditingController();

  TextEditingController lockController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
            leadingWidth: getHorizontalSize(48),
            // leading: AppbarImage1(
            //     svgPath: ImageConstant.imgArrowleftOnprimarycontainer,
            //     margin: getMargin(left: 24, top: 14, bottom: 17),
            //     onTap: () {
            //       Navigator.pop(context);
            //     }),
            centerTitle: true,
            title: AppbarSubtitle1(text: S.of(context).login)),
        body: Container(
          width: double.maxFinite,
          padding: getPadding(left: 24, top: 23, right: 24, bottom: 23),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("欢迎来到头条影视", style: theme.textTheme.titleLarge)),
              CustomTextFormField(
                  controller: mailController,
                  margin: getMargin(top: 22),
                  hintText: "jane.anastas|",
                  hintStyle: CustomTextStyles.bodyMediumOnPrimaryContainer_1,
                  prefix: Container(
                      margin:
                          getMargin(left: 16, top: 14, right: 11, bottom: 14),
                      child: CustomImageView(
                          svgPath: ImageConstant.imgMailLightBlueA700)),
                  prefixConstraints:
                      BoxConstraints(maxHeight: getVerticalSize(48))),
              CustomTextFormField(
                  controller: lockController,
                  margin: getMargin(top: 16),
                  hintText: S.of(context).inputPwd,
                  hintStyle: theme.textTheme.bodyMedium!,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  prefix: Container(
                      margin:
                          getMargin(left: 16, top: 14, right: 12, bottom: 14),
                      child: CustomImageView(svgPath: ImageConstant.imgLock)),
                  prefixConstraints:
                      BoxConstraints(maxHeight: getVerticalSize(48))),
              Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                      padding: getPadding(top: 16, right: 28),
                      child: Text(S.of(context).forgetPwd,
                          style: CustomTextStyles
                              .bodyMediumOnPrimaryContainer_1))),
              CustomElevatedButton(
                text: S.of(context).login,
                margin: getMargin(top: 14),
                onTap: () async {
                  log("login page click login");
                  UserModel? model = await login(
                      mailController.value.text, lockController.value.text);
                  if (model != null && context.mounted) {
                    context.read<ReloadModel>().reload(false);
                    AppSingleton.pageController?.jumpToPage(3);
                  }
                },
              ),
              Padding(
                  padding: getPadding(top: 18),
                  child:
                      Text("or", style: CustomTextStyles.bodyMediumGray70001)),
              CustomElevatedButton(
                text: "Apple帐号登录",
                margin: getMargin(top: 12),
                leftIcon: Container(
                    margin: getMargin(right: 8),
                    child:
                        CustomImageView(svgPath: ImageConstant.imgEyePrimary)),
                buttonStyle: CustomButtonStyles.fillGrayTL4,
                buttonTextStyle: CustomTextStyles.bodyLargePrimary,
                onTap: () {
                  log("login page click login via apple");
                },
              ),
              CustomOutlinedButton(
                text: "Login with Google",
                margin: getMargin(top: 16),
                leftIcon: Container(
                  margin: getMargin(right: 9),
                  child: CustomImageView(svgPath: ImageConstant.imgTwitter),
                ),
                onTap: () {
                  log("login page click login via Google");
                },
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigation.navigateTo(
                    context: context,
                    screen: RegisterPage(),
                    style: NavigationRouteStyle.cupertino,
                  );
                },
                behavior: HitTestBehavior.translucent,
                child: Padding(
                    padding: getPadding(bottom: 65),
                    child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: S.of(context).noAccount,
                              style: CustomTextStyles
                                  .bodyMediumOnPrimaryContainer),
                          TextSpan(text: " "),
                          TextSpan(
                              text: S.of(context).signUp,
                              style: CustomTextStyles.bodyMediumLightblueA700)
                        ]),
                        textAlign: TextAlign.left)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
