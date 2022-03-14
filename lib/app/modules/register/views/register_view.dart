import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/widgets/exit_dialog.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return WillPopScope(
      onWillPop: () async {
        bool shouldReturn = false;
        await Get.dialog(ExitDialog());
        return shouldReturn;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(kIsWeb ? "assets/images/web_bg_img.jpg": "assets/images/register_main_bg.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Stack(
              children: [
                Center(
                  child: Container(
                    height: 520.h,
                    constraints: BoxConstraints(
                      maxWidth: 450,
                      maxHeight: 520,
                    ),
                    child: Image.asset(
                      "assets/images/register_sub_bg.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: Get.width,
                    constraints: BoxConstraints(
                      maxWidth: 380,
                    ),
                    margin: EdgeInsets.only(top: 250.h),
                    padding: EdgeInsets.only(left: 70, right: 70),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          // margin: EdgeInsets.only(left: 45.w, right: 45.w),
                          width: ScreenUtil().screenWidth,
                          padding: EdgeInsets.only(left: 8.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            gradient: LinearGradient(
                              colors: [Color(0xFF606060), Color(0xFF2F2F2F)],
                            ),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: controller.emailController,
                            cursorColor: Colors.white,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontFamily: "Babybo"),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.only(top: 2, left: 3),
                                hintText: "Email",
                                hintStyle: TextStyle(
                                    color: Color(0xFFA2A2A2),
                                    fontSize: 22,
                                    fontFamily: "Babybo")),
                          ),
                        ),
                        Flexible(
                          child: SizedBox(
                            height: 16.h,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: ScreenUtil().screenWidth,
                          padding: EdgeInsets.only(left: 8.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [Color(0xFF606060), Color(0xFF2F2F2F)],
                            ),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            cursorColor: Colors.white,
                            controller: controller.passwordController,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontFamily: "Babybo"),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.only(top: 2, left: 3),
                                hintText: "Password",
                                hintStyle: TextStyle(
                                    color: Color(0xFFA2A2A2),
                                    fontSize: 22,
                                    fontFamily: "Babybo")),
                          ),
                        ),
                        Flexible(
                          child: SizedBox(
                            height: 16.h,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: ScreenUtil().screenWidth,
                          padding: EdgeInsets.only(left: 8.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [Color(0xFF606060), Color(0xFF2F2F2F)],
                            ),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            cursorColor: Colors.white,
                            controller: controller.confirmPasswordController,
                            textInputAction: TextInputAction.done,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontFamily: "Babybo"),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.only(top: 2.h, left: 3.w),
                                hintText: "Confirm Password",
                                hintStyle: TextStyle(
                                    color: Color(0xFFA2A2A2),
                                    fontSize: 22,
                                    fontFamily: "Babybo")),
                          ),
                        ),
                        Flexible(
                          child: SizedBox(
                            height: 65,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 0.w,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Already have account?",
                                style: TextStyle(
                                    fontFamily: "Babybo",
                                    fontSize: 16,
                                    color: Color(0xFFA2A2A2)),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              InkWell(
                                onTap: controller.goToLogin,
                                child: Text(
                                  "Login here",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFFFFE948),
                                      fontFamily: "Babybo"),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        InkWell(
                          onTap: controller.register,
                          child: Container(
                            width: 238,
                            height: 66,
                            // margin: EdgeInsets.only(left: 80.w, right: 80.w),
                            child: Image.asset(
                              "assets/images/register_btn.png",
                              fit: BoxFit.fill,
                              width: 238,
                              height: 106.h,
                            ),
                          ),
                        ),
                        Flexible(
                          child: SizedBox(
                            height: 20.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: Get.width > Get.height ? 20 : 48.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      InkWell(
                        onTap: controller.playAsaGuest,
                        child: Image.asset(
                          "assets/images/paly_as_guest_btn.png",
                          height: 86.h,
                          width: 268.w,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
