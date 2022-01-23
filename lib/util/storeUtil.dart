// ignore_for_file: file_names, prefer_typing_uninitialized_variables, unused_element, unnecessary_this, unused_field, unnecessary_null_comparison, unused_local_variable, await_only_futures, avoid_print
import 'dart:convert';
import 'package:flutter/material.dart';
import "package:shared_preferences/shared_preferences.dart";
class StoreUtil {
  static SharedPreferences? _prefs;
  static final StoreUtil _interface = StoreUtil._internal();
  static void getInterface() async {
    WidgetsFlutterBinding.ensureInitialized();
    _prefs = await SharedPreferences.getInstance();
  }
  StoreUtil._internal(){
    print("执行了初始化");
    getInterface();
  }
  factory StoreUtil() =>  _interface;

  // 存储数据
  Future<bool> setStore(String key, dynamic value) async {
    String type = value.runtimeType.toString();
    print("值类型$type");
    Map<String, Function?> setJson = {
      "String": _prefs?.setString,
      "int": _prefs?.setInt,
      "bool": _prefs?.setBool,
      "double": _prefs?.setDouble,
      "List<String>": _prefs?.setStringList,
      "_InternalLinkedHashMap<String, String>": _prefs?.setString
    };
    if(setJson[type] == null) {
      print("无法存储$type类型的值");
      return false;
    }
    bool res = type == "_InternalLinkedHashMap<String, String>" 
    ? await setJson[type]!(key, json.encode(value)) 
    : await setJson[type]!(key, value);
    return res;
  }

  // 获取数据
  T? getStore<T>(String key) {
    String type = _typeOf<T>().toString();
    print("取值类型$type");
    Map<String, Function?> getJson = {
      "String": _prefs?.getString,
      "int": _prefs?.getInt,
      "bool": _prefs?.getBool,
      "double": _prefs?.getDouble,
      "List<String>": _prefs?.getStringList,
      "Map<String, dynamic>": _prefs?.getString
    };
    if(getJson[type] == null) {
      print("取值类型错误");
      return null;
    }
    if(type == "Map<String, dynamic>"){
      return json.decode(getJson[type]!(key) ?? "{}") as T;
    }
    return getJson[type]!(key);
  }

  // 删除数据
  Future<bool> removeStore(String key) async {
    bool isSucces = await _prefs!.remove(key);
    return isSucces;
  }

  // 获取泛型原始类型
  static Type _typeOf<T>() => T;
}