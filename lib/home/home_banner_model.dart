class HomeBannerModel {
  String? url;
  String? title;
  String? menu;
  String? public;
  num rate = 0;
  num duration = 100;
  List<String>? type = [];
  bool isFavor = false;

  HomeBannerModel({
    this.url,
    this.title,
    this.public,
    this.menu,
    required this.rate,
    required this.duration,
    required this.type,
    required this.isFavor,
  });

  factory HomeBannerModel.fromJson(Map<String, dynamic> map) {
    return HomeBannerModel(
        url: map['url'] ?? "en",
        title: map['title'] ?? "",
        menu: map['menu'] ?? "",
        public: "",
        rate: map["rate"] ?? 0,
        duration: map["duration"] ?? 0,
        type: map["type"] ?? 0,
        isFavor: map["favor"] ?? 0);
  }
  static String getDuration(num d) {
    num hour = d ~/ 60;
    num min = d % 60;
    if (min > 0) {
      return "$hour小时$min分";
    } else {
      return "$hour小时";
    }
  }

  String newDuration() {
    num hour = duration ~/ 60;
    num min = duration % 60;
    if (min > 0) {
      return "$hour小时$min分";
    } else {
      return "$hour小时";
    }
  }

  String newType() {
    return "动作  剧情";
  }

  @override
  String toString() {
    return 'HomeBannerModel{url: $url, title: $title, menu: $menu, public: $public, rate: $rate, duration: $duration, type: $type, isFavor: $isFavor}';
  }
}
