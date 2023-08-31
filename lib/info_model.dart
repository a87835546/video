import 'package:flutter/cupertino.dart';

import 'mine/changge_language.dart';

class InfoModel extends ChangeNotifier {
  String language = "";
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
        language: map['language'] ?? "",
        password: map['password'] ?? "",
        locale: Locale(map['language'] ?? "en"),
        username: map['username'] ?? '');
  }
  Map toJson() =>
      {'language': language, 'password': password, 'username': username};
}
