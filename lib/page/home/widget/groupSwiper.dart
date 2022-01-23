// ignore_for_file: file_names, prefer_const_constructors_in_immutables, must_be_immutable, avoid_print, avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace, unnecessary_new

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:flutterapp/constant/strings.dart';
import 'package:flutterapp/entity/groupSwiperEntity.dart';
import 'package:flutterapp/provider/them.dart';
import 'package:flutterapp/service/home.dart';
import 'package:provider/provider.dart';

class GroupSwiper extends StatefulWidget {
  GroupSwiper({required this.localtion, Key? key}) : super(key: key);
  String localtion = "";
  @override
  _GroupSwiperState createState() => _GroupSwiperState();
}

class _GroupSwiperState extends State<GroupSwiper> {
  // 分类数据
  List<List<GroupSwiperEntity>> list = [];
  // 轮播当前页
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    getGroupList();
  }

  // 获取分类数据
  void getGroupList() async {
    Response res = await HomeService.getGroupList({
      "geohash": widget.localtion,
      "group_type": 1,
    });
    List<GroupSwiperEntity> data = GroupSwiperListEntity.fromJson(res.data).list;
    int page = (data.length / Strings.ELM_APP_SWIPER_NUM).ceil();
    for (int i = 1; i <= page; i++) {
      setState(() {
        list.add(data.sublist((i - 1) * Strings.ELM_APP_SWIPER_NUM, i * Strings.ELM_APP_SWIPER_NUM));
      });
    }
  }

  // 分类点击事件
  void handelClick(int groupId) {
    print("【点击的分类】：$groupId");
  }

  // 创建每一项分类
  GestureDetector createGroupItem(GroupSwiperEntity item) {
    return GestureDetector(
      onTap: () => handelClick(item.id),
      child: Container(
        child: Column(
          children: [
            Image.network(
              Strings.ELM_APP_IMAGE_URL + item.image_url,
              width: ScreenUtil().setWidth(80),
            ),
            SizedBox(height: ScreenUtil().setHeight(20)),
            Text(
              item.title,
              style: TextStyle(color: Color(0xFF555555)),
            ),
          ],
        ),
      ),
    );
  }

  // 创建每一项 swiper
  GridView createSwiperItem(BuildContext context, int idx) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      children: list[idx].map(createGroupItem).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(370),
      padding: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(width: 1, color: Color(0xFFF5F5F5))),
      ),
      child: Swiper(
        index: currentIndex,
        itemCount: list.length,
        itemBuilder: createSwiperItem,
        onIndexChanged: (int cur) => setState(() => currentIndex = cur),
        pagination: SwiperPagination(
          margin: EdgeInsets.all(ScreenUtil().setHeight(8.0)),
          builder: DotSwiperPaginationBuilder(
            color: Color(0xFFF5F5F5),
            activeColor: Provider.of<AppThem>(context).color.PRIMARUY_COLOR,
            space: ScreenUtil().setWidth(12.0),
          ),
        ),
      ),
    );
  }
}
