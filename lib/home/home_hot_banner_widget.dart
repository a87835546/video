import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../generated/l10n.dart';
import '../utils/fonts.dart';
import 'home_banner_model.dart';
import 'home_hot_banner_item_widget.dart';

class HomeHotBannerWidget extends StatefulWidget {
  final Function? clickMore;
  final String menu;
  final Function(HomeBannerModel model, int index)? clickItem;
  final List<HomeBannerModel> list;
  const HomeHotBannerWidget(
      {super.key,
      this.clickMore,
      required this.list,
      this.clickItem,
      required this.menu});

  @override
  State<StatefulWidget> createState() {
    return _HomeHotBannerWidgetState();
  }
}

class _HomeHotBannerWidgetState extends State<HomeHotBannerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Column(
        children: [
          HomeBannerTopView(
            menu: widget.menu,
            clickMore: widget.clickMore,
          ),
          BannerCarousel.fullScreen(
              height: 220,
              animation: true,
              viewportFraction: 1,
              showIndicator: false,
              customizedBanners: widget.list.map((e) {
                int index = widget.list.indexOf(e);
                return HomeHotBannerItemWidget(
                  model: e,
                  click: () {
                    if (widget.clickItem != null) {
                      widget.clickItem!(e, index);
                    }
                  },
                );
              }).toList()),
        ],
      ),
    );
  }
}

class HomeBannerTopView extends StatelessWidget {
  final String menu;
  final Function? clickMore;

  const HomeBannerTopView({super.key, required this.menu, this.clickMore});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(menu ?? "", style: Fonts.title()),
          GestureDetector(
            child: Text(
              S.of(context).more,
              style: GoogleFonts.zenKakuGothicNew(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.2000000477,
                color: const Color(0xff757575),
              ),
            ),
            onTap: () {
              if (clickMore != null) {
                clickMore!();
              }
            },
          )
        ],
      ),
    );
  }
}
