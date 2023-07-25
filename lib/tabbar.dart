import 'package:flutter/material.dart';
import 'package:pets_care/care.dart';
import 'package:pets_care/community.dart';
import 'package:pets_care/healthy.dart';
import 'package:pets_care/home.dart';
import 'package:pets_care/mine.dart';

import 'appbar.dart';


class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<StatefulWidget> createState() => _NavbarPageState();
}

class _NavbarPageState extends State<CustomBottomNavigationBar> {
  int page = 1;

  PageController pageController = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.redAccent,
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: onPageChanged,
          children: const [
            HealthyPage(),
            HomePage(),
            CarePage(),
            CommunityPage(),
            MinePage()
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        child: AppTabBar(bottom: MediaQuery.of(context).padding.bottom,click: (index){
          setState(() {
            page = index;
          });
          pageController.jumpToPage(page);
        },),
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