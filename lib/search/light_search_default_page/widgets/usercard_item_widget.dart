import 'package:flutter/material.dart';
import 'package:video/core/app_export.dart';
import 'package:video/home/video_model.dart';

// ignore: must_be_immutable
class UserCardItemWidget extends StatelessWidget {
  final VideoModel model;
  const UserCardItemWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getHorizontalSize(100),
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: getPadding(
            bottom: 1,
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
                  top: 10,
                ),
                child: Text(
                  model.title,
                  style: CustomTextStyles.bodyMediumOnPrimaryContainer_1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
