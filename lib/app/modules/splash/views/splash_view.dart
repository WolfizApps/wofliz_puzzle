import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../../utils/my_storage.dart';
import '../../../routes/app_pages.dart';

class SplashView extends StatefulWidget {
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/web_bg_img.jpg"),
          ),
        ),
        child: Center(
          child: Image.asset('assets/gif/splash.gif'),
        ),
      ),
    );
  }
}
