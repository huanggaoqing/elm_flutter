// ignore_for_file: file_names, avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/constant/strings.dart';
import 'package:flutterapp/entity/commodityItemEntity.dart';

class SearchListItem extends StatelessWidget {
  SearchListItem(this.item, {Key? key}) : super(key: key);
  // 每一项数据
  CommodityItemEntity item;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(150),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFEEEEEE)))
      ),
      child: Row(
        children: [
          Image.network(Strings.ELM_APP_IMAGE_TWO_URL + item.image_path, width: ScreenUtil().setWidth(100)),
          SizedBox(width: ScreenUtil().setWidth(20)),
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: ScreenUtil().setWidth(250),
                        child: Text(
                          item.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Image.asset("lib/asster/image/pay.png", width: ScreenUtil().setWidth(60))
                    ],
                  ),
                  Text("月售${item.recent_order_num}单"),
                  RichText(
                    text: TextSpan(
                      text: "${item.float_minimum_order_amount}元起送 / ",
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: "距离${item.distance}"
                        )
                      ]
                    )
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}