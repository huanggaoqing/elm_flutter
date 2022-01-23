// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/constant/strings.dart';

class Empty extends StatelessWidget {
  const Empty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.ELM_APP_NOT_PAGE_CODE),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Strings.ELM_APP_NOT_PAGE_CODE,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(40),
              ),
            ),
            Text(
              Strings.ELM_APP_NOT_PAGE_TIPS,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(28),
              ),
            )
          ],
        ),
      ),
    );
  }
}
