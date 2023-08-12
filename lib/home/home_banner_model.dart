class HomeBannerModel {
  String? url;
  String? title;
  String? menu;
  String? public;
  num rate = 0;
  num duration = 100;
  num type = 0;
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
    return "$hour小时$min分";
  }

  String newDuration() {
    num hour = duration ~/ 60;
    num min = duration % 60;
    return "$hour小时$min分";
  }

  String newPublic() {
    num hour = duration ~/ 60;
    num min = duration % 60;
    return "$hour小时$min分";
  }
}
