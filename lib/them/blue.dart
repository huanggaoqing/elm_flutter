// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:flutterapp/entity/colorThem.dart';

class Blue implements ColorThem {
  @override
  final Color PRIMARUY_COLOR = Color(0xFF3190e8);
  @override
  final Color FONT_COLOR = Color(0xFFeeeeee);
}
