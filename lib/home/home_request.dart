import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:video/home/category_model.dart';

import '../utils/http_manager.dart';

Future<List<CategoryModel>> getMenu() async {
  EasyLoading.showProgress(1);
  var result = await HttpManager.get(url: "menu/list");
  try {
    if (result["code"] == 200) {
      EasyLoading.dismiss();
      List<CategoryModel> list = [];
      List<dynamic> data = result["data"];
      data.asMap().forEach((key, value) {
        list.add(CategoryModel.fromJson(value));
      });
      return Future.value(list);
    } else {
      EasyLoading.showError(result["message"] ?? "Delete Account Error");
      return Future.value([]);
    }
  } catch (err) {
    log("parser delete account fail ${err.toString()}");
    return Future.value([]);
  } finally {
    EasyLoading.dismiss();
  }
}

Future<List<CategoryModel>> getSubMenu(int id) async {
  EasyLoading.showProgress(1);
  var result = await HttpManager.get(url: "menu/sub", params: {"id": id ?? 0});
  try {
    if (result["code"] == 200) {
      EasyLoading.dismiss();
      List<CategoryModel> list = [];
      List<dynamic> data = result["data"];
      data.asMap().forEach((key, value) {
        list.add(CategoryModel.fromJson(value));
      });
      return Future.value(list);
    } else {
      EasyLoading.showError(result["message"] ?? "Delete Account Error");
      return Future.value([]);
    }
  } catch (err) {
    log("parser delete account fail ${err.toString()}");
    return Future.value([]);
  } finally {
    EasyLoading.dismiss();
  }
}

Future<bool> watch(int vid, uid) async {
  EasyLoading.showProgress(1);
  var result = await HttpManager.get(
      url: "videos/click", params: {"user_id": "$uid", "video_id": "$vid"});
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
