import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/app/modules/login/views/cut_scene.dart';
import 'package:puzzle_game/app/routes/app_pages.dart';
import 'package:puzzle_game/utils/my_utils.dart';

enum SelectedCharacter { no, first, second }

class ChooseCharacterController extends GetxController {
  //TODO: Implement ChooseCharacterController
  //TODO: Implement RegisterController

  final userNameController = TextEditingController();

  final selectedCharacter = SelectedCharacter.no.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  goToLogin() {
    Get.toNamed(Routes.LOGIN);
  }

  playGame() {
    if (selectedCharacter.value == SelectedCharacter.no) {
      MyUtils.showToast("Please choose character");
    } else if (userNameController.text.isEmpty) {
      MyUtils.showToast("Please enter Player Name");
    } else {
      // MyUtils.showToast("Your game is about to start");
     // Get.toNamed(Routes.MAIN_GAME);
      Get.to(VideoApp());
    }

    print("Play as a guest is clicked");
  }
}
