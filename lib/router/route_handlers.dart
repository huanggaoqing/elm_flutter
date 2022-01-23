// ignore_for_file: unused_import, unnecessary_new, prefer_const_constructors, avoid_print

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/entity/cityEntity.dart';
import 'package:flutterapp/page/cityDetail/cityDetail.dart';
import 'package:flutterapp/page/cityList/cityList.dart';
import 'package:flutterapp/page/empty/empty.dart';
import 'package:flutterapp/page/home/home.dart';
import 'package:flutterapp/page/tabbar/tabbar.dart';

// 城市列表页
Handler cityListHandle = new Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return CityList();
  },
);

// 地点搜索页
Handler cityDetailHandle = new Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    // ignore: todo
    // TODO 通过 routerSettings 传递的参数需要通过 context!.settings!.arguments 接收
    return CityDetail(context!.settings!.arguments as CityEntity);
  },
);

// tabBar 页
Handler tabBarHandle = new Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return TabBarElm();
  },
);

// 404 页
Widget? emptyHandler(BuildContext? context, Map<String, List<String>> params) {
  return Empty();
}
