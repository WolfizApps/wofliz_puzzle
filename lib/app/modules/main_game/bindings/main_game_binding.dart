import 'package:get/get.dart';

import '../controllers/main_game_controller.dart';

class MainGameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainGameController>(
      () => MainGameController(),
    );
  }
}
