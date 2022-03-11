import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/app/modules/main_game/controllers/main_game_controller.dart';
import 'package:puzzle_game/utils/my_utils.dart';

class SettingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<MainGameController>();
    MyUtils.makeScreenResponsive(context);
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        color: Colors.transparent,
        margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 120.h),
        child: Stack(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  child: Image.asset("assets/images/setting_background.png"),
                ),
                Container(
                  margin: EdgeInsets.only(top: 60.h, right: 25),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 44.h,
                          width: 44.h,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              // changed by fazal
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 120.h),
              // padding: EdgeInsets.only(right: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 70.w),
                        child: Text(
                          "Music",
                          style: TextStyle(
                              color: Color(0xFF272B3C),
                              fontSize: 25,
                              fontFamily: "leiralite"),
                        ),
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(right: 80.w),
                        child: InkWell(
                          onTap: _controller.changeMusic,
                          child: Obx(
                            () => Image.asset(
                              _controller.isPlayMusic.value
                                  ? "assets/images/switch_on_icon.png"
                                  : "assets/images/switch_off_icon.png",
                              height: 25.h,
                              width: 42.w,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 70.w),
                        child: Text(
                          "Sound",
                          style: TextStyle(
                              color: Color(0xFF272B3C),
                              fontSize: 25,
                              fontFamily: "leiralite"),
                        ),
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(right: 80.w),
                        child: InkWell(
                          onTap: _controller.changeSound,
                          child: Obx(
                            () => Image.asset(
                              _controller.isPlaySound.value
                                  ? "assets/images/switch_on_icon.png"
                                  : "assets/images/switch_off_icon.png",
                              height: 25.h,
                              width: 42.w,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
