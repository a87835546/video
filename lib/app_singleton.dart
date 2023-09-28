import 'package:flutter/cupertino.dart';
import 'package:video/mine/user_model.dart';

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
  UserModel? userModel;
  static DevMode? devMode;
  static bool? isWeb;
  static PageController? pageController;
  static int index = 0;
}
