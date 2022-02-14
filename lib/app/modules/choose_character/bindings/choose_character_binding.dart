import 'package:get/get.dart';

import '../controllers/choose_character_controller.dart';

class ChooseCharacterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChooseCharacterController>(
      () => ChooseCharacterController(),
    );
  }
}
