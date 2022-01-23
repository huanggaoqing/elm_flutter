// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import "package:provider/provider.dart";

class Point extends ChangeNotifier {
  String _point = "";

  void setPoint(String p) {
    _point = p;
    notifyListeners();
  }

  String get point => _point;

  Point();
}
