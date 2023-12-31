import 'package:video/home/video_urls_model.dart';

class VideoModel {
  num id = 0;
  String url = "";
  List<VideoUrlsModel> urls = [];
  String title = "";
  String menuTitle = "";
  String desc = "";
  num categoryId = 0;
  String author = "";
  String actor = "";
  String themeUrl = "";
  String types = "";
  String rate = "";
  dynamic years = "0";

  VideoModel(
      {required this.title,
      required this.desc,
      required this.id,
      required this.themeUrl,
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
        themeUrl: map['theme_url'] ?? "",
        url: map['url']);
    model.urls = temp;
    model.types = map['types'] ?? "";
    model.rate = map['rate'] ?? "";
    model.years = map['years'] ?? "";
    model.actor = map['actor'] ?? "";
    model.menuTitle = map['menu_title'] ?? "";
    model.author = map['author'] ?? "";
    model.categoryId = map['category_id'] ?? "";
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
