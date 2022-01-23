// ignore_for_file: file_names, prefer_const_constructors_in_immutables, must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, prefer_contains, unnecessary_new, deprecated_member_use

import 'dart:convert';
import "package:flutter/material.dart";
import 'package:flutterapp/constant/strings.dart';
import 'package:flutterapp/entity/cityDetailEntity.dart';
import 'package:flutterapp/entity/cityEntity.dart';
import 'package:flutterapp/page/cityDetail/widget/search.dart';
import 'package:flutterapp/page/cityDetail/widget/searchList.dart';
import 'package:flutterapp/provider/point.dart';
import 'package:flutterapp/router/application.dart';
import 'package:flutterapp/router/routes.dart';
import 'package:flutterapp/service/city.dart';
import 'package:flutterapp/util/storeUtil.dart';
import 'package:flutterapp/util/toastUtil.dart';
import 'package:provider/provider.dart';

class CityDetail extends StatefulWidget {
  CityDetail(this.city, {Key? key}) : super(key: key);
  CityEntity city;
  @override
  _CityDetailState createState() => _CityDetailState();
}

class _CityDetailState extends State<CityDetail> {
  // 搜索内容
  List<CityDetailEntity> cityDetailList = [];

  // 存储方法
  StoreUtil prefs = new StoreUtil();

  @override
  void initState() {
    super.initState();
  }

  // 搜索方法
  void handleSearch(String keyWord) async {
    if (keyWord.isEmpty) {
      ToastUtil.showToast("搜索内容不能为空");
      return;
    }
    final res = await CityServices.getCityDetail(widget.city.id, keyWord);
    setState(() => cityDetailList =
        CityDetailListEntity.fromJson(res.data).cityDetailList);
  }

  // 搜索列表每项点击的方法
  void handleItemClick(BuildContext context, CityDetailEntity item) async {
    print("【点击的地点项】：$item");
    List<String> history =
        prefs.getStore<List<String>>(Strings.ELM_APP_SEARCH_HISTORY) ?? [];
    String data = json.encode(item.toJson(item));
    if (history.indexOf(data) == -1) {
      history.add(data);
      await prefs.setStore(Strings.ELM_APP_SEARCH_HISTORY, history);
    }
    Provider.of<Point>(context, listen: false)
        .setPoint([item.latitude, item.longitude].join(","));
    Application.router
        .navigateTo(context, Routes.getPath("tabBar"), clearStack: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFEEEEEE),
        appBar: AppBar(
          title: Text(widget.city.name),
          centerTitle: true,
          actions: [
            FlatButton(
                child: Text(
                  "切换城市",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Application.router.pop(context);
                })
          ],
        ),
        body: ListView(
          children: [
            Search(handleSearch),
            SearchList(cityDetailList, handleItemClick)
          ],
        ));
  }
}
