// ignore_for_file: file_names

import 'package:fluro/fluro.dart';

class RoutesClass {
  RoutesClass(this.name, this.path, this.handler);
  String name;
  String path;
  Handler handler;
}
