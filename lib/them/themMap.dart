// ignore_for_file: file_names, non_constant_identifier_names, prefer_const_constructors, unnecessary_cast
import 'package:flutterapp/entity/colorThem.dart';
import 'package:flutterapp/them/blue.dart';
import 'package:flutterapp/them/red.dart';

Map<String, ColorThem> ThemParent = {
    "blue": Blue(),
    "red": Red()
} as Map<String, ColorThem>;
