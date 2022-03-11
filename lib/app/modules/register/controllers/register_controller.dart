import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/app/routes/app_pages.dart';
import 'package:puzzle_game/utils/my_storage.dart';
import 'package:puzzle_game/utils/my_utils.dart';

class RegisterController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  void goToLogin() {
    Get.toNamed(Routes.LOGIN);
  }

  register() async {
    if (emailController.text.isEmpty) {
      MyUtils.showToast("Please enter email");
    } else if (passwordController.text.isEmpty) {
      MyUtils.showToast("Please enter password");
    } else if (passwordController.text.length < 6) {
      MyUtils.showToast("Password must be greater than 5 characters");
    } else if (passwordController.text != confirmPasswordController.text) {
      MyUtils.showToast("Both passwords are not matched");
    } else if(!isValidEmail(emailController.text)){
      MyUtils.showToast("Emil is not correct");
    } else {
      try {
        var credenitals = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);

        if (credenitals.user?.uid != null) {
          await MyStorage.writeIsUserLoggedIn(true);
          await MyStorage.writeUserEmail(emailController.text);
          await MyStorage.writeUserPassword(passwordController.text);
          Get.offNamed(Routes.CHOOSE_CHARACTER);
        } else {
          MyUtils.showToast("User not registered.");
        }
      } catch (exp) {
        MyUtils.showToast(MyUtils.getFormattedString(exp));
      }
    }
  }

  playAsaGuest() {
    Get.toNamed(Routes.CHOOSE_CHARACTER);
  }

  isValidEmail(email) {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  @override
  void onClose() {}
}
