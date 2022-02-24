import 'dart:async';

import 'package:get/get.dart';

import '../../../../utils/my_storage.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkPresence();
  }

  Future<void> checkPresence() async {
    await Future.delayed(Duration(seconds: 3));
    if (!(await MyStorage.readIsUserLoggedIn())) {
      Get.offNamed(Routes.REGISTER);
    } else {
      Get.offNamed(Routes.CHOOSE_CHARACTER);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
