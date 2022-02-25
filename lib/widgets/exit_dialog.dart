import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ExitDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset("assets/images/app_close_img.png"),
              Container(
                margin: EdgeInsets.only(top: 60.h, right: 10),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: SizedBox(
                        height: 44.h,
                        width: 44.h,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Flexible(
            child: Material(
              color: Colors.transparent,
              child: Container(
                  width: Get.width,
                  height: 76.h,
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
          )
        ],
      ),
    );
  }
}
