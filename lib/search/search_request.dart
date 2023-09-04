import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../home/video_model.dart';
import '../utils/http_manager.dart';

Future<List<VideoModel>> searchVideos(String title) async {
  EasyLoading.showProgress(1);
  var result =
      await HttpManager.post(url: "videos/search", params: {"name": title});
  try {
    if (result["code"] == 200) {
      EasyLoading.dismiss();
      List<VideoModel> list = [];
      List<dynamic> data = result["data"];
      data.asMap().forEach((key, value) {
        list.add(VideoModel.fromJson(value));
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
