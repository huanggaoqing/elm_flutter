// ignore_for_file: file_names, avoid_unnecessary_containers, prefer_const_constructors, avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/constant/strings.dart';
import 'package:flutterapp/entity/commodityItemEntity.dart';
import 'package:flutterapp/widget/commodityItem/commodityItem.dart';

class CommodityCont extends StatelessWidget {
  CommodityCont({Key? key, required this.commodityList}) : super(key: key);

  // 商家列表
  List<CommodityItemEntity> commodityList = [];

  // 商家点击事件
  void handleClick(int commodityId) {
    print("【当前点击的商家id】：$commodityId");
  }

  // 创建商家列表每一项
  CommodityItem createCommodityItem(BuildContext context, int idx) {
    return CommodityItem(
      handleClick: handleClick,
      item: commodityList[idx],
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(16)),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(ScreenUtil().setWidth(26)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  IconData(0xe6bd, fontFamily: Strings.ELM_APP_ICON_FONT), 
                  color: Color(0xFF333333),
                  size: ScreenUtil().setWidth(30),
                ),
                SizedBox(width: ScreenUtil().setWidth(10)),
                Text(
                  Strings.ELM_APP_CONTENT_TITLE,
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: ScreenUtil().setSp(26),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
            child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: commodityList.length,
              itemBuilder: createCommodityItem,
            )
          ),
        ],
      ),
    );
  }
}