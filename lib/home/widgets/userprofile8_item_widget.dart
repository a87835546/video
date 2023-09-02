import 'package:flutter/material.dart';
import 'package:video/core/app_export.dart';

// ignore: must_be_immutable
class Userprofile8ItemWidget extends StatelessWidget {
  const Userprofile8ItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgRectangle5410,
            height: getSize(100),
            width: getSize(100),
            radius: BorderRadius.circular(
              getHorizontalSize(4),
            ),
          ),
          Padding(
            padding: getPadding(
              top: 9,
            ),
            child: Text(
              "",
              style: CustomTextStyles.bodyMediumBlack900,
            ),
          ),
        ],
      ),
    );
  }
}
