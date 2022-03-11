import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/utils/my_utils.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    MyUtils.makeScreenResponsive(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/forgot_password_bg.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Stack(
            children: [
              Container(
                child: Container(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Flexible(
                            child: SizedBox(
                              child: Container(
                                width: Get.width,
                                height: 520.h,
                                margin: EdgeInsets.only(
                                    top: 135.h, left: 30.w, right: 30.w),
                                child: Image.asset(
                                  "assets/images/forgot_password_new_bg.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 400.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Container(
                                alignment: Alignment.center,
                                margin:
                                    EdgeInsets.only(left: 82.w, right: 82.w),
                                width: ScreenUtil().screenWidth,
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
                                  cursorColor: Colors.white,
                                  controller: controller.emailController,
                                  style: TextStyle(
                                      color: Color(0XFF272B3C),
                                      fontSize: 22,
                                      fontFamily: "Babybo"),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.only(left: 5, bottom: 2),
                                      hintText: "Email",
                                      hintStyle: TextStyle(
                                          color: Color(0XFF272B3C),
                                          fontSize: 22,
                                          fontFamily: "Babybo")),
                                ),
                              ),
                            ),
                            Flexible(
                              child: SizedBox(
                                height: 180,
                              ),
                            ),
                            Flexible(
                              child: SizedBox(
                                height: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 36.0),
                          child: InkWell(
                            onTap: controller.resetPassword,
                            child: Image.asset(
                              "assets/images/reset_btn.png",
                              height: 86.h,
                              width: 268.w,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
