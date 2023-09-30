import 'package:flutter/material.dart';
import 'package:video/core/app_export.dart';
import 'package:video/menu/history_model.dart';
import 'package:video/widgets/custom_icon_button.dart';

class MovieProfileItemWidget extends StatefulWidget {
  final HistoryModel model;
  final Function click;
  const MovieProfileItemWidget(
      {super.key, required this.model, required this.click});

  @override
  State<StatefulWidget> createState() {
    return MovieProfileItemWidgetState();
  }
}

class MovieProfileItemWidgetState extends State<MovieProfileItemWidget> {
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
                url: widget.model.themeUrl,
                fit: BoxFit.fitWidth,
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
                widget.model.title,
                style: theme.textTheme.bodyLarge,
              ),
              Padding(
                padding: getPadding(
                  top: 26,
                ),
                child: GestureDetector(
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
                          widget.model.rate,
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 16,
                        ),
                        child: Text(
                          "${widget.model.years}",
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 16,
                        ),
                        child: Text(
                          "${widget.model.duration}",
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    widget.click();
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
