import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:video/app_singleton.dart';

import 'generated/l10n.dart';

class AppTabBar extends StatefulWidget {
  final Function(int) click;
  final double bottom;
  final BuildContext context;

  const AppTabBar(
      {Key? key,
      required this.bottom,
      required this.click,
      required this.context})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => AppTabBarState();
}

class AppTabBarState extends State<AppTabBar> {
  int page = 0;
  final List<Icon> normalImages = const [
    Icon(
      Icons.home,
      color: Color(0xffD4D4D4),
      size: 22,
    ),
    Icon(
      Icons.menu,
      color: Color(0xffD4D4D4),
      size: 22,
    ),
    Icon(
      Icons.search,
      color: Color(0xffD4D4D4),
      size: 22,
    ),
    Icon(
      Icons.person,
      color: Color(0xffD4D4D4),
      size: 22,
    ),
  ];
  List<Icon> selectedImages = const [
    Icon(
      Icons.home,
      color: Color(0xff00A6BE),
      size: 22,
    ),
    Icon(
      Icons.menu,
      color: Color(0xff00A6BE),
      size: 22,
    ),
    Icon(
      Icons.search,
      color: Color(0xff00A6BE),
      size: 22,
    ),
    Icon(
      Icons.person,
      color: Color(0xff00A6BE),
      size: 22,
    ),
  ];

  static GlobalKey appbar = GlobalKey();
  static currentInstance() {
    return AppTabBarState.appbar.currentContext?.findAncestorStateOfType();
  }

  @override
  void initState() {
    super.initState();
    log("initState");
    AppSingleton.index = page;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    log("didChangeDependencies");
    AppSingleton.index = page;
  }

  @override
  Widget build(BuildContext context) {
    AppSingleton.index = page;
    final List<String> _list = [
      S.of(context).home,
      S.of(context).menuPage,
      S.of(context).searchPage,
      S.of(context).mine
    ];
    return SizedBox(
      key: appbar,
      height: kBottomNavigationBarHeight + widget.bottom,
      child: Container(
        padding: EdgeInsets.only(bottom: widget.bottom),
        color: Colors.white,
        height: kBottomNavigationBarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _list.map((e) {
            return GestureDetector(
                onTap: () {
                  widget.click(_list.indexOf(e));
                  setState(() {
                    page = _list.indexOf(e);
                  });
                },
                behavior: HitTestBehavior.opaque,
                child: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width / _list.length,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                          padding: const EdgeInsets.only(top: 6),
                          child: getImageStr(_list.indexOf(e))),
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text(
                          e,
                          style: TextStyle(
                              color: getColor(_list.indexOf(e)),
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ));
          }).toList(),
        ),
      ),
    );
  }

  Color getColor(int value) {
    return page == value ? const Color(0xFF00A6BE) : const Color(0xffD4D4D4);
  }

  void onPageChanged(int page) {
    setState(() {
      this.page = page;
    });
  }

  Icon getImageStr(int value) {
    return page == value ? selectedImages[value] : normalImages[value];
  }
}
