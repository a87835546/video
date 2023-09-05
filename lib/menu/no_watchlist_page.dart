import 'package:flutter/material.dart';
import 'package:video/app_singleton.dart';
import 'package:video/appbar.dart';
import 'package:video/core/app_export.dart';
import 'package:video/widgets/custom_elevated_button.dart';

import '../generated/l10n.dart';

class NoWatchlistPage extends StatefulWidget {
  const NoWatchlistPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return NoWatchlistPageState();
  }
}

class NoWatchlistPageState extends State<NoWatchlistPage> {
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).videoMenu),
        ),
        backgroundColor: theme.colorScheme.primary,
        body: Container(
          width: double.maxFinite,
          padding: getPadding(
            top: 14,
            bottom: 14,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                S.of(context).videoMenu,
                style: theme.textTheme.titleLarge,
              ),
              Spacer(),
              Container(
                height: getVerticalSize(96),
                width: getHorizontalSize(132),
                padding: getPadding(
                  left: 47,
                  top: 24,
                  right: 47,
                  bottom: 24,
                ),
                decoration: AppDecoration.fillGray.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder20,
                ),
                child: CustomImageView(
                  imagePath: ImageConstant.imgBookmark46x37,
                  height: getVerticalSize(46),
                  width: getHorizontalSize(37),
                  alignment: Alignment.center,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 86,
                ),
                child: Text(
                  S.of(context).noData,
                  style: CustomTextStyles.titleMediumOnPrimaryContainer,
                ),
              ),
              Container(
                width: getHorizontalSize(248),
                margin: getMargin(
                  top: 6,
                ),
                child: Text(
                  "在“首页”或“搜索”上查找一些电影，然后创建您的影单",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    height: 1.40,
                  ),
                ),
              ),
              CustomElevatedButton(
                width: getHorizontalSize(160),
                text: S.of(context).search,
                margin: getMargin(
                  top: 30,
                  bottom: 84,
                ),
                onTap: () {
                  AppSingleton.index = 2;
                  AppTabBarState.currentInstance().onPageChanged(2);
                  AppSingleton.pageController?.jumpToPage(2);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
