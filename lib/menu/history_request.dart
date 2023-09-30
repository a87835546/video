import 'dart:convert';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video/app_singleton.dart';

import '../utils/http_manager.dart';
import 'history_model.dart';

Future<List<HistoryModel>> getWatchList() async {
  EasyLoading.showProgress(1);
  var result = await HttpManager.get(
      url:
          "watch/list?user_id=${AppSingleton.getInstance().userModel?.id ?? 3}");
  try {
    if (result["code"] == 200) {
      EasyLoading.dismiss();
      List<HistoryModel> list = [];
      List<dynamic> data = result["data"];
      data.asMap().forEach((key, value) {
        list.add(HistoryModel.fromJson(value));
      });
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var val = await _prefs.setString("watch/list", jsonEncode(data));
      return Future.value(list);
    } else {
      EasyLoading.showError(result["message"] ?? "Delete Account Error");
      return Future.value([]);
    }
  } catch (err) {
    log("parser get menu list fail ${err.toString()}");
    return Future.value([]);
  } finally {
    EasyLoading.dismiss();
  }
}
