import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:puzzle_game/app/modules/main_game/controllers/main_game_controller.dart';
import 'package:puzzle_game/app/modules/main_game/views/widgets/level_button.dart';
import 'package:puzzle_game/utils/my_utils.dart';

import '../widgets/game.dart';
import '../widgets/help_button.dart';
import '../widgets/leader_board_button.dart';
import '../widgets/reset_game_button.dart';
import '../widgets/setting_button.dart';
import '../widgets/user_name_tile.dart';

class MobileLayout extends StatelessWidget {
  final controller = Get.find<MainGameController>();

  @override
  Widget build(BuildContext context) {
    MyUtils.makeScreenResponsive(context);
    return Container(
      child: Stack(
        children: [
          /// [App Bar]
          Positioned(
            top: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 21.w),
              height: 115.5.h,
              width: Get.width,
              child: Row(
                children: [
                  UsernameTile(),
                  Spacer(),
                  LevelButton(),
                  SizedBox(width: 5.1.w),
                  SettingButton(),
                ],
              ),
            ),
          ),

          /// [Game]
          Positioned(
            bottom: -12.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/game_area.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  constraints: BoxConstraints(
                    maxHeight: Get.width * 2,
                    maxWidth: (Get.height * 0.5) - 25.w,
                  ),
                  height: 810.h - 115.5.h,
                  width: (Get.width * 0.85) - (Get.width * 0.04),
                  child:
                      RawKeyboardListener(focusNode: controller.focusNode, autofocus: true, onKey: controller.keyboardButtonPressed, child: Game()),
                ),
              ],
            ),
          ),

          /// [Bottom Bar]
          Positioned(
            bottom: 0,
            child: Container(
              height: 142.h,
              width: Get.width,
              padding: EdgeInsets.symmetric(
                horizontal: 21.w,
                vertical: 10.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HelpButton(),
                      ResetGameButton(),
                    ],
                  ),
                  Container(
                    // height: 180.h,
                    child: Lottie.asset("assets/lotties/heli_new1.json", /*height: 220.h, width: 190.w,*/ fit: BoxFit.contain),
                  ),
                  LeaderboardButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
