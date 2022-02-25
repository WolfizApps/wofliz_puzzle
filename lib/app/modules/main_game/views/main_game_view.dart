import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/app/modules/main_game/views/layouts/mobile.dart';
import 'package:puzzle_game/utils/my_utils.dart';
import 'package:puzzle_game/widgets/exit_dialog.dart';
import '../controllers/main_game_controller.dart';
import 'layouts/web.dart';

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
                "assets/images/bg.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Get.width > Get.height ? WebLayout() : MobileLayout(),
        ),
      ),
    );
  }
}
