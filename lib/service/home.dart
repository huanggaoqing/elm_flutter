import 'package:flutterapp/request/dio.dart';

class HomeService {
  static Future getPoint(String point) async {
    final res = await Request().dio.get("/v2/pois/" + point);
    return res;
  }

  static Future getGroupList(Map<String, dynamic> params) async {
    final res =
        await Request().dio.get("/v2/index_entry", queryParameters: params);
    return res;
  }

  static Future getCommodity(Map<String, dynamic> params) async {
    final res = await Request().dio.get("/shopping/restaurants", queryParameters: params);
    return res;
  }
}
