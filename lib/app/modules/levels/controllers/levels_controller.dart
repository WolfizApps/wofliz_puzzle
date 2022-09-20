import 'package:get/get.dart';

import '../../main_game/controllers/main_game_controller.dart';

class LevelsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  void changeLevel(String level) {
    Get.back();
    Get.find<MainGameController>().changeLevel(level);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
