// ignore_for_file: file_names, unused_import, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import "package:fluttertoast/fluttertoast.dart";
class ToastUtil {
  static showToast(
    String msg,
  ){
    Fluttertoast.showToast(
      msg: msg,
      toastLength:Toast.LENGTH_SHORT,
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.5),
      textColor: Colors.white
    );
  }
}