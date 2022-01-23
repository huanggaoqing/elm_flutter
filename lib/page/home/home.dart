// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, deprecated_member_use, avoid_print, unnecessary_new, must_be_immutable, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, unnecessary_this

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/entity/commodityItemEntity.dart';
import 'package:flutterapp/entity/currentPointEntity.dart';
import 'package:flutterapp/page/home/widget/commodityCont.dart';
import 'package:flutterapp/page/home/widget/groupSwiper.dart';
import 'package:flutterapp/provider/point.dart';
import 'package:flutterapp/service/home.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home(this.changeCurrentIndex, {Key? key}) : super(key: key);
  // 改变 tabbar
  void Function(int idx) changeCurrentIndex;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // 详细地址
  CurrentPointEntity? detailPoint;
  // 商铺信息
  List<CommodityItemEntity> commodityItemList = [];

  // ignore: todo
  // TODO didChangeDependencies 生命周期会在 initState 后调用，在 didChangeDependencies 里面可以获取到 context
  @override
  void didChangeDependencies() {
    // ignore: todo
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    String localtion = Provider.of<Point>(context).point;
    print("【查看context】：$localtion");
    getPointMethods(localtion);
  }

  // 获取到详细地址以及商家列表
  void getPointMethods(String point) async {
    Response currentCity = await HomeService.getPoint(point);
    print("【查看当前定位数据】：${currentCity.data}");
    setState(() => detailPoint = CurrentPointEntity.fromJson(currentCity.data));
    Response commodityList = await HomeService.getCommodity({
      "latitude": detailPoint!.latitude,
      "longitude": detailPoint!.longitude
    });
    print("【查看商家列表信息】：${commodityList.data}");
    setState(() => commodityItemList = CommodityListEntity.fromJson(commodityList.data).list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: GestureDetector(
            child: Icon(Icons.search),
            onTap: () => widget.changeCurrentIndex(1),
          ),
          iconSize: ScreenUtil().setSp(60),
          onPressed: () {},
        ),
        title: Text(detailPoint?.name ?? "首页"),
      ),
      body: ListView(
        children: [
          GroupSwiper(localtion: detailPoint?.geohash ?? ""),
          CommodityCont(commodityList: commodityItemList),
        ],
      ),
    );
  }
}
