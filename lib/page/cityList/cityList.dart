// ignore_for_file: prefer_const_constructors_in_immutables, file_names, avoid_print, prefer_const_constructors, avoid_unnecessary_containers, unused_local_variable, sized_box_for_whitespace, unnecessary_this, avoid_init_to_null, prefer_const_literals_to_create_immutables, unnecessary_new

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/constant/strings.dart';
import 'package:flutterapp/entity/cityEntity.dart';
import 'package:flutterapp/page/cityList/widget/cityGroup.dart';
import 'package:flutterapp/page/cityList/widget/currentCity.dart';
import 'package:flutterapp/provider/them.dart';
import 'package:flutterapp/router/application.dart';
import 'package:flutterapp/router/routes.dart';
import 'package:flutterapp/service/city.dart';
import 'package:flutterapp/util/storeUtil.dart';
import 'package:provider/provider.dart';

class CityList extends StatefulWidget {
  CityList({Key? key}) : super(key: key);

  @override
  _CityListState createState() => _CityListState();
}

class _CityListState extends State<CityList> {
  // 城市数据
  Map<String, List<CityEntity>> cityMap = {};
  // 当前定位城市
  CityEntity? currentCity;
  // 热门城市
  List<CityEntity> hotCityList = [];

  StoreUtil prefs = new StoreUtil();
  StoreUtil prefs2 = new StoreUtil();
  @override
  void initState() {
    super.initState();
    getCityList();
    getCurrentCityList();
    getHotCityList();
  }

  // 获取城市数据
  void getCityList() async {
    Response res = await CityServices.getCityList("group");
    setState(() {
      cityMap = CityMapEntity.fromJson(res.data).cityMap;
    });
  }

  // 获取当前城市数据
  void getCurrentCityList() async {
    Response res = await CityServices.getCityList("guess");
    setState(() {
      currentCity = CityEntity.fromJson(res.data);
    });
  }

  // 获取热门城市数据
  void getHotCityList() async {
    Response res = await CityServices.getCityList("hot");
    setState(() {
      hotCityList = CityListEntity.fromJson(res.data).cityList;
    });
  }

  // 通过数据创建城市分类模块
  CityGroup createCityGroup(BuildContext context, int idx) {
    List<String> keys = cityMap.keys.toList();
    keys.sort();
    return CityGroup(
      title: keys[idx],
      list: cityMap[keys[idx]] as List<CityEntity>,
      handlePassDetail: handlePassDetail
    );
  }

  // 跳转到城市详情页
  void handlePassDetail(BuildContext context, CityEntity cityItem) async {
    Application.router.navigateTo(
      context, 
      Routes.getPath("cityDetail") + "?cityName=" + Uri.encodeComponent(cityItem.id.toString()),
      // ignore: todo
      // TODO 通过 routeSettings 传递对象参数
      routeSettings: RouteSettings(arguments: cityItem)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.ELM_APP_TITLE)
      ),
      body: ListView(
        children: [
          CurrentCity(currentCity, handlePassDetail),
          CityGroup(
            title: Strings.ELM_APP_HOT_CITY,
            list: hotCityList,
            handlePassDetail: handlePassDetail
          ),
          Container(
            decoration: BoxDecoration(
              color: Provider.of<AppThem>(context).color.FONT_COLOR,
            ),
            child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: cityMap.keys.length,
              itemBuilder: createCityGroup,
            ),
          ),
        ],
      ),
    );
  }
}
