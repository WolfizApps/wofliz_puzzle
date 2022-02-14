import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
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
              image: AssetImage("assets/images/register_main_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      width: Get.width,
                      height: 470,
                      margin: EdgeInsets.only(top: 100),
                      child: Image.asset(
                        "assets/images/login_sub_bg.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 235),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 47,
                        width: 245,
                        child: Stack(
                          children: [
                            Image.asset("assets/images/edit_text_bg1.png"),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
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
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 47,
                        width: 245,
                        child: Stack(
                          children: [
                            Image.asset("assets/images/edit_text_bg1.png"),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
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
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 86,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: controller.goToForgotPassword,
                            child: Text(
                              "Don't  have an account?",
                              style: TextStyle(
                                  fontFamily: "Babybo",
                                  fontSize: 16,
                                  color: Color(0xFFA2A2A2)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      InkWell(
                        onTap: controller.login,
                        child: Image.asset(
                          "assets/images/login_btn.png",
                          height: 76,
                          width: 238,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: controller.playAsaGuest,
                        child: Image.asset(
                          "assets/images/paly_as_guest_btn.png",
                          height: 86,
                          width: 268,
                        ),
                      ),
                      // Flexible(child: SizedBox(height: double.infinity,))
                      // Expanded(child: Container())
                    ],
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
