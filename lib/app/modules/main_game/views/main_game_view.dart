import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/app/modules/main_game/views/widgets/game.dart';
import 'package:puzzle_game/utils/my_utils.dart';

import '../controllers/main_game_controller.dart';

class MainGameView extends GetView<MainGameController> {
  @override
  Widget build(BuildContext context) {
    MyUtils.makeScreenResponsive(context);
    return WillPopScope(
      onWillPop: () async {
        bool shouldReturn = false;
        await Get.dialog(Container(
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
                            shouldReturn = false;
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
                child: Container(
                    width: Get.width,
                    height: 76.h,
                    child: Image.asset("assets/images/quit_icon.png")),
              )
            ],
          ),
        ));
        return shouldReturn;
      },
      child: Scaffold(
        body: Center(
          child: Container(
            width: Get.width,
            height: Get.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/images/main_game_bg.png",
                  ),
                  fit: BoxFit.cover),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: true,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: Row(
                          children: [
                            Container(
                              height: 95.h,
                              width: 225.w,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/main_board_player_bg.png"),
                                ),
                              ),
                              padding: EdgeInsets.only(top: 15, left: 35),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(bottom: 15),
                                    child: Image.asset(
                                      "assets/images/user_icon.png",
                                      width: 25.w,
                                      height: 30.h,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Obx(
                                      () => Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.playerName.value,
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 26,
                                              overflow: TextOverflow.ellipsis,
                                              fontFamily: "leiralite",
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Steps: ",
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    color: Color(0xFFFFE948),
                                                    fontSize: 18,
                                                    fontFamily: "Babybo",
                                                  ),
                                                ),
                                                Text(
                                                  controller.steps.value
                                                      .toString(),
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontFamily: "Babybo",
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Image.asset(
                              "assets/images/help_icon.png",
                              height: 53.w,
                              width: 53.w,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              "assets/images/settings_icon.png",
                              height: 53.w,
                              width: 53.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Game(),
                    ),
                    Visibility(
                      visible: true,
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            height: 140.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/full_screen_icon.png",
                                  height: 45.w,
                                  width: 45.w,
                                ),
                                Spacer(),
                                Padding(
                                  padding: EdgeInsets.only(top: 5.h),
                                  child: Image.asset(
                                    "assets/images/pause_icon.png",
                                    height: 45.w,
                                    width: 45.w,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 130.h,
                            child: Image.asset(
                              "assets/images/way_out_img.png",
                              height: 140.w,
                              width: 98.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            height: 140.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/leader_board_icon.png",
                                  height: 45.w,
                                  width: 45.w,
                                ),
                                Spacer(),
                                Padding(
                                  padding: EdgeInsets.only(top: 5.h),
                                  child: InkWell(
                                    onTap: controller.resetGame,
                                    child: Image.asset(
                                      "assets/images/reset_game_icon.png",
                                      height: 45.w,
                                      width: 45.w,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
