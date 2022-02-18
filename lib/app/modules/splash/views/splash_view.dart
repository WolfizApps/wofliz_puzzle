import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:puzzle_game/app/modules/register/views/register_view.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 7),
            ()=>Get.to(RegisterView())
        );

    return Scaffold(

      body:
         Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset("assets/gif/spalshscreen.gif",fit:BoxFit.cover),
        )

    );
  }
}
