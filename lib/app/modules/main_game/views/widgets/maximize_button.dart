import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:puzzle_game/utils/my_utils.dart';

class MaximizeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyUtils.makeScreenResponsive(context);
    return Image.asset(
      "assets/images/full_screen_icon.png",
      height: 53.w,
      width: 53.w,
    );
  }
}
