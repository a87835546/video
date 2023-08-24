import 'info_model.dart';

enum DevMode { local, staging, product }

class AppSingleton {
  static AppSingleton? singleton;
  AppSingleton._internal();

  static AppSingleton getInstance() {
    singleton ??= AppSingleton._internal();
    return singleton!;
  }

  InfoModel? info;
  static DevMode? devMode;
}
