import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:puzzle_game/app/modules/main_game/views/widgets/game.dart';
import 'package:puzzle_game/app/modules/main_game/views/widgets/help_button.dart';
import 'package:puzzle_game/app/modules/main_game/views/widgets/leader_board_button.dart';
import 'package:puzzle_game/app/modules/main_game/views/widgets/maximize_button.dart';
import 'package:puzzle_game/app/modules/main_game/views/widgets/pause_button.dart';
import 'package:puzzle_game/app/modules/main_game/views/widgets/reset_game_button.dart';
import 'package:puzzle_game/app/modules/main_game/views/widgets/setting_button.dart';
import 'package:puzzle_game/app/modules/main_game/views/widgets/user_name_tile.dart';
import 'package:puzzle_game/utils/my_utils.dart';
import 'package:puzzle_game/widgets/exit_dialog.dart';

import '../controllers/main_game_controller.dart';

class MainGameView extends GetView<MainGameController> {
  @override
  Widget build(BuildContext context) {
    MyUtils.makeScreenResponsive(context);
    return WillPopScope(
      onWillPop: () async {
        bool shouldReturn = false;
        await Get.dialog(ExitDialog());
        return shouldReturn;
      },
      child: Scaffold(
        body: Container(
          width: Get.width,
          height: Get.height,
          decoration: BoxDecoration(
            color: Color(0xFF1A1614),
            image: DecorationImage(
              image: AssetImage(
                "assets/images/new_main_bg.png",
              ),
              fit: BoxFit.contain,
            ),
          ),
          child: Container(
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
                        HelpButton(),
                        SizedBox(width: 5.1.w),
                        SettingButton(),
                      ],
                    ),
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
                            MaximizeButton(),
                            PauseButton(),
                          ],
                        ),
                        Container(
                          height: 130.h,
                          child: Lottie.asset(
                            "assets/lotties/heli_new1.json",
                            height: 190.h,
                            width: 170.w,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LeaderboardButton(),
                            ResetGameButton(),
                          ],
                        ),
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
                        height: 810.h - 115.5.h,
                        width: (Get.width * 0.85) - (Get.width * 0.04),
                        child: Game(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
