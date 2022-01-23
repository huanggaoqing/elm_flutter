// ignore_for_file: file_names, avoid_unnecessary_containers, prefer_const_constructors, use_full_hex_values_for_flutter_colors, must_be_immutable, non_constant_identifier_names, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/constant/strings.dart';
import 'package:flutterapp/entity/commodityItemEntity.dart';
import 'package:flutterapp/widget/commodityItem/widget/itemCont.dart';
class CommodityItem extends StatelessWidget {
  CommodityItem({Key? key, required this.handleClick, required this.item}) : super(key: key);
  // 每一项点击事件
  void Function(int commodityId) handleClick;
  // 商品每一项
  CommodityItemEntity item;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => handleClick(item.id),
      child: Container(
        height: ScreenUtil().setHeight(200),
        padding: EdgeInsets.symmetric(
          vertical: ScreenUtil().setHeight(30)
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Color(0xF333333)))
        ),
        child: Row(
          children: [
            Image.network(Strings.ELM_APP_IMAGE_TWO_URL + item.image_path),
            SizedBox(width: ScreenUtil().setWidth(20)),
            Expanded(
              flex: 1,
              child: ItemCont(item)
            ),
          ],
        ),
      ),
    );
  }
}