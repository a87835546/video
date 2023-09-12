import 'dart:developer';

import 'package:video/home/video_urls_model.dart';

class VideoModel {
  num id = 0;
  String url = "";
  List<VideoUrlsModel> urls = [];
  String title = "";
  String menuTitle = "";
  String desc = "";
  String categoryId = "";
  String author = "";
  String actor = "";
  String themeUrl = "";
  String types = "";
  String rate = "";
  num years = 0;

  VideoModel(
      {required this.title,
      required this.desc,
      required this.id,
      required this.categoryId,
      required this.author,
      required this.themeUrl,
      required this.types,
      required this.rate,
      required this.actor,
      required this.menuTitle,
      required this.years,
      required this.url});

  factory VideoModel.fromJson(Map<String, dynamic> map) {
    List<VideoUrlsModel> temp = [];
    if (map["urls"] != null) {
      List<dynamic> list = map["urls"];
      for (int i = 0; i < list.length; i++) {
        temp.add(VideoUrlsModel.fromJson(list[i]));
      }
    }
    VideoModel model = VideoModel(
        title: map['title'] ?? "",
        id: map['id'],
        desc: map['desc'] ?? "",
        rate: map['rate'] ?? "",
        years: map['years'] ?? "",
        actor: map['actor'] ?? "",
        menuTitle: map['menu_title'] ?? "",
        categoryId: map['category_id'] ?? "",
        author: map['author'] ?? "",
        themeUrl: map['theme_url'] ?? "",
        types: map['types'] ?? "",
        url: map['url']);
    model.urls = temp;
    return model;
  }

  @override
  String toString() {
    return 'VideoModel{id: $id, url: $url, urls: $urls, title: $title, menuTitle: $menuTitle, desc: $desc, categoryId: $categoryId, author: $author, actor: $actor, themeUrl: $themeUrl, types: $types, rate: $rate, years: $years}';
  }
}

class HomeVideosModel {
  String type;
  List<VideoModel> list;

  HomeVideosModel({required this.type, required this.list});

  factory HomeVideosModel.fromJson(Map<String, dynamic> map) {
    List<VideoModel> temp = [];
    if (map["list"] != null) {
      List<dynamic> videos = map["list"];
      for (int i = 0; i < videos.length; i++) {
        Map<String, dynamic> map = videos[i];
        VideoModel video = VideoModel.fromJson(map);
        temp.add(video);
      }
    }
    return HomeVideosModel(type: map["type"], list: temp);
  }

  @override
  String toString() {
    return 'HomeVideosModel{type: $type, list: ${list.toString()}';
  }
}
