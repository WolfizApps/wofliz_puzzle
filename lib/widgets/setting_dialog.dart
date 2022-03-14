import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/app/modules/main_game/controllers/main_game_controller.dart';
import 'package:puzzle_game/app/routes/app_pages.dart';
import 'package:puzzle_game/utils/my_storage.dart';
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
        width: Get.width,
        height: Get.height,
        constraints: BoxConstraints(
          maxHeight: Get.height/2,
          maxWidth: Get.width/2
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset("assets/images/setting_background.png"),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.only(top: 60.h, right: 10),
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
                              // color: Colors.red,
                              height: 44.h,
                              width: 44.h,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    constraints: BoxConstraints(
                        maxHeight: Get.height/2,
                        maxWidth: Get.width/2
                    ),
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
                              // margin: EdgeInsets.only(right: 80.w),
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
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
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
                              // margin: EdgeInsets.only(right: 80.w),
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
            Flexible(
              child: Material(
                color: Colors.transparent,
                child: Container(
                    width: Get.width,
                    height: 76.h,
                    margin: EdgeInsets.only(left: 70.w, right: 70.w),
                    child: InkWell(
                        onTap: () {
                          MyStorage.writeIsUserLoggedIn(false);
                          MyStorage.writeUserEmail("");
                          MyStorage.writeTotalCount("0");
                          MyStorage.writeUserName("");
                          MyStorage.writeUserPassword("");
                          Get.offAllNamed(Routes.REGISTER);
                        },
                        child: Image.asset("assets/images/log_out_icon.png"))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
