import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:puzzle_game/app/modules/register/views/register_view.dart';
import 'package:puzzle_game/app/routes/app_pages.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    print(controller.count.value.toString());
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Image.asset("assets/gif/spalshscreen.gif", fit: BoxFit.cover),
    ));
  }
}
