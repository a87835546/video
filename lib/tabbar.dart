import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:video/app_singleton.dart';
import 'package:video/menu/menu_page.dart';
import 'package:video/search/light_search_default_page/light_search_default_page.dart';
import 'package:video/search/search_page.dart';

import 'appbar.dart';
import 'home/home.dart';
import 'menu/no_watchlist_page.dart';
import 'mine/mine.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<StatefulWidget> createState() => _NavbarPageState();
}

class _NavbarPageState extends State<CustomBottomNavigationBar> {
  int page = 0;

  PageController pageController = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
    AppSingleton.pageController = pageController;
  }

  @override
  void didUpdateWidget(covariant CustomBottomNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    log("didUpdateWidget");
  }

  @override
  Widget build(BuildContext context) {
    AppSingleton.pageController = pageController;
    return Scaffold(
      body: Container(
        color: Colors.redAccent,
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: onPageChanged,
          children: const [
            HomePage(),
            NoWatchlistPage(),
            LightSearchDefaultPage(),
            MinePage()
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        child: AppTabBar(
          bottom: MediaQuery.of(context).padding.bottom,
          context: context,
          click: (index) {
            log("index-->>> ${index}");
            setState(() {
              page = index;
            });
            pageController.jumpToPage(page);
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int page) {
    pageController.jumpToPage(page);
  }
}
