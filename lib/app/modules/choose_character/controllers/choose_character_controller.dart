import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/app/modules/login/views/cut_scene.dart';
import 'package:puzzle_game/utils/my_storage.dart';
import 'package:puzzle_game/utils/my_utils.dart';

class ChooseCharacterController extends GetxController {
  final userNameController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  void playGame() async {
    if (userNameController.text.isEmpty) {
      MyUtils.showToast("Please enter Player Name");
    } else {
      await MyStorage.writeUserName(userNameController.text);
      Get.to(InitialVideo());
    }
  }

  @override
  void onClose() {}
}
