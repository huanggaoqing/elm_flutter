// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, deprecated_member_use, unused_field, avoid_print, unnecessary_new, prefer_contains
import 'package:flutter/material.dart';
import 'package:flutterapp/constant/strings.dart';
import 'package:flutterapp/entity/commodityItemEntity.dart';
import 'package:flutterapp/page/search/widget/historyItem.dart';
import 'package:flutterapp/page/search/widget/searchInput.dart';
import 'package:flutterapp/page/search/widget/searchListItem.dart';
import 'package:flutterapp/provider/point.dart';
import 'package:flutterapp/service/search.dart';
import 'package:flutterapp/util/storeUtil.dart';
import 'package:flutterapp/util/toastUtil.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  // 商家列表
  List<CommodityItemEntity> commodityList = [];
  // 存储
  StoreUtil store = new StoreUtil();
  // 历史记录
  List<String> historyList = [];

  @override
  void initState() {
    super.initState();
    setState(() => historyList = store.getStore<List<String>>(Strings.ELM_APP_STORE_HISTORY) ?? []);
  }

  // 搜索接口
  void handleSearch(BuildContext context, String keyWord) async {
    print("【搜索的关键字】：$keyWord");
    if(keyWord.isEmpty){
      ToastUtil.showToast("搜索内容不能为空");
      return;
    }
    String localtion = Provider.of<Point>(context, listen: false).point;
    final res = await SearchServices.searchList(
      {"geohash": localtion, "keyword": keyWord}
    );
    print("【搜索列表数据】：$res");
    saveHistory(keyWord);
    setState(() {
      commodityList = res.data != null ? CommodityListEntity.fromJson(res.data).list : [];
    });
  }

  // 保存历史记录
  void saveHistory(String keyWord) {
    setState(() {
      if(!historyList.contains(keyWord)) historyList.add(keyWord);
    });
    synchronizationHistory();
  }

  // 清除历史记录
  void clearHistory() {
    store.removeStore(Strings.ELM_APP_STORE_HISTORY);
    setState(() => historyList = []);
  }

  // 删除某一项历史记录
  void delHistoryItem(String keyWord) {
    print("【查看要清除的历史记录】：$keyWord");
    setState(() => historyList.remove(keyWord));
    synchronizationHistory();
  }

  // 历史记录同步到缓存
  void synchronizationHistory() => store.setStore(Strings.ELM_APP_STORE_HISTORY, historyList);

  // 创建每一项商家
  SearchListItem createSearchListItem(CommodityItemEntity item) => SearchListItem(item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("搜索"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SearchInput(handleSearch),
          Offstage(
            offstage: commodityList.isNotEmpty,
            child: HistoreItem(
              historyList,
              itemClick: (String keyWord) => handleSearch(context, keyWord),
              handleLeftClick: delHistoryItem,
              clearHistory: clearHistory
            ),
          ),
          Offstage(
            offstage: commodityList.isEmpty,
            child: Container(
              child: Column(
                children: commodityList.map(createSearchListItem).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}