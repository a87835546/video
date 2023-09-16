import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video/home/home_request.dart';

import '../app_singleton.dart';
import '../generated/l10n.dart';
import 'home_banner_widget.dart';
import 'home_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  List<Tab> tabs = [];
  List<HomeBanner> views = [];
  HomeModel? defaultModel;

  @override
  void initState() {
    log("home page initState");
    super.initState();
    Future.delayed(Duration.zero, () {
      getDefaultData();
      getData();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getData();
  }

  void getDefaultData() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? val = _prefs.getString("videos/queryList?menu_id=1");
    if (val != null) {
      Map<String, dynamic> data = json.decode(val);
      HomeModel model = HomeModel.fromJson(data);
      setState(() {
        defaultModel = model;
      });
    }
  }

  void getData() async {
    if (mounted) {
      setState(() {
        tabs = [
          Tab(text: S.of(context).movie),
          Tab(text: S.of(context).series),
          Tab(text: S.of(context).animation),
          Tab(text: S.of(context).variety),
          Tab(text: S.of(context).pron),
        ];
        views = [
          HomeBanner(type: 1, title: S.of(context).movie),
          HomeBanner(type: 2, title: S.of(context).series),
          HomeBanner(type: 3, title: S.of(context).animation),
          HomeBanner(type: 4, title: S.of(context).variety),
          HomeBanner(type: 5, title: S.of(context).pron),
        ];
      });
    }
    var list = await getMenu();
    if (list.isEmpty && mounted) {
      setState(() {
        tabs = [
          Tab(text: S.of(context).movie),
          Tab(text: S.of(context).series),
          Tab(text: S.of(context).animation),
          Tab(text: S.of(context).variety),
          Tab(text: S.of(context).pron),
        ];
        views = [
          HomeBanner(type: 1, title: S.of(context).movie),
          HomeBanner(type: 2, title: S.of(context).series),
          HomeBanner(type: 3, title: S.of(context).animation),
          HomeBanner(type: 4, title: S.of(context).variety),
          HomeBanner(type: 5, title: S.of(context).pron),
        ];
      });
    } else {
      List<Tab> temp = [];
      List<HomeBanner> temp1 = [];
      for (var element in list) {
        log("element -->> $element");
        temp.add(Tab(
            text:
                AppSingleton.singleton?.info?.locale == const Locale("en", "US")
                    ? element.title_en
                    : element.title));
        var h = HomeBanner(type: element.id, title: element.title);
        if (h.type == 1) {
          h = HomeBanner(
              type: element.id, title: element.title, model: defaultModel);
        }
        temp1.add(h);
      }
      setState(() {
        tabs = temp;
        views = temp1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
            title: SizedBox(
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
                indicatorColor: Theme.of(context).primaryColor,
                // 标签的颜色
                labelColor: Theme.of(context).primaryColor,
                // 未选中标签的颜色
                unselectedLabelColor: Theme.of(context).primaryColorDark,
                // 指示器的大小
                indicatorSize: TabBarIndicatorSize.label,
                // 指示器的权重，即线条高度
                indicatorWeight: 4.0,

                tabs: tabs,
              )),
            ],
          ),
        ) // backgroundColor: Colors.redAccent,
            ),
        body: TabBarView(
          children: views,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
