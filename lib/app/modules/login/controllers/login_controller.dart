import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/app/routes/app_pages.dart';
import 'package:puzzle_game/utils/my_storage.dart';
import 'package:puzzle_game/utils/my_utils.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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

  login() async {
    if (emailController.text == "") {
      MyUtils.showToast("Please enter email");
    } else if (passwordController.text == "") {
      MyUtils.showToast("Please enter password");
    } else {
      try {
        UserCredential credentials = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
        // MyUtils.showToast("User loggedIn successfully.");
        MyStorage.writeIsUserLoggedIn(true);
        MyStorage.writeUserEmail(emailController.text);
        MyStorage.writeUserPassword(passwordController.text);
        Get.offNamed(Routes.CHOOSE_CHARACTER);
        /* if (credentials.credential!.token != null) {
          MyUtils.showToast("User loggedIn successfully.");
        } else {
          MyUtils.showToast("Invalid email or password.");
        }*/
      } catch (e) {
        print("Login UnSuccessful");
        MyUtils.showToast("There is some error in Login, please try again");
      }
    }
  }

  goToRegister() {
    Get.offNamed(Routes.REGISTER);
  }

  playAsaGuest() {
    print("Play as a guest is clicked");
    Get.offNamed(Routes.CHOOSE_CHARACTER);
  }

  goToForgotPassword() {
    Get.toNamed(Routes.FORGOT_PASSWORD);
  }
}
