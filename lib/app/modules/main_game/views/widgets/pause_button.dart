import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PauseButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/pause_icon.png",
      height: 53.w,
      width: 53.w,
    );
  }
}
