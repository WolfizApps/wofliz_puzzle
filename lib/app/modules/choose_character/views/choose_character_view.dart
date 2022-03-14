import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/utils/my_utils.dart';
import 'package:puzzle_game/widgets/exit_dialog.dart';

import '../controllers/choose_character_controller.dart';

class ChooseCharacterView extends GetView<ChooseCharacterController> {
  @override
  Widget build(BuildContext context) {
    // ChooseCharacterController controller=Get.put(ChooseCharacterController());
    /*  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);*/
    MyUtils.makeScreenResponsive(context);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: WillPopScope(
        onWillPop: () async {
          bool shouldReturn = false;
          await Get.dialog(ExitDialog());
          return shouldReturn;
        },
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              height: Get.height,
              width: Get.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/choos_character_bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      height: 560.h,
                      constraints: BoxConstraints(
                        maxWidth: 450,
                        maxHeight: 560,
                      ),
                      child: Image.asset(
                        "assets/images/characters_bg.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    // height: 285,
                    margin: EdgeInsets.only(
                      top: 230.h,
                      left: 50.w,
                      right: 48.w,
                    ),
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: Get.width,
                          constraints: BoxConstraints(
                            maxWidth: 380,
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 220.h,
                                // width: 125.w,
                                child: Image.asset(
                                  "assets/images/first_character.png",
                                  fit: kIsWeb || Platform.isWindows
                                      ? BoxFit.fill
                                      : BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                left: 10.w, right: 15.w, top: 30.h),
                                child: Text(
                              "Enter your character's name",
                              style: TextStyle(
                                  color: Color(0XFF272B3C),
                                  fontSize: 22,
                                  fontFamily: "Babybo"),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                constraints: BoxConstraints(
                                  maxWidth: 450,
                                  maxHeight: 560,
                                ),
                                margin: EdgeInsets.only(
                                    left: 25.w, right: 30.w, top: 10.h),
                                width: 40.sw,
                                height: 52.h,
                                padding: EdgeInsets.only(left: 8.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFD6B792),
                                      Color(0xFFB09274)
                                    ],
                                  ),
                                ),
                                child: TextFormField(
                                  keyboardType: TextInputType.name,
                                  cursorColor: Colors.white,
                                  textAlign: TextAlign.center,
                                  controller: controller.userNameController,
                                  style: TextStyle(
                                      color: Color(0XFF272B3C),
                                      fontSize: 22,
                                      fontFamily: "Babybo"),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.only(left: 3, top: 3),
                                    hintText: "E.x Bob",
                                    hintStyle: TextStyle(
                                        color: Color(0XFF272B3C),
                                        fontSize: 22,
                                        fontFamily: "Babybo"),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: Get.height / 40.h),
                      child: InkWell(
                        onTap: () => controller.playGame(context),
                        child: Image.asset(
                          "assets/images/play_button.png",
                          height: 76.h,
                          width: 278.w,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
