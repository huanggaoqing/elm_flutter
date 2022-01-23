// ignore_for_file: unused_local_variable

import 'package:flutterapp/request/dio.dart';

class SearchServices {
  static Future searchList(Map<String, dynamic> params) async {
    final res = await Request().dio.get("/v4/restaurants", queryParameters: params);
    return res;
  }
}