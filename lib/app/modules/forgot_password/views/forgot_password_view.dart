import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/utils/my_utils.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
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
                  height: 560.h,
                  // margin: EdgeInsets.only(top: 105.h),
                  constraints: BoxConstraints(
                    maxWidth: 450,
                    maxHeight: 560,
                  ),
                  child: Image.asset(
                    "assets/images/forgot_password_new_bg.png",
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
                  margin: EdgeInsets.only(top: 420.h),
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
                              contentPadding: EdgeInsets.only(top: 2, left: 3),
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
                      Flexible(
                        child: SizedBox(
                          height: 85,
                        ),
                      ),
                      SizedBox(
                        height: 65.h,
                      ),
                   /*   InkWell(
                        onTap: controller.resetPassword,
                        child: Container(
                          width: 238,
                          height: 66,
                          // margin: EdgeInsets.only(left: 80.w, right: 80.w),
                          child: Image.asset(
                            "assets/images/reset_btn.png",
                            fit: BoxFit.fill,
                            width: 238,
                            height: 106.h,
                          ),
                        ),
                      ),*/
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
                      onTap: controller.resetPassword,
                      child: Image.asset(
                        "assets/images/reset_btn.png",
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
    );
  }
}
