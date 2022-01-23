// ignore_for_file: file_names, sized_box_for_whitespace, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/constant/strings.dart';
import 'package:flutterapp/entity/cityEntity.dart';
import 'package:flutterapp/provider/them.dart';
import 'package:provider/provider.dart';

class CurrentCity extends StatelessWidget {
  CurrentCity(this.currentCity, this.handlePassDetail, {Key? key}) : super(key: key);
  CityEntity? currentCity;
  Function(BuildContext context, CityEntity cityItem) handlePassDetail;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(16)),
      child: Column(
        children: [
          Container(
            height: ScreenUtil().setHeight(70),
            padding: EdgeInsets.fromLTRB(
                ScreenUtil().setWidth(16), 0, ScreenUtil().setWidth(16), 0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Provider.of<AppThem>(context).color.FONT_COLOR,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.ELM_APP_CURRENT_CITY,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(25),
                    color: Color(0xFF9F9F9F),
                  ),
                ),
                Text(
                  Strings.ELM_APP_CURRENT_CITY_DESC,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(21),
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF9F9F9F),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(70),
            padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(16), 0, ScreenUtil().setWidth(16), 0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Provider.of<AppThem>(context).color.FONT_COLOR,
                ),
              ),
            ),
            child: GestureDetector(
              onTap: () => handlePassDetail(context, currentCity as CityEntity),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    currentCity?.name ?? "",
                    style: TextStyle(
                      color: Provider.of<AppThem>(context).color.PRIMARUY_COLOR,
                      fontSize: ScreenUtil().setSp(32),
                    ),
                  ),
                  Icon(Icons.chevron_right_outlined),
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}
