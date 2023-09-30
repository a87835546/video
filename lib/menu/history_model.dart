class HistoryModel {
  num uid = 0;
  num vid = 0;
  String author = "";
  num duration = 0;
  String rate = "";
  num years = 0;
  String title = "";
  String url = "";
  String actor = "";
  String themeUrl = "";

  factory HistoryModel.fromJson(Map<String, dynamic> map) {
    var model = HistoryModel();
    model.uid = map["user_id"];
    model.vid = map["video_id"];
    model.author = map["author"];
    model.duration = map["duration"];
    model.rate = map["rate"];
    model.years = map["years"];
    model.title = map["title"];
    model.actor = map["actor"];
    model.themeUrl = map["theme_url"];
    model.url = map["url"];
    return model;
  }

  HistoryModel();
}
