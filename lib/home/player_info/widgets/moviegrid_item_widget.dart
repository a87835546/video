import '../widgets/moviecard_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:video/core/app_export.dart';

// ignore: must_be_immutable
class MovieGridItemWidget extends StatelessWidget {
  const MovieGridItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        all: 24,
      ),
      decoration: AppDecoration.gradientPrimaryToGray,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: getPadding(
              left: 1,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "222dsssdd",
                  style: theme.textTheme.titleMedium,
                ),
                Padding(
                  padding: getPadding(
                    bottom: 2,
                  ),
                  child: Text(
                    "View All",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: getPadding(
              top: 14,
              bottom: 6,
            ),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: getVerticalSize(297),
                crossAxisCount: 2,
                mainAxisSpacing: getHorizontalSize(11),
                crossAxisSpacing: getHorizontalSize(11),
              ),
              physics: NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) {
                return MovieCardItemWidget();
              },
            ),
          ),
        ],
      ),
    );
  }
}
