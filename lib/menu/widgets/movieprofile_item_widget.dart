import 'package:flutter/material.dart';
import 'package:video/core/app_export.dart';
import 'package:video/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class MovieprofileItemWidget extends StatelessWidget {
  const MovieprofileItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: getVerticalSize(80),
          width: getHorizontalSize(142),
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgRectangle540480x142,
                height: getVerticalSize(80),
                width: getHorizontalSize(142),
                alignment: Alignment.center,
              ),
              CustomIconButton(
                height: getSize(32),
                width: getSize(32),
                padding: getPadding(
                  all: 9,
                ),
                alignment: Alignment.center,
                child: CustomImageView(
                  svgPath: ImageConstant.imgEye,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: getPadding(
            left: 10,
            top: 5,
            bottom: 3,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "title ----",
                style: theme.textTheme.bodyLarge,
              ),
              Padding(
                padding: getPadding(
                  top: 26,
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
                        "7.4",
                        style: theme.textTheme.titleSmall,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 16,
                      ),
                      child: Text(
                        "2022",
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 16,
                      ),
                      child: Text(
                        "2h10m",
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
