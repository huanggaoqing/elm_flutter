// ignore_for_file: file_names, avoid_unnecessary_containers, prefer_const_constructors, use_full_hex_values_for_flutter_colors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, must_be_immutable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/entity/SupportsEntity.dart';
import 'package:flutterapp/entity/commodityItemEntity.dart';
import 'package:flutterapp/provider/them.dart';
import 'package:flutterapp/widget/score/score.dart';
import 'package:provider/provider.dart';

class ItemCont extends StatelessWidget {
  ItemCont(this.item, {Key? key}) : super(key: key);
  CommodityItemEntity item;
  Container createContainer(SupportsEntity it){
    return Container(
      padding: EdgeInsets.all(ScreenUtil().setWidth(2)),
      margin: EdgeInsets.only(right: ScreenUtil().setWidth(6)),
      child: Text(it.icon_name, style: TextStyle(fontSize: ScreenUtil().setSp(23))),
      decoration: BoxDecoration(border: Border.all(color: Color(0XFFe4e4e4))),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center ,
                  children: [
                    Text(
                      "品牌", 
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        backgroundColor: Color(0xFFffd930),
                      )
                    ),
                    SizedBox(width: ScreenUtil().setWidth(20)),
                    Container(
                      width: ScreenUtil().setWidth(260),
                      child: Text(
                        item.name, 
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: ScreenUtil().setSp(36),
                        ),
                      )
                    ),
                  ],
                ),
                Row(
                  children: item.supports.map(createContainer).toList()
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Score(initRating: item.rating),
                    SizedBox(width: ScreenUtil().setWidth(10)),
                    Text("月售${item.recent_order_num}单", style: TextStyle(fontSize: ScreenUtil().setSp(23))),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Provider.of<AppThem>(context).color.PRIMARUY_COLOR,
                        borderRadius: BorderRadius.all(Radius.circular(3))
                      ),
                      child: Text(
                        "蜂鸟专送", 
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(20),
                        )
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("¥${item.float_minimum_order_amount}起送/配送费约¥${item.float_delivery_fee}", style: TextStyle(fontSize: ScreenUtil().setSp(22))),
                RichText(
                  text: TextSpan(
                    text: item.distance + "/",
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: ScreenUtil().setSp(22),
                    ),
                    children: [
                      TextSpan(
                        text: (item.order_lead_time),
                        style: TextStyle(
                          color: Provider.of<AppThem>(context).color.PRIMARUY_COLOR,
                          fontSize: ScreenUtil().setSp(22)
                        )
                      )
                    ]
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}