import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 53.w,
      width: 53.w,
      constraints: BoxConstraints(maxHeight: 100, maxWidth: 100),
      child: Image.asset("assets/images/settings_icon.png"),
    );
  }
}
