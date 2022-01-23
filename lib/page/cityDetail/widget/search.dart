// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/constant/strings.dart';
import 'package:flutterapp/provider/them.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  Search(this.handleSearch, {Key? key}) : super(key: key);

  // 搜索方法
  Function(String keyWord) handleSearch;

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  // 搜索关键字
  String searContent = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: ScreenUtil().setHeight(20),
        horizontal: ScreenUtil().setWidth(30),
      ),
      margin: EdgeInsets.only(
        top: ScreenUtil().setHeight(20),
      ),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          TextField(
            onChanged: (String val) {
              setState(() => searContent = val);
            },
            decoration: InputDecoration(
                hintText: Strings.ELM_APP_SEARCH_CITY_TIPS,
                isCollapsed: true,
                contentPadding: EdgeInsets.symmetric(
                    vertical: ScreenUtil().setHeight(20),
                    horizontal: ScreenUtil().setWidth(30)
                ),
                border: OutlineInputBorder(borderSide: BorderSide())),
          ),
          FlatButton(
            child: Text(
              "提交",
              style: TextStyle(fontSize: ScreenUtil().setSp(30)),
            ),
            // ignore: todo
            // TODO double.infinity 相当于 css 的100%
            minWidth: double.infinity,
            onPressed: () => widget.handleSearch(searContent),
            color: Provider.of<AppThem>(context).color.PRIMARUY_COLOR,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}
