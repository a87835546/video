import 'package:flutter/material.dart';
import 'package:video/core/app_export.dart';
import 'package:video/home/video_model.dart';
import 'package:video/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class MovieCard4ItemWidget extends StatelessWidget {
  final Function? click;
  final VideoModel model;
  const MovieCard4ItemWidget({Key? key, this.click, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgRectangle54042,
                    height: getVerticalSize(80),
                    width: getHorizontalSize(142),
                    radius: BorderRadius.circular(
                      getHorizontalSize(4),
                    ),
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
                top: 6,
                bottom: 49,
              ),
              child: Text(
                model.title ?? "12312312dsas",
                style: theme.textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        if (click != null) {
          click!();
        }
      },
    );
  }
}
