import 'package:flutter/material.dart';
import 'package:video/core/app_export.dart';
import 'package:video/widgets/custom_text_form_field.dart';

class LightSearchLoadingProgressErrorScreen extends StatelessWidget {
  LightSearchLoadingProgressErrorScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController asdfghjklvalueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: getPadding(
            left: 24,
            top: 14,
            right: 24,
            bottom: 14,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "搜索",
                  style: theme.textTheme.titleLarge,
                ),
              ),
              CustomTextFormField(
                controller: asdfghjklvalueController,
                margin: getMargin(
                  top: 32,
                ),
                hintText: "asdfghjkl",
                hintStyle: theme.textTheme.bodyLarge!,
                textInputAction: TextInputAction.done,
                suffix: Container(
                  margin: getMargin(
                    left: 30,
                    top: 12,
                    right: 16,
                    bottom: 12,
                  ),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgIconlyLightCloseBig,
                  ),
                ),
                suffixConstraints: BoxConstraints(
                  maxHeight: getVerticalSize(48),
                ),
                contentPadding: getPadding(
                  left: 16,
                  top: 12,
                  bottom: 12,
                ),
              ),
              Spacer(),
              CustomImageView(
                svgPath: ImageConstant.imgContrast,
                height: getSize(40),
                width: getSize(40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
