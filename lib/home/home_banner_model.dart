class HomeBannerModel {
  String title = "";
  String desc = "";
  int id;
  String videoUrl = "";
  String videoThemeUrl = "";
  int menuId;
  int videoId;
  HomeBannerModel(
      {required this.title,
      required this.desc,
      required this.id,
      required this.menuId,
      required this.videoThemeUrl,
      required this.videoUrl,
      required this.videoId});

  factory HomeBannerModel.fromJson(Map<String, dynamic> map) {
    return HomeBannerModel(
        title: map['title'] ?? "",
        desc: map['desc'] ?? "",
        id: map['id'],
        menuId: map['menu_id'],
        videoId: map['video_id'],
        videoThemeUrl: map["video_theme_url"],
        videoUrl: map["video_url"]);
  }

  @override
  String toString() {
    return 'HomeBannerModel{title: $title, desc: $desc, id: $id, videoUrl: $videoUrl, videoThemeUrl: $videoThemeUrl, menuId: $menuId, videoId: $videoId}';
  }
}
