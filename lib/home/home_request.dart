import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:video/home/category_model.dart';

import '../utils/http_manager.dart';

Future<List<CategoryModel>> getMenu({int? id}) async {
  EasyLoading.showProgress(1);
  var result =
      await HttpManager.post(url: "category/list", params: {"id": id ?? 0});
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
