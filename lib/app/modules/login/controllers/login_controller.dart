import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/app/modules/login/views/cut_scene.dart';
import 'package:puzzle_game/app/routes/app_pages.dart';
import 'package:puzzle_game/utils/my_storage.dart';
import 'package:puzzle_game/utils/my_utils.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> login() async {
    if (emailController.text.isEmpty) {
      MyUtils.showToast("Please enter email");
    } else if (passwordController.text.isEmpty) {
      MyUtils.showToast("Please enter password");
    } else if(!isValidEmail(emailController.text)){
      MyUtils.showToast("Emil is not correct");
    } else {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        await MyStorage.writeIsUserLoggedIn(true);
        await MyStorage.writeUserEmail(emailController.text);
        await MyStorage.writeUserPassword(passwordController.text);
        Get.offNamed(Routes.CHOOSE_CHARACTER);
      } catch (e) {
        // print("Login UnSuccessful");
        MyUtils.showToast(MyUtils.getFormattedString(e));
        // MyUtils.showToast("There is some error in Login, please try again");
      }
    }
  }

  void goToRegister() {
    Get.offNamed(Routes.FORGOT_PASSWORD);
  }

  void playAsaGuest() {
    Get.to(VideoApp());
  }

  void goToForgotPassword() {
    Get.toNamed(Routes.FORGOT_PASSWORD);
  }

  isValidEmail(email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  @override
  void onClose() {}
}
