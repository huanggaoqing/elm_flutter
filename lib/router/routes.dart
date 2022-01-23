// ignore_for_file: non_constant_identifier_names, unnecessary_new, avoid_function_literals_in_foreach_calls, unused_local_variable, avoid_print, unused_import, prefer_const_constructors

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/entity/routesEntity.dart';
import 'package:flutterapp/router/route_handlers.dart';

class Routes {
  // 路由表
  static final List<RoutesClass> _routes = [
    new RoutesClass("cityList", "/", cityListHandle),
    new RoutesClass("cityDetail", "/cityDetail", cityDetailHandle),
    new RoutesClass("tabBar", "/tabBar", tabBarHandle)
  ];

  // 通过 name 获取对应的 path ，用于路由的跳转
  static String getPath(String name) {
    Iterable<RoutesClass> currentPath = _routes.where((RoutesClass route) => route.name == name);
    if (currentPath.isNotEmpty) {
      return currentPath.first.path;
    } else {
      print("Not Found");
      return "/404";
    }
  }

  // 注册路由
  static void configureRoutes(FluroRouter router) {
    _routes.forEach((RoutesClass route) {
      router.define(route.path, handler: route.handler);
    });
    router.notFoundHandler = new Handler(handlerFunc: emptyHandler);
  }
}
