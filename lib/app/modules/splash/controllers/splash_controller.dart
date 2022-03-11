import 'dart:async';

import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../../utils/my_storage.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  VideoPlayerController? videoController;

  @override
  void onInit() {
    super.onInit();
    videoController =
        VideoPlayerController.asset('assets/videos/splash.mp4')
          ..initialize().then(
            (_) {},
          )
          ..addListener(() async {});
    videoController!.play();
    checkPresence();
  }

  Future<void> checkPresence() async {
    await Future.delayed(Duration(milliseconds: 4000));
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
  void onClose() {
    videoController!.pause();
    videoController!.dispose();
  }
}
