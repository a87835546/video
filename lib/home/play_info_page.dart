import 'package:flutter/material.dart';
import 'package:video/core/app_export.dart';
import 'package:video/widgets/custom_icon_button.dart';

class PlayerInfoPage extends StatefulWidget {
  const PlayerInfoPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return PlayerInfoPageState();
  }
}

class PlayerInfoPageState extends State<PlayerInfoPage> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        body: SizedBox(
          width: double.maxFinite,
          child: SizedBox(
            width: double.maxFinite,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ListView(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: getVerticalSize(290),
                            width: double.maxFinite,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgRectangle5407,
                                    height: getVerticalSize(290),
                                    width: getHorizontalSize(375),
                                    alignment: Alignment.center),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    padding: getPadding(
                                        left: 16, top: 8, right: 16, bottom: 8),
                                    decoration: AppDecoration
                                        .gradientOnPrimaryToOnPrimaryContainer,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CustomIconButton(
                                            height: getSize(40),
                                            width: getSize(40),
                                            padding: getPadding(all: 8),
                                            decoration:
                                                IconButtonStyleHelper.fillBlack,
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgArrowleftGray800)),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: getPadding(
                                                top: 185, bottom: 13),
                                            child: Text(
                                                "Rogue One: A Star Wars Story",
                                                style: CustomTextStyles
                                                    .headlineSmallPrimary),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                              padding: getPadding(left: 24, top: 10),
                              child: Row(children: [
                                CustomImageView(
                                    svgPath: ImageConstant.imgStar,
                                    height: getSize(16),
                                    width: getSize(16),
                                    margin: getMargin(bottom: 3)),
                                Padding(
                                    padding: getPadding(left: 6),
                                    child: Text("8.4",
                                        style: theme.textTheme.titleSmall)),
                                Padding(
                                    padding: getPadding(left: 16),
                                    child: Text("2016",
                                        style: CustomTextStyles
                                            .bodyMediumGray500)),
                                Padding(
                                    padding: getPadding(left: 16),
                                    child: Text("1h 54m",
                                        style: CustomTextStyles
                                            .bodyMediumGray500)),
                                Padding(
                                    padding: getPadding(left: 16),
                                    child: Text("Sci-Fi",
                                        style:
                                            CustomTextStyles.bodyMediumGray500))
                              ])),
                          Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              child: Container(
                                width: getHorizontalSize(325),
                                margin: getMargin(left: 24, top: 16, right: 25),
                                child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text:
                                              "A Star Wars Story itself focuses on the Rebel Alliance which recruits Jyn Erso (Felicity Jones) after the formation of the Galaxy earning his livin... ",
                                          style: CustomTextStyles
                                              .bodyMediumGray400),
                                      TextSpan(
                                          text: "More",
                                          style: CustomTextStyles
                                              .titleSmallLightblueA70001_1)
                                    ]),
                                    textAlign: TextAlign.left),
                              ),
                              onTap: () {
                                setState(() {
                                  show = true;
                                });
                              },
                            ),
                          ),
                          Container(
                            margin: getMargin(top: 12),
                            padding: getPadding(
                                left: 24, top: 16, right: 24, bottom: 16),
                            decoration: AppDecoration.gradientPrimaryToGray,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Trailers",
                                    style: CustomTextStyles.titleMediumPrimary),
                                Container(
                                  height: getVerticalSize(183),
                                  width: getHorizontalSize(327),
                                  margin: getMargin(top: 6, bottom: 6),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      CustomImageView(
                                          imagePath:
                                              ImageConstant.imgPlayertrailer7,
                                          height: getVerticalSize(183),
                                          width: getHorizontalSize(327),
                                          radius: BorderRadius.circular(
                                              getHorizontalSize(4)),
                                          alignment: Alignment.center),
                                      CustomIconButton(
                                          height: getSize(48),
                                          width: getSize(48),
                                          padding: getPadding(all: 14),
                                          decoration:
                                              IconButtonStyleHelper.fillPrimary,
                                          alignment: Alignment.center,
                                          child: CustomImageView(
                                              svgPath: ImageConstant.imgEye))
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                        getPadding(left: 2, right: 2, top: 10),
                                    child: ListView.separated(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        separatorBuilder: (context, index) {
                                          return SizedBox(
                                              height: getVerticalSize(16));
                                        },
                                        itemCount: 6,
                                        itemBuilder: (context, index) {
                                          return Container();
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Visibility(
                  visible: show,
                  child: infoWidget(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget infoWidget() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: getPadding(top: 34, bottom: 0),
        decoration: AppDecoration.fillBlack,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Spacer(),
            Container(
              padding: getPadding(left: 24, top: 26, right: 24, bottom: 46),
              decoration: AppDecoration.fillPrimary
                  .copyWith(borderRadius: BorderRadiusStyle.customBorderTL24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      CustomIconButton(
                        width: 40,
                        height: 40,
                        child: const Icon(
                          Icons.close,
                          size: 20,
                          color: Colors.red,
                        ),
                        onTap: () {
                          setState(() {
                            show = false;
                          });
                        },
                      )
                    ],
                  ),
                  Text("侠盗一号：星球大战故事", style: theme.textTheme.headlineSmall),
                  Container(
                      width: getHorizontalSize(322),
                      margin: getMargin(top: 16),
                      child: Text(
                          "《侠盗一号》广泛获得积极的评价，包括赞赏它的演技、动作场面、配乐及暗色调，虽然有些批评是针对其性格描写，和电影中使用电脑合成图像来显示演员相似的肖像。该片在全球获得超过10亿美元的票房，成为2016年最卖座的电影第二位，并获得奥斯卡奖的两项提名，分别是最佳混音和最佳视觉效果。",
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.bodyMediumGray500
                              .copyWith(height: 1.40))),
                  Container(
                      width: getHorizontalSize(323),
                      margin: getMargin(top: 14, bottom: 74),
                      child: Text(
                          "该片的主演包括费莉丝蒂·琼斯、狄亚哥·卢纳、里兹·阿迈德、班·曼德森、甄子丹、迈兹·米克森、亚伦·塔迪克、姜文及佛瑞斯·惠特克。主要拍摄于2015年8月上旬至2016年2月在邻近伦敦的工作室进行，并在2016年6月中旬进行额外的拍摄，东尼·格莱也加入其中。电影于2016年12月10日于洛杉矶举行首映，并在2016年12月16日于美国发行。",
                          maxLines: 7,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.bodyMediumGray500
                              .copyWith(height: 1.40)))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
