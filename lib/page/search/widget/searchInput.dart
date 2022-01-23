// ignore_for_file: prefer_const_constructors_in_immutables, file_names, prefer_const_constructors, unused_field, deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/constant/strings.dart';
import 'package:flutterapp/provider/them.dart';
import 'package:provider/provider.dart';

class SearchInput extends StatefulWidget {
  SearchInput(this.handleSearch, {Key? key}) : super(key: key);
  void Function(BuildContext context, String keyWord) handleSearch;
  @override
  _SearchInputState createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  // 搜索内容
  String _searchText = "";
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (String val){
                setState(() => _searchText = val);
              },
              decoration: InputDecoration(
                hintText: Strings.ELM_APP_SEARCH_PLACE_HLODER,
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                    vertical: ScreenUtil().setHeight(20),
                    horizontal: ScreenUtil().setWidth(30)
                ),
              ),
            )
          ),
          SizedBox(width: ScreenUtil().setWidth(20)),
          FlatButton(
            height: ScreenUtil().setHeight(70),
            color: Provider.of<AppThem>(context).color.PRIMARUY_COLOR,
            child: Text("提交", style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(30))),
            onPressed: () {
              widget.handleSearch(context, _searchText);
            }
          )
        ],
      )
    );
  }
}