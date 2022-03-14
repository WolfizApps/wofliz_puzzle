import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/utils/my_utils.dart';

class ExitDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyUtils.makeScreenResponsive(context);
    return Container(
      alignment: Alignment.center,
      constraints:
      BoxConstraints(maxHeight: Get.height / 2, maxWidth: Get.width / 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset("assets/images/app_close_img.png"),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: EdgeInsets.only(top: 30.h, left: 220),
                    height: 50,
                    width: 50,
                    constraints: BoxConstraints(maxHeight: 50, maxWidth: 50),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          // TODO: Fazal handle close button
                          child: Container(
                            height: 44.h,
                            width: 44.h,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Material(
              color: Colors.transparent,
              child: Container(
                  width: Get.width,
                  height: 76.h,
                  margin: EdgeInsets.only(left: 70.w, right: 70.w),
                  child: InkWell(
                      onTap: () {
                        if (Platform.isAndroid) {
                          SystemNavigator.pop();
                        } else if (Platform.isIOS) {
                          exit(0);
                        }
                      },
                      child: Image.asset("assets/images/quit_icon.png"))),
            ),
          ),
        ],
      ),
    );
  }
}
