import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/choose_character_controller.dart';

class ChooseCharacterView extends GetView<ChooseCharacterController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
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
                      margin: EdgeInsets.only(top: Get.height / 20, left: 10),
                      child: Image.asset(
                        "assets/images/characters_bg.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  // height: 285,
                  margin: EdgeInsets.only(
                    top: 170,
                    left: 50,
                    right: 48,
                  ),
                  child: Stack(
                    children: [
                      Visibility(
                        visible: controller.selectedCharacter.value ==
                            SelectedCharacter.first,
                        child: Container(
                          height: 285,
                          width: 125,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/selected_charcter_dotted_box.png",
                                  ),
                                  invertColors: true)),
                          alignment: Alignment.topRight,
                        ),
                      ),
                      Visibility(
                        visible: controller.selectedCharacter.value ==
                            SelectedCharacter.first,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 40),
                            child: Image.asset(
                              "assets/images/done_icon.png",
                              height: 40,
                              width: 40,
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: controller.selectedCharacter.value ==
                            SelectedCharacter.second,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: 285,
                            width: 125,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      "assets/images/selected_charcter_dotted_box.png",
                                    ),
                                    invertColors: true)),
                            alignment: Alignment.topRight,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: controller.selectedCharacter.value ==
                            SelectedCharacter.second,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 100),
                            child: Image.asset(
                              "assets/images/done_icon.png",
                              height: 40,
                              width: 40,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                flex: 6,
                                child: InkWell(
                                  onTap: () {
                                    controller.selectedCharacter.value =
                                        SelectedCharacter.first;
                                  },
                                  child: Container(
                                    height: 285,
                                    width: 125,
                                    child: Image.asset(
                                      "assets/images/first_character.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 53,
                              ),
                              Flexible(
                                flex: 6,
                                child: InkWell(
                                  onTap: () {
                                    controller.selectedCharacter.value =
                                        SelectedCharacter.second;
                                  },
                                  child: Container(
                                    height: 285,
                                    width: 125,
                                    child: Image.asset(
                                      "assets/images/second_character.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Flexible(
                            child: Container(
                              alignment: Alignment.center,
                              height: 46,
                              width: 262,
                              margin: EdgeInsets.only(top: 30),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/edit_text_bg2.png",
                                  ),
                                  Container(
                                    height: 46,
                                    width: 262,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 38.0),
                                      child: TextFormField(
                                        keyboardType:
                                            TextInputType.text,
                                        controller: controller.userNameController,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 22,
                                            fontFamily: "Babybo"),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Player Name",
                                            hintStyle: TextStyle(
                                                color: Color(0xFF272B3C),
                                                fontSize: 22,
                                                fontFamily: "Babybo")),
                                      ),
                                    ),
                                  ),
                                ],
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
                    padding: EdgeInsets.only(bottom: Get.height / 40),
                    child: InkWell(
                      onTap: controller.playGame,
                      child: Image.asset(
                        "assets/images/play_button.png",
                        height: 76,
                        width: 278,
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
