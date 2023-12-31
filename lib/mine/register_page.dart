import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:video/core/app_export.dart';
import 'package:video/mine/mine_request.dart';
import 'package:video/mine/user_model.dart';
import 'package:video/utils/toast.dart';
import 'package:video/widgets/app_bar/appbar_image_1.dart';
import 'package:video/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:video/widgets/app_bar/custom_app_bar.dart';
import 'package:video/widgets/custom_elevated_button.dart';
import 'package:video/widgets/custom_outlined_button.dart';

import '../../widgets/custom_text_form_field.dart';
import '../generated/l10n.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return RegisterPageState();
  }
}

class RegisterPageState extends State<RegisterPage> {
  TextEditingController usernameOneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  String _selectedDate = '';

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
            leadingWidth: getHorizontalSize(48),
            leading: AppbarImage1(
                svgPath: ImageConstant.imgArrowleftOnprimarycontainer,
                margin: getMargin(left: 24, top: 14, bottom: 17),
                onTap: () {
                  Navigator.pop(context);
                }),
            centerTitle: true,
            title: AppbarSubtitle1(text: S.of(context).register)),
        body: Stack(
          children: [
            Container(
              width: double.maxFinite,
              padding: getPadding(left: 24, top: 23, right: 24, bottom: 23),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(S.of(context).createAccount,
                          style: theme.textTheme.titleLarge)),
                  CustomTextFormField(
                      controller: usernameOneController,
                      margin: getMargin(top: 22),
                      hintText: "jane.anastas|",
                      hintStyle:
                          CustomTextStyles.bodyMediumOnPrimaryContainer_1,
                      prefix: Container(
                          margin: getMargin(
                              left: 16, top: 14, right: 11, bottom: 14),
                          child: CustomImageView(
                              svgPath: ImageConstant.imgMailLightBlueA700)),
                      prefixConstraints:
                          BoxConstraints(maxHeight: getVerticalSize(48))),
                  CustomTextFormField(
                      controller: passwordController,
                      margin: getMargin(top: 16),
                      hintText: S.of(context).inputPwd,
                      hintStyle:
                          CustomTextStyles.titleSmallPlusJakartaSansGray600,
                      obscureText: true,
                      prefix: Container(
                          margin: getMargin(
                              left: 16, top: 14, right: 12, bottom: 14),
                          child:
                              CustomImageView(svgPath: ImageConstant.imgLock)),
                      prefixConstraints:
                          BoxConstraints(maxHeight: getVerticalSize(48))),
                  CustomTextFormField(
                      controller: confirmPasswordController,
                      margin: getMargin(top: 16),
                      hintText: S.of(context).confirmInputPwd,
                      hintStyle:
                          CustomTextStyles.titleSmallPlusJakartaSansGray600,
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      prefix: Container(
                          margin: getMargin(
                              left: 16, top: 14, right: 12, bottom: 14),
                          child:
                              CustomImageView(svgPath: ImageConstant.imgLock)),
                      prefixConstraints:
                          BoxConstraints(maxHeight: getVerticalSize(48))),
                  GestureDetector(
                    onTap: () async {
                      var date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.timestamp(),
                        firstDate: DateTime.parse("1900-01-01"),
                        lastDate: DateTime.now(),
                        onDatePickerModeChange: (value) {
                          log("select date $value");
                        },
                      );

                      log("test---- $date");
                      setState(() {
                        _selectedDate =
                            "${date?.day}/${date?.month}/${date?.year}";
                      });
                    },
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                      margin: getMargin(top: 16),
                      padding:
                          getPadding(left: 16, top: 14, right: 16, bottom: 14),
                      decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder4),
                      child: Row(
                        children: [
                          CustomImageView(
                              svgPath: ImageConstant.imgCalendar,
                              height: getSize(20),
                              width: getSize(20)),
                          Padding(
                              padding: getPadding(left: 12),
                              child: Text(
                                  _selectedDate.isEmpty
                                      ? "DD / MM / YYYY"
                                      : _selectedDate,
                                  style: CustomTextStyles
                                      .bodyMediumPlusJakartaSans))
                        ],
                      ),
                    ),
                  ),
                  CustomElevatedButton(
                    text: S.of(context).register,
                    margin: getMargin(top: 16),
                    onTap: () async {
                      log("register user");
                      if (passwordController.value.text !=
                          confirmPasswordController.value.text) {
                        showErrorText("password is different");
                      } else {
                        UserModel? model = await register(
                            usernameOneController.value.text,
                            passwordController.value.text,
                            _selectedDate);
                        if (model != null && mounted) {
                          Navigator.pop(context);
                        }
                      }
                    },
                  ),
                  Padding(
                      padding: getPadding(top: 18),
                      child: Text("or",
                          style: CustomTextStyles.bodyMediumGray70001)),
                  CustomElevatedButton(
                    text: "Register with Apple",
                    margin: getMargin(top: 12),
                    leftIcon: Container(
                        margin: getMargin(right: 8),
                        child: CustomImageView(
                            svgPath: ImageConstant.imgEyePrimary)),
                    buttonStyle: CustomButtonStyles.fillGrayTL4,
                    buttonTextStyle: CustomTextStyles.bodyLargePrimary,
                    onTap: () {
                      log("register var apple");
                    },
                  ),
                  CustomOutlinedButton(
                    text: "Register with Google",
                    margin: getMargin(top: 16),
                    leftIcon: Container(
                      margin: getMargin(right: 9),
                      child: CustomImageView(svgPath: ImageConstant.imgTwitter),
                    ),
                    onTap: () {
                      log("register via Google");
                    },
                  ),
                  Container(
                      width: getHorizontalSize(257),
                      margin:
                          getMargin(left: 34, top: 41, right: 34, bottom: 5),
                      child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text:
                                    "By creating an account, you agree to our’s\n",
                                style: theme.textTheme.bodyMedium),
                            TextSpan(
                                text: "Privacy Policy",
                                style:
                                    CustomTextStyles.bodyMediumLightblueA70001),
                            TextSpan(text: " "),
                            TextSpan(
                                text: "and", style: theme.textTheme.bodyMedium),
                            TextSpan(text: " "),
                            TextSpan(
                                text: "Terms of Use",
                                style:
                                    CustomTextStyles.bodyMediumLightblueA70001)
                          ]),
                          textAlign: TextAlign.center))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
