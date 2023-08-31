class CategoryModel {
  String title = "";
  String title_en = "";
  String desc = "";
  int index = 0;

  CategoryModel(
      {required this.title,
      required this.desc,
      required this.index,
      required this.title_en});

  factory CategoryModel.fromJson(Map<String, dynamic> map) {
    return CategoryModel(
        title: map['title'] ?? "",
        title_en: map['title_en'] ?? map['title'] ?? "",
        desc: map['desc'] ?? "",
        index: map['index'] ?? 0);
  }

  @override
  String toString() {
    return 'CategoryModel{title: $title, desc: $desc, index: $index}';
  }
}
