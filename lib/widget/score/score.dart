// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import "package:flutter_rating_bar/flutter_rating_bar.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/constant/strings.dart';
class Score extends StatelessWidget {
  Score({Key? key, required this.initRating}) : super(key: key);
  double initRating = 0;
  Icon createRatingItem(BuildContext context, int idx) {
    return Icon(
      IconData(0xe9a1, fontFamily: Strings.ELM_APP_ICON_FONT),
      color: Color(0xFFff9a0d)
    );
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar.builder(
          itemCount: 5,
          itemSize: ScreenUtil().setWidth(22),
          allowHalfRating: true,
          initialRating: initRating,
          itemBuilder: createRatingItem,
          onRatingUpdate: (double currentScore){}
        ),
        SizedBox(width: ScreenUtil().setWidth(10)),
        Text(
          initRating.toString(),
          style: TextStyle(
            color: Color(0xFFff6000),
            fontSize: ScreenUtil().setSp(26)
          ),
        )
      ],
    );
  }
}