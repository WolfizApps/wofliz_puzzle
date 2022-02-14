import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/utils/my_utils.dart';

class ForgotPasswordController extends GetxController {
  //TODO: Implement LoginController

  final emailController = TextEditingController();

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

  resetPassword() async {
    if (emailController.text == "") {
      MyUtils.showToast("Please enter email");
    } else {
      try {
        var user = await FirebaseAuth.instance
            .sendPasswordResetEmail(email: emailController.text);
        print("Email has been Sent!");
        MyUtils.showToast("Please reset your password from your email");
        // Get.snackbar("","Login Successful");
      } catch (e) {
        MyUtils.showToast("No email fount. Please register and try again.");
      }
    }
  }
}
