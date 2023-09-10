import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video/home/home_banner_model.dart';
import 'package:video/home/video_model.dart';
import '../utils/fonts.dart';
import 'home_hot_banner_widget.dart';

class HomeListWidget extends StatefulWidget {
  final String menu;
  final List<VideoModel> list;

  const HomeListWidget({super.key, required this.list, required this.menu});

  @override
  State<StatefulWidget> createState() {
    return _HomeListWidgetState();
  }
}

class _HomeListWidgetState extends State<HomeListWidget> {
  @override
  Widget build(BuildContext context) {
    log("length --->>>${widget.list.length}");
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: HomeBannerTopView(
            menu: widget.menu,
            clickMore: () {
              log("click action films view more");
            },
          ),
        ),
        SizedBox(
          height: (widget.list.length / 2).ceil() * 220,
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: (widget.list.length / 2).ceil(),
              itemBuilder: (BuildContext context, int index) {
                List<VideoModel> temp = [];
                if (widget.list.isNotEmpty) {
                  if (widget.list.length > (index + 1) * 2) {
                    temp.add(widget.list[index]);
                    temp.add(widget.list[index + 1]);
                    log("index +1 ");
                  } else if (widget.list.length > index * 2) {
                    if (index + 1 <= widget.list.length) {
                      temp.add(widget.list[index + 1]);
                      log("index  ");
                    }
                  }
                }

                return Container(
                  height: 210,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: ListView.builder(
                    itemCount: temp.length,
                    itemBuilder: (BuildContext context, int index) {
                      VideoModel model = temp[index];
                      return Container(
                        height: 200,
                        padding: const EdgeInsets.only(left: 24, bottom: 0),
                        width: (MediaQuery.of(context).size.width - 24) / 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 167,
                              child: Image.network(
                                model.themeUrl.isNotEmpty
                                    ? model.themeUrl
                                    : "https://k.sinaimg.cn/n/sinacn10111/785/w460h325/20181210/af5d-hphsupy6595023.jpg/w700d1q75cms.jpg",
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                model.title,
                                style: Fonts.subTitle(),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 20,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: double.infinity,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 13.33,
                                          height: 12.67,
                                          child: const Icon(
                                            Icons.star_rate_rounded,
                                            size: 13,
                                            color: Color(0xffffbb38),
                                          ),
                                        ),
                                        Text("${model.rate ?? 8.4}",
                                            style: Fonts.subTitle()),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text("${model.years}",
                                      style: Fonts.subTitle()),
                                  const SizedBox(width: 10),
                                  Text(model.types, style: Fonts.subTitle()),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                );
              }),
        )
      ],
    );
  }
}
