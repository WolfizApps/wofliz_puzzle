import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
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
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/forgot_password_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [


                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Container(
                      width: 54.w,
                      height: 54.h,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 15.h, left: 20.w),
                      child: Image.asset(
                        "assets/images/back_btn.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  child: Container(
                    width: Get.width,
                  //  height:500.h ,
                  //  alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 165.h),
                    child: Image.asset(
                      "assets/images/forgot_password_new_bg.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),


                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 450.h),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      Flexible(
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 65.w, right: 65.w),
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
                            controller: controller.emailController,
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
                  child: InkWell(
                    onTap: controller.resetPassword,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 40.h ),
                      child: Image.asset(
                        "assets/images/reset_btn.png",
                        height: 76.h,
                        width: 238.w,
                      ),
                    ),
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
