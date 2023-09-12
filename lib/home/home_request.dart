import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:video/home/menu_model.dart';
import 'package:video/home/video_model.dart';

import '../utils/http_manager.dart';
import 'home_model.dart';

Future<List<MenuModel>> getMenu() async {
  EasyLoading.showProgress(1);
  var result = await HttpManager.get(url: "menu/list");
  try {
    if (result["code"] == 200) {
      EasyLoading.dismiss();
      // log("menu list $result");
      List<MenuModel> list = [];
      List<dynamic> data = result["data"];
      data.asMap().forEach((key, value) {
        list.add(MenuModel.fromJson(value));
      });
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

Future<HomeModel?> getVideos(int id) async {
  EasyLoading.showProgress(1);
  var result =
      await HttpManager.get(url: "videos/queryList", params: {"menu_id": id});
  try {
    if (result["code"] == 200) {
      EasyLoading.dismiss();
      Map<String, dynamic> data = result["data"];
      HomeModel model = HomeModel.fromJson(data);
      return Future.value(model);
    } else {
      EasyLoading.showError(result["message"] ?? "Delete Account Error");
      return Future.value(null);
    }
  } catch (err) {
    log("parser get video list fail ${err.toString()}");
    return Future.value(null);
  } finally {
    EasyLoading.dismiss();
  }
}

Future<VideoModel?> getVideosById(num id) async {
  EasyLoading.showProgress(1);
  var result =
      await HttpManager.get(url: "videos/queryById", params: {"id": id});
  try {
    if (result["code"] == 200) {
      EasyLoading.dismiss();
      Map<String, dynamic> data = result["data"];
      VideoModel model = VideoModel.fromJson(data);
      return Future.value(model);
    } else {
      EasyLoading.showError(result["message"] ?? "Delete Account Error");
      return Future.value(null);
    }
  } catch (err) {
    log("parser get video list fail ${err.toString()}");
    return Future.value(null);
  } finally {
    EasyLoading.dismiss();
  }
}

// 根据当前用户的主演查询其他电影
Future<List<VideoModel>> getVideosByName(String id) async {
  EasyLoading.showProgress(1);
  var result =
      await HttpManager.get(url: "videos/queryByActor", params: {"name": id});
  try {
    if (result["code"] == 200) {
      EasyLoading.dismiss();
      List<dynamic> data = result["data"];
      List<VideoModel> temp = [];
      for (int i = 0; i < data.length; i++) {
        VideoModel model = VideoModel.fromJson(data[i]);
        temp.add(model);
      }
      return Future.value(temp);
    } else {
      EasyLoading.showError(result["message"] ?? "Delete Account Error");
      return Future.value([]);
    }
  } catch (err) {
    log("parser get video list fail ${err.toString()}");
    return Future.value([]);
  } finally {
    EasyLoading.dismiss();
  }
}

Future<bool> watchRequest(num vid, uid) async {
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
    log("parser update  watch  video id fail ${err.toString()}");
    return Future.value(false);
  } finally {
    EasyLoading.dismiss();
  }
}
