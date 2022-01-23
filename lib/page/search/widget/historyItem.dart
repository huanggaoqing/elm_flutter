// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, deprecated_member_use, avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoreItem extends StatelessWidget {
  HistoreItem(this.list, {
    required this.itemClick, 
    required this.handleLeftClick, 
    required this.clearHistory,
    Key? key
  }) : super(key: key);

  // 历史记录数据
  List<String> list = [];
  // 每一项点击事件
  void Function(String keyword) itemClick;
  // 清除按钮点击事件
  void Function(String keyword) handleLeftClick;
  // 全部清除
  void Function() clearHistory;

  // 创建每一项历史记录
  GestureDetector createHistoryItem(String histiryItem) {
    return GestureDetector(
      onTap: () => itemClick(histiryItem),
      child: Container(
        height: ScreenUtil().setHeight(80),
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: ScreenUtil().setWidth(30)),
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFFE4E4E4)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(histiryItem),
            IconButton(
              icon: Icon(Icons.clear, color: Color(0xFF333333)),
              onPressed: () => handleLeftClick(histiryItem)
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: ScreenUtil().setHeight(80),
            alignment: Alignment.centerLeft,
            child: Text("搜索历史", style: TextStyle(color: Color(0xFF666666))),
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: ScreenUtil().setWidth(30)),
            decoration: BoxDecoration(
              color: Color(0xFFF5F5F5)
            ),
          ),
          Container(
            child: Column(
              children: list.map(createHistoryItem).toList(),
            )
          ),
          Offstage(
            offstage: list.isEmpty,
            child: FlatButton(
              height: ScreenUtil().setHeight(80),
              minWidth: double.infinity,
              onPressed: clearHistory, 
              child: Text(
                "清除历史记录",
                style: TextStyle(
                  color: Color(0xFF3190e8),
                  fontWeight: FontWeight.w700,
                  fontSize: ScreenUtil().setSp(32)
                ),
              )
            ),
          )
        ],
      )
    );
  }
}