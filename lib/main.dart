// ignore_for_file: unused_import, prefer_function_declarations_over_variables, prefer_const_constructors, non_constant_identifier_names, unnecessary_new, unused_local_variable, use_key_in_widget_constructors, avoid_print, must_be_immutable

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutterapp/provider/point.dart';
import 'package:flutterapp/provider/them.dart';
import 'package:flutterapp/router/application.dart';
import 'package:flutterapp/router/routes.dart';
import 'package:flutterapp/util/storeUtil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) {
    FluroRouter router = new FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppThem>.value(value: AppThem()),
        ChangeNotifierProvider<Point>.value(value: Point())
      ],
      child: ScreenUtilInit(designSize: Size(750, 1334), builder: () => App()),
    );
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: Provider.of<AppThem>(context).them,
      darkTheme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Color(0xFF000000),
        ),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Application.router.generator,
    );
  }
}
