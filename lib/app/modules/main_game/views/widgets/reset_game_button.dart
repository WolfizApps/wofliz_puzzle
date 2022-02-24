import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/app/modules/main_game/controllers/main_game_controller.dart';

class ResetGameButton extends StatelessWidget {
  final controller = Get.find<MainGameController>();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: controller.resetGame,
      child: Image.asset(
        "assets/images/reset_game_icon.png",
        height: 53.w,
        width: 53.w,
      ),
    );
  }
}
