import 'package:flutter/material.dart';
import 'package:video/core/app_export.dart';

// ignore: must_be_immutable
class MovieCardItemWidget extends StatelessWidget {
  const MovieCardItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgRectangle5418,
          height: getVerticalSize(237),
          width: getHorizontalSize(158),
          radius: BorderRadius.circular(
            getHorizontalSize(4),
          ),
        ),
        Padding(
          padding: getPadding(
            top: 11,
          ),
          child: Text(
            "1231321",
            style: theme.textTheme.bodyLarge,
          ),
        ),
        Padding(
          padding: getPadding(
            left: 6,
            top: 2,
          ),
          child: Row(
            children: [
              CustomImageView(
                svgPath: ImageConstant.imgStar,
                height: getSize(16),
                width: getSize(16),
                margin: getMargin(
                  bottom: 3,
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 6,
                ),
                child: Text(
                  "8.4",
                  style: theme.textTheme.titleSmall,
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 16,
                ),
                child: Text(
                  "2016",
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 16,
                ),
                child: Text(
                  "1h 54m",
                  style: theme.textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
