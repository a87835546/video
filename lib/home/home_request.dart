import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../app_singleton.dart';
import '../utils/http_manager.dart';

Future getMenu() async {
  EasyLoading.showProgress(1);
  var result = await HttpManager.get(url: "menu/list");
  log("get menu list result $result");
  try {
    if (result["code"] == 200) {
      EasyLoading.dismiss();
      return Future.value(true);
    } else {
      EasyLoading.showError(result["message"] ?? "Delete Account Error");
      return Future.value(false);
    }
  } catch (err) {
    log("parser delete account fail ${err.toString()}");
    return Future.value(false);
  } finally {
    EasyLoading.dismiss();
  }
}
