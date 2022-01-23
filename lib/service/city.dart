// ignore_for_file: file_names, avoid_print

import 'package:flutterapp/request/dio.dart';

class CityServices {
  // 获取城市接口
  static Future getCityList(String type) async {
    final res = await Request().dio.get(
      "/v1/cities",
      queryParameters: {"type": type},
    );
    print("【查看城市返回数据】：$res");
    return res;
  }
  // 搜索地点接口
  static Future getCityDetail(int cityId, String keyWord) async {
    final res = await Request().dio.get(
      "/v1/pois",
      queryParameters: {
        "city_id": cityId,
        "keyword": keyWord,
        "type": "search"
      }
    );
     print("【查看搜索地点返回数据】：$res");
    return res;
  }
}
