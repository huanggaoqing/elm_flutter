// ignore_for_file: file_names, must_be_immutable, prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new, avoid_print, deprecated_member_use, prefer_is_empty

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterapp/constant/strings.dart';
import 'package:flutterapp/entity/cityDetailEntity.dart';
import 'package:flutterapp/util/storeUtil.dart';
import 'package:flutterapp/util/toastUtil.dart';
class SearchList extends StatefulWidget {
  SearchList(this.list, this.handleItemClick, {Key? key}) : super(key: key);
  
  // 存储方法
  List<CityDetailEntity> list;

  // 每项点击事件
  Function(BuildContext context, CityDetailEntity item) handleItemClick;

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  StoreUtil prefs = new StoreUtil();

  // 历史记录
  List<CityDetailEntity> history = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      List<String> his = prefs.getStore<List<String>>(Strings.ELM_APP_SEARCH_HISTORY) ?? [];
      history = his.map((item) => CityDetailEntity.fromJson(json.decode(item))).toList();
    });
  }

  // 清除历史记录方法
  void clearHistory() async {
    bool isSucces = await prefs.removeStore(Strings.ELM_APP_SEARCH_HISTORY);
    if(isSucces){
      setState(() => history.clear());
      ToastUtil.showToast("清除历史记录成功");
    } else {
      ToastUtil.showToast("清除历史记录失败");
    }
  }

  // 根据数据创建每一项控件
  GestureDetector createListTile(BuildContext context, int idx){
    widget.list = widget.list.isEmpty ? history : widget.list;
    return GestureDetector(
        onTap: () => widget.handleItemClick(context, widget.list[idx]),
        child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Color(0xFFEEEEEE))),
        ),
        child: ListTile(
          title: Text(widget.list[idx].name),
          subtitle: Text(widget.list[idx].address),
        ),
      ),
    );
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: widget.list.isEmpty ? history.length : widget.list.length,
            itemBuilder: createListTile
          ),
          // ignore: todo
          // TODO Offstage 控制控件的隐藏和显示
          Offstage(
            offstage: widget.list.isNotEmpty || history.length == 0,
            child: FlatButton(
              minWidth: double.infinity,
              child: Text("清除历史记录"),
              color: Colors.white,
              onPressed: clearHistory
            ),
          ),
        ],
      ),
    );
  }
}