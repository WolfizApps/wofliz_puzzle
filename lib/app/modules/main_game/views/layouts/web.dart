import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:puzzle_game/app/modules/main_game/controllers/main_game_controller.dart';

import '../widgets/game.dart';
import '../widgets/help_button.dart';
import '../widgets/leader_board_button.dart';
import '../widgets/reset_game_button.dart';
import '../widgets/setting_button.dart';
import '../widgets/user_name_tile.dart';

class WebLayout extends StatelessWidget {
  final controller = Get.find<MainGameController>();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Column(
              children: [
                UsernameTile(),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HelpButton(),
                    SizedBox(width: 20.w),
                    LeaderboardButton(),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxHeight: Get.width * 2,
                    maxWidth: (Get.height * 0.5) - 25.w,
                  ),
                  height: 810.h - 115.5.h,
                  width: (Get.width * 0.85) - (Get.width * 0.04),
                  child: Stack(
                    children: [
                      Game(),
                      Container(
                        height: controller.blockHeight,
                        width: controller.blockWidth * 2,
                        child: Lottie.asset(
                          "assets/lotties/heli_new1.json",
                          height: controller.blockHeight,
                          width: controller.blockWidth * 2,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SettingButton(),
                    SizedBox(width: 20.w),
                    ResetGameButton(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
