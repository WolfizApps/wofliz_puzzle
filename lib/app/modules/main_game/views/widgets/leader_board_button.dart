import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/app/modules/main_game/controllers/main_game_controller.dart';
import 'package:puzzle_game/utils/my_utils.dart';

class LeaderboardButton extends StatelessWidget {
  final controller = Get.find<MainGameController>();
  @override
  Widget build(BuildContext context) {
    MyUtils.makeScreenResponsive(context);
    return InkWell(
      onTap: controller.showLeaderBoard,
      child: Container(
        height: 53.w,
        width: 53.w,
        constraints: BoxConstraints(maxHeight: 100, maxWidth: 100),
        child: Image.asset("${controller.assetForLevel("assets/images/leader_board_icon")}.png"),
      ),
    );
  }
}
