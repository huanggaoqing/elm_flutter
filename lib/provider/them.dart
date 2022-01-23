// ignore_for_file: unnecessary_new, avoid_print, unused_import, unnecessary_this
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/entity/colorThem.dart';
import 'package:flutterapp/main.dart';
import 'package:flutterapp/them/themMap.dart';
import "package:provider/provider.dart";

class AppThem with ChangeNotifier {
  late ThemeData them;
  late ColorThem color;

  void setThem(String them) {
    this.them = new ThemeData(
      colorScheme: ColorScheme.light(primary: ThemParent[them]!.PRIMARUY_COLOR),
    );
    this.color = ThemParent[them] as ColorThem;
    notifyListeners();
  }

  AppThem() {
    setThem("blue");
  }
}
