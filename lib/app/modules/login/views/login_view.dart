import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    //Set the fit size (fill in the screen size of the device in the design) If the design is based on the size of the 360*690(dp)
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
              image: AssetImage("assets/images/register_main_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child:
          Container(
            child: Stack(
              children: [
                Column(
                  children: [
                    Flexible(
                      child: SizedBox(
                        child: Container(
                          width: Get.width,
                          height: 500.h,
                          margin: EdgeInsets.only(top: 165.h),
                          child: Image.asset(
                            "assets/images/login_sub_bg.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 350.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 65.w, right: 65.w),
                          width: ScreenUtil().screenWidth,
                          padding: EdgeInsets.only(left: 8.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF606060),
                                Color(0xFF2F2F2F)
                              ],
                            ),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: controller.emailController,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontFamily: "Babybo"),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email",
                                hintStyle: TextStyle(
                                    color: Color(0xFFA2A2A2),
                                    fontSize: 22,
                                    fontFamily: "Babybo")),
                          ),
                        ),
                      ),
                      Flexible(
                        child: SizedBox(
                          height: 16,
                        ),
                      ),
                      Flexible(
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 65.w, right: 65.w),
                          width: ScreenUtil().screenWidth,
                          padding: EdgeInsets.only(left: 8.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF606060),
                                Color(0xFF2F2F2F)
                              ],
                            ),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            controller: controller.passwordController,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontFamily: "Babybo"),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(
                                    color: Color(0xFFA2A2A2),
                                    fontSize: 22,
                                    fontFamily: "Babybo")),
                          ),
                        ),
                      ),
                      Flexible(
                        child: SizedBox(
                          height: 86,
                        ),
                      ),
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: InkWell(
                                onTap: controller.goToForgotPassword,
                                child: Text(
                                  "Don't  have an account?",
                                  style: TextStyle(
                                      fontFamily: "Babybo",
                                      fontSize: 16,
                                      color: Color(0xFFA2A2A2)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Flexible(
                        child: SizedBox(
                          height: 35.h,
                        ),
                      ),
                      Flexible(
                        child: InkWell(
                          onTap: controller.login,

                          child: Container(
                            margin: EdgeInsets.only(left: 170.w, right: 170.w),
                            child: Image.asset(
                              "assets/images/login_btn.png",
                              height: 76.h,
                              width: 238.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: SizedBox(
                          height: 20,
                        ),
                      ),

                      // Flexible(child: SizedBox(height: double.infinity,))
                      // Expanded(child: Container())
                    ],

                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 36.0),
                    child: InkWell(
                      onTap: controller.playAsaGuest,
                      child: Image.asset(
                        "assets/images/paly_as_guest_btn.png",
                        height: 86.h,
                        width: 268.w,
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
