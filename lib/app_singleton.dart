import 'package:pets_care/info_model.dart';

class AppSingleton {
  static AppSingleton? singleton;
  AppSingleton._internal();

  static AppSingleton getInstance() {
    if (singleton == null) {
      singleton = AppSingleton._internal();
    }
    return singleton!;
  }

  InfoModel? info;
}
