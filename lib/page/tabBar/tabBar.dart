// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new, deprecated_member_use, avoid_print, unused_import, file_names

import 'package:flutter/material.dart';
import 'package:flutterapp/constant/strings.dart';
import 'package:flutterapp/page/cityDetail/widget/search.dart';
import 'package:flutterapp/page/home/home.dart';
import 'package:flutterapp/page/my/my.dart';
import 'package:flutterapp/page/order/order.dart';
import 'package:flutterapp/page/search/search.dart';

class TabBarElm extends StatefulWidget {
  TabBarElm({Key? key}) : super(key: key);

  @override
  _TabBarElmState createState() => _TabBarElmState();
}

class _TabBarElmState extends State<TabBarElm> {
  // 当前触发的导航栏下标
  int currentIdx = 0;

  // 页面集合
  List<Widget> list = [];

  // 导航栏每项集合
  List<BottomNavigationBarItem> itemsList = [
    new BottomNavigationBarItem(
      title: Text(Strings.ELM_APP_TAB_BAR_HOME),
      icon: Icon(IconData(0xe8ca, fontFamily: "iconfont")),
    ),
    new BottomNavigationBarItem(
      title: Text(Strings.ELM_APP_TAB_BAR_SEARCH),
      icon: Icon(IconData(0xe652, fontFamily: "iconfont")),
    ),
    new BottomNavigationBarItem(
      title: Text(Strings.ELM_APP_TAB_BAR_ORDER),
      icon: Icon(IconData(0xe897, fontFamily: "iconfont")),
    ),
    new BottomNavigationBarItem(
      title: Text(Strings.ELM_APP_TAB_BAR_MY),
      icon: Icon(IconData(0xe8a0, fontFamily: "iconfont")),
    )
  ];

  @override
  void initState() {
    super.initState();
    setState(() {
      list = [Home(changeCurrentIndex), SearchPage(), Order(), My()];
    });
  }

   // 修改当前下表
  void changeCurrentIndex(int idx) {
     setState(() => currentIdx = idx);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[currentIdx],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIdx,
        items: itemsList,
        type: BottomNavigationBarType.fixed,
        onTap: changeCurrentIndex,
      ),
    );
  }
}
