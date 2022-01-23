// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/constant/strings.dart';
import 'package:flutterapp/entity/cityEntity.dart';
import 'package:flutterapp/provider/them.dart';
import 'package:provider/provider.dart';

class CityGroup extends StatelessWidget {
  CityGroup({Key? key, required this.title, required this.list, required this.handlePassDetail}): super(key: key);
  String title;
  List<CityEntity> list;
  Function(BuildContext context, CityEntity cityItem) handlePassDetail;

  // 生成城市列表
  GestureDetector createCityItem(BuildContext context, int idx) {
    return GestureDetector(
      onTap: () => handlePassDetail(context, list[idx]),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(10), 0, ScreenUtil().setWidth(10), 0),
        height: ScreenUtil().setHeight(82),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              color: Color(0XFFe4e4e4),
            ),
            bottom: BorderSide(
              color: Color(0XFFe4e4e4),
            ),
          ),
        ),
        child: Text(
          list[idx].name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: title == Strings.ELM_APP_HOT_CITY
                ? Provider.of<AppThem>(context).color.PRIMARUY_COLOR
                : Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(10)),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.symmetric(vertical: BorderSide(color: Color(0XFFe4e4e4)))
      ),
      child: Column(
        children: [
          Container(
            height: ScreenUtil().setHeight(70),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(16), 0, 0, 0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0XFFe4e4e4),
                ),
              ),
            ),
            child: Text(title),
          ),
          GridView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: list.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: ScreenUtil().setHeight(750 / 4) / ScreenUtil().setHeight(82),
              crossAxisCount: 4,
            ),
            itemBuilder: createCityItem,
          )
        ],
      ),
    );
  }
}
