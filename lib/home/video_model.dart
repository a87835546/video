import 'dart:developer';

class VideoModel {
  num id = 0;
  String url = "";
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
    return VideoModel(
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
  }

  @override
  String toString() {
    return 'VideoModel{id: $id, url: $url, title: $title, desc: $desc, categoryId: $categoryId, author: $author, themeUrl: $themeUrl, types: $types, rate: $rate, years: $years}';
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
