import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/app/routes/app_pages.dart';
import 'package:puzzle_game/utils/my_storage.dart';
import 'package:puzzle_game/utils/my_utils.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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

  register() async {
    if (emailController.text == "") {
      MyUtils.showToast("Please enter email");
    } else if (passwordController.text == "") {
      MyUtils.showToast("Please enter password");
    } else if (passwordController.text != confirmPasswordController.text) {
      MyUtils.showToast("Both passwords are not matched");
    } else {
      try {
        var credenitals = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);

        if (credenitals.user!.uid != null) {
          // MyUtils.showToast("User registered successfully.");
          MyStorage.writeIsUserLoggedIn(true);
          MyStorage.writeUserEmail(emailController.text);
          MyStorage.writeUserPassword(passwordController.text);
          Get.offNamed(Routes.CHOOSE_CHARACTER);
        } else {
          MyUtils.showToast("User not registered.");
        }
      } catch (exp) {
        MyUtils.showToast(exp.toString());
      }
    }
  }

  playAsaGuest() {
    Get.offNamed(Routes.CHOOSE_CHARACTER);
  }
}
