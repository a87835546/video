import 'package:flutter/cupertino.dart';

class InfoModel extends ChangeNotifier {
  String language = "en";
  String username = "";
  String password = "";
  Locale? locale;

  InfoModel(
      {required this.language,
      required this.username,
      required this.password,
      this.locale});

  factory InfoModel.fromJson(Map<String, dynamic> map) {
    return InfoModel(
        language: map['language'] ?? "en",
        password: map['password'] ?? "",
        locale: Locale(map['language'] ?? "en"),
        username: map['username'] ?? '');
  }
}
