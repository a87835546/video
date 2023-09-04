class VideoModel {
  num id = 0;
  String url = "";
  String title = "";
  String desc = "";
  String categoryId = "";
  String author = "";
  String themeUrl = "";
  String types = "";

  VideoModel(
      {required this.title,
      required this.desc,
      required this.id,
      required this.categoryId,
      required this.author,
      required this.themeUrl,
      required this.types,
      required this.url});

  factory VideoModel.fromJson(Map<String, dynamic> map) {
    return VideoModel(
        title: map['title'] ?? "",
        id: map['id'],
        desc: map['desc'] ?? "",
        categoryId: map['category_id'] ?? "",
        author: map['author'] ?? "",
        themeUrl: map['theme_url'] ?? "",
        types: map['types'] ?? "",
        url: map['url']);
  }

  @override
  String toString() {
    return 'VideoModel{id: $id, url: $url, title: $title, desc: $desc, categoryId: $categoryId, author: $author, themeUrl: $themeUrl, types: $types}';
  }
}
