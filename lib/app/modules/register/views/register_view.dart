import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            // height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/images/register_main_bg.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            /*height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,*/
            /*decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/register_main_bg.png"),
                fit: BoxFit.cover,
              ),
            ),*/
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
                          "assets/images/register_sub_bg.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    child: Container(
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
                                    controller:
                                        controller.confirmPasswordController,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontFamily: "Babybo"),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Retype Password",
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
                            height: 17,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                          SizedBox(
                            height: 35,
                          ),
                          InkWell(
                            onTap: controller.register,
                            child: Image.asset(
                              "assets/images/register_btn.png",
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
