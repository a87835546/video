class MenuModel {
  String title = "";
  String title_en = "";
  String desc = "";
  int id;

  MenuModel(
      {required this.title,
      required this.desc,
      required this.id,
      required this.title_en});

  factory MenuModel.fromJson(Map<String, dynamic> map) {
    return MenuModel(
        title: map['title'] ?? "",
        title_en: map['title_en'] ?? map['title'] ?? "",
        desc: map['desc'] ?? "",
        id: map['id']);
  }
  Map toJson() {
    return {"title": title, "title_en": title_en, "desc": desc, "id": id};
  }

  @override
  String toString() {
    return 'MenuModel{title: $title, desc: $desc, id: $id}';
  }
}
