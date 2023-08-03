import 'dart:developer';

import 'package:flutter/material.dart';

import 'appbar.dart';
import 'care.dart';
import 'healthy.dart';
import 'home.dart';
import 'mine/mine.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<StatefulWidget> createState() => _NavbarPageState();
}

class _NavbarPageState extends State<CustomBottomNavigationBar> {
  int page = 1;

  PageController pageController = PageController(initialPage: 1);
  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CustomBottomNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    log("didUpdateWidget");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.redAccent,
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: onPageChanged,
          children: const [HealthyPage(), HomePage(), CarePage(), MinePage()],
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
