import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import '../controllers/choose_character_controller.dart';

class ChooseCharacterView extends GetView<ChooseCharacterController> {
  @override
  Widget build(BuildContext context) {
    ChooseCharacterController controller=Get.put(ChooseCharacterController());
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(457, 812),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(
          () => Container(
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
                      height: 650.h,
                      margin: EdgeInsets.only(top: Get.height / 20.h, left: 10.w),
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
                      Visibility(
                        visible: controller.selectedCharacter.value ==
                            SelectedCharacter.first,
                        child: Container(
                          height: 285.h,
                          width: 130.w,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/selectboy.png",

                                  ),
                                //  fit: BoxFit.fill,
                                  invertColors: false)),
                          alignment: Alignment.topRight,
                        ),
                      ),
                      // Visibility(
                      //   visible: controller.selectedCharacter.value ==
                      //       SelectedCharacter.first,
                      //   child: Align(
                      //     alignment: Alignment.topCenter,
                      //     child: Padding(
                      //       padding: EdgeInsets.only(right: 40.w),
                      //       child: Image.asset(
                      //         "assets/images/done_icon.png",
                      //         height: 40.h,
                      //         width: 40.w,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Visibility(
                        visible: controller.selectedCharacter.value ==
                            SelectedCharacter.second,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: 285.h,
                            width: 130.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      "assets/images/selectgirl.png",
                                    ),
                                    //fit: BoxFit.fill,
                                    invertColors: false)),
                            alignment: Alignment.topRight,
                          ),
                        ),
                      ),
                      // Visibility(
                      //   visible: controller.selectedCharacter.value ==
                      //       SelectedCharacter.second,
                      //   child: Align(
                      //     alignment: Alignment.topRight,
                      //     child: Padding(
                      //       padding: EdgeInsets.only(right: 100.w),
                      //       child: Image.asset(
                      //         "assets/images/done_icon.png",
                      //         height: 40.h,
                      //         width: 40.w,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 6,
                                child: InkWell(
                                  onTap: () {
                                    controller.selectedCharacter.value =
                                        SelectedCharacter.first;
                                  },
                                  child: Container(
                                    height: 285.h,
                                    width: 125.w,
                                    child: Image.asset(
                                      "assets/images/first_character.png",
                                      fit: kIsWeb || Platform.isWindows? BoxFit.fill:BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              // Flexible(
                              //   child: SizedBox(
                              //     width: 53.w,
                              //   ),
                              // ),
                              Flexible(
                                flex: 6,
                                child: InkWell(
                                  onTap: () {
                                    controller.selectedCharacter.value =
                                        SelectedCharacter.second;
                                  },
                                  child: Container(
                                    height: 285.h,
                                    width: 125.w,
                                    child: Image.asset(
                                      "assets/images/second_character.png",
                                      fit: kIsWeb || Platform.isWindows? BoxFit.fill:BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Flexible(
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(left: 65.w, right: 65.w),
                              width: 262.w,
                              height: 46.h,

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
                                keyboardType: TextInputType.emailAddress,
                                controller: controller.userNameController,
                                style: TextStyle(
                                    color: Color(0XFF272B3C),
                                    fontSize: 22,
                                    fontFamily: "Babybo"),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email",
                                    hintStyle: TextStyle(
                                        color: Color(0XFF272B3C),
                                        fontSize: 22,
                                        fontFamily: "Babybo")),
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
