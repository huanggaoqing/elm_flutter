// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:flutterapp/entity/colorThem.dart';

class Red implements ColorThem {
  @override
  final Color PRIMARUY_COLOR = Colors.pink;
  @override
  final Color FONT_COLOR = Color(0xFFeeeeee);
}
