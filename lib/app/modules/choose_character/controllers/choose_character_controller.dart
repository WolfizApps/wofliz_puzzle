import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/app/modules/login/views/cut_scene.dart';
import 'package:puzzle_game/app/routes/app_pages.dart';
import 'package:puzzle_game/utils/my_storage.dart';
import 'package:puzzle_game/utils/my_utils.dart';

class ChooseCharacterController extends GetxController {
  final userNameController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  void playGame(BuildContext context) async {
    if (userNameController.text.isEmpty) {
      MyUtils.showToast("Please enter Player Name");
    } else {
      await MyStorage.writeUserName(userNameController.text);
      Navigator.push(context,MaterialPageRoute(builder: (_) => InitialVideo()));
    }
  }

  @override
  void onClose() {}
}
