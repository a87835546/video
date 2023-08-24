import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:video/home/home_request.dart';

import '../generated/l10n.dart';
import 'home_banner_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    var list = getMenu();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
            title: Container(
          width: MediaQuery.of(context).size.width,
          // color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 弹性容器布局
              Expanded(
                  child: TabBar(
                // 多个标签时滚动加载
                isScrollable: true,
                // 标签指示器的颜色
                indicatorColor: Colors.red,
                // 标签的颜色
                labelColor: Colors.black,
                // 未选中标签的颜色
                unselectedLabelColor: Colors.white,
                // 指示器的大小
                indicatorSize: TabBarIndicatorSize.label,
                // 指示器的权重，即线条高度
                indicatorWeight: 4.0,

                tabs: [
                  Tab(text: S.of(context).movie),
                  Tab(text: S.of(context).series),
                  Tab(text: S.of(context).animation),
                  Tab(text: S.of(context).variety),
                  Tab(text: S.of(context).pron),
                ],
              )),
            ],
          ),
        ) // backgroundColor: Colors.redAccent,
            ),
        body: const TabBarView(
          children: [
            HomeBanner(
              type: 0,
            ),
            HomeBanner(
              type: 1,
            ),
            HomeBanner(
              type: 2,
            ),
            HomeBanner(
              type: 3,
            ),
            HomeBanner(
              type: 4,
            ),
          ],
        ),
      ),
    );
  }
}