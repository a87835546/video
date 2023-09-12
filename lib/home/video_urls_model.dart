class VideoUrlsModel {
  int id = 0;
  int videoId = 0;
  String title = "";
  String url = "";

  VideoUrlsModel(
      {required this.id,
      required this.videoId,
      required this.title,
      required this.url});

  factory VideoUrlsModel.fromJson(Map<String, dynamic> map) {
    return VideoUrlsModel(
        id: map["id"],
        videoId: map["video_id"],
        title: map["title"],
        url: map["url"]);
  }

  @override
  String toString() {
    return 'VideoUrlsModel{id: $id, videoId: $videoId, title: $title, url: $url}';
  }
}
