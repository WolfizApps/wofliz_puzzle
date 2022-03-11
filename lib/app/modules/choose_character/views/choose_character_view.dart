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
          child: Container(
            height: Get.height,
            // height: 600,
            width: Get.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/choos_character_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      width: Get.width,
                      height: 550.h,
                      margin: EdgeInsets.only(
                          top: Get.height / 15.h /*, left: 10.w*/),
                      child: Image.asset(
                        "assets/images/characters_bg.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  // height: 285,
                  margin: EdgeInsets.only(
                    top: 170.h,
                    left: 50.w,
                    right: 48.w,
                  ),
                  child: Stack(
                    children: [
                      Column(
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
                          Flexible(
                              child: Padding(
                            padding: EdgeInsets.only(
                                left: 15.w, right: 35.w, top: 30.h),
                            child: Text(
                              "Enter your character's name",
                              style: TextStyle(
                                  color: Color(0XFF272B3C),
                                  fontSize: 22,
                                  fontFamily: "Babybo"),
                            ),
                          )),
                          Flexible(
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                  left: 35.w, right: 35.w, top: 10.h),
                              width: 262.w,
                              height: 52.h,
                              padding: EdgeInsets.only(left: 8.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [Color(0xFFD6B792), Color(0xFFB09274)],
                                ),
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
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
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: Get.height / 40.h),
                    child: InkWell(
                      onTap: controller.playGame,
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
    );
  }
}
