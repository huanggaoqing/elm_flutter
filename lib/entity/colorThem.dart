// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

abstract class ColorThem {
  // 主体颜色
  final Color PRIMARUY_COLOR;
  // 字体颜色
  final Color FONT_COLOR;

  ColorThem(this.PRIMARUY_COLOR, this.FONT_COLOR);
}
