import 'package:flutter/material.dart';
import 'package:video/core/app_export.dart';

// ignore: must_be_immutable
class UserprofileItemWidget extends StatelessWidget {
  const UserprofileItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getHorizontalSize(100),
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: getPadding(
            bottom: 2,
          ),
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
                  "sdfsd234234",
                  style: CustomTextStyles.bodyMediumBlack900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
