import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/app/modules/login/views/cut_scene.dart';
import 'package:puzzle_game/utils/my_storage.dart';
import 'package:puzzle_game/utils/my_utils.dart';

import '../../../routes/app_pages.dart';

enum SelectedCharacter { no, first, second }

class ChooseCharacterController extends GetxController {
  final userNameController = TextEditingController();
  final selectedCharacter = SelectedCharacter.no.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void playGame() async {
    if (selectedCharacter.value == SelectedCharacter.no) {
      MyUtils.showToast("Please choose character");
    } else if (userNameController.text.isEmpty) {
      MyUtils.showToast("Please enter Player Name");
    } else {
      await MyStorage.writeUserName(userNameController.text);
      Get.toNamed(Routes.MAIN_GAME);
    }
  }

  @override
  void onClose() {
    selectedCharacter.close();
  }
}
