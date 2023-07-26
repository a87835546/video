class InfoModel {
  String language = "en";
  String username = "";
  String password = "";

  InfoModel(
      {required this.language, required this.username, required this.password});

  factory InfoModel.fromJson(Map<String, dynamic> map) {
    return InfoModel(
        language: map['language'] ?? "en",
        password: map['password'] ?? "",
        username: map['username'] ?? '');
  }
}
