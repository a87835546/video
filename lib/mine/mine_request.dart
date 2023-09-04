import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:video/mine/user_model.dart';

import '../utils/http_manager.dart';

Future<UserModel> login(String username, password) async {
  EasyLoading.showProgress(1);
  var result = await HttpManager.post(
      url: "user/login", params: {"username": username, "password": password});
  try {
    log("login result--->>>$result");
    if (result["code"] == 200) {
      EasyLoading.dismiss();
      Map<String, dynamic> data = result["data"];
      UserModel userModel = UserModel.fromJson(data);
      return Future.value(userModel);
    } else {
      EasyLoading.showError(result["message"] ?? "Delete Account Error");
      return Future.value();
    }
  } catch (err) {
    log("parser delete account fail ${err.toString()}");
    return Future.value();
  } finally {
    EasyLoading.dismiss();
  }
}

Future<UserModel> register(String username, password, birthday) async {
  EasyLoading.showProgress(1);
  var result = await HttpManager.post(url: "user/register", params: {
    "username": username,
    "password": password,
    "device_type": 1,
    "birthday": birthday
  });
  try {
    if (result["code"] == 200) {
      EasyLoading.dismiss();
      Map<String, dynamic> data = result["data"];
      UserModel userModel = UserModel.fromJson(data);
      return Future.value(userModel);
    } else {
      EasyLoading.showError(result["message"] ?? "Delete Account Error");
      return Future.value();
    }
  } catch (err) {
    log("parser delete account fail ${err.toString()}");
    return Future.value();
  } finally {
    EasyLoading.dismiss();
  }
}