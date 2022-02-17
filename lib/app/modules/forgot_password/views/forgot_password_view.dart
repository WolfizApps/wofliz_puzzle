import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
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
                  child: Container(
                    width: 54,
                    height: 54,
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 15, left: 20),
                    child: Image.asset(
                      "assets/images/back_btn.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: Get.width/1.2,
                  // height: 475,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 0),
                  child: Image.asset(
                    "assets/images/forgot_password_new_bg.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 335),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 47,
                        width: 220,
                        child: Stack(
                          children: [
                            Image.asset("assets/images/edit_text_bg2.png"),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: controller.emailController,
                                style: TextStyle(
                                    color: Color(0xFF272B3C),
                                    fontSize: 22,
                                    fontFamily: "Babybo"),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email",
                                    hintStyle: TextStyle(
                                        color: Color(0xFF272B3C),
                                        fontSize: 22,
                                        fontFamily: "Babybo")),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 180,
                      ),

                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: controller.resetPassword,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 40 ),
                      child: Image.asset(
                        "assets/images/reset_btn.png",
                        height: 76,
                        width: 238,
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
