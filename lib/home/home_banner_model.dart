class HomeBannerModel {
  String title = "";
  String desc = "";
  String actor = "";
  String types = "";
  String rate = "";
  dynamic years = "2023";
  String menuTitle = "";
  int id;
  String videoUrl = "";
  String videoThemeUrl = "";
  int menuId;
  int videoId;
  bool isFavorite = false;
  HomeBannerModel(
      {required this.title,
      required this.desc,
      required this.id,
      required this.menuId,
      required this.videoThemeUrl,
      required this.videoUrl,
      required this.videoId});

  factory HomeBannerModel.fromJson(Map<String, dynamic> map) {
    HomeBannerModel model = HomeBannerModel(
        title: map['title'] ?? "",
        desc: map['desc'] ?? "",
        id: map['id'],
        menuId: map['menu_id'],
        videoId: map['video_id'],
        videoThemeUrl: map["video_theme_url"],
        videoUrl: map["video_url"]);
    model.actor = map["actor"];
    model.years = map["years"];
    model.rate = map["rate"];
    model.types = map["types"];
    model.menuTitle = map["menu_title"];
    model.isFavorite = map["is_favorite"] ?? false;
    return model;
  }

  @override
  String toString() {
    return 'HomeBannerModel{title: $title, desc: $desc, actor: $actor, types: $types, rate: $rate, years: $years, menuTitle: $menuTitle, id: $id, videoUrl: $videoUrl, videoThemeUrl: $videoThemeUrl, menuId: $menuId, videoId: $videoId}';
  }
}
