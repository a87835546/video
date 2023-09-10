import 'package:video/home/home_banner_model.dart';
import 'package:video/home/video_model.dart';

class HomeModel {
  List<HomeVideosModel> videoModel;
  List<HomeBannerModel> bannerModel;
  HomeModel({required this.videoModel, required this.bannerModel});

  factory HomeModel.fromJson(Map<String, dynamic> map) {
    List<HomeVideosModel> temp = [];
    if (map["videos"] != null) {
      List<dynamic> videos = map["videos"];
      for (int i = 0; i < videos.length; i++) {
        Map<String, dynamic> map1 = videos[i];
        HomeVideosModel video = HomeVideosModel.fromJson(map1);
        temp.add(video);
      }
    }

    List<HomeBannerModel> temp1 = [];
    if (map["banner"] != null) {
      List<dynamic> banner = map["banner"];
      for (int i = 0; i < banner.length; i++) {
        Map<String, dynamic> map1 = banner[i];
        HomeBannerModel video = HomeBannerModel.fromJson(map1);
        temp1.add(video);
      }
    }
    return HomeModel(videoModel: temp, bannerModel: temp1);
  }

  @override
  String toString() {
    return 'HomeModel{videoModel: ${videoModel.toString()}, bannerModel: ${bannerModel.toString()}';
  }
}
