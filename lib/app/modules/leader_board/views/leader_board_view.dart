import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../controllers/leader_board_controller.dart';

class LeaderBoardView extends GetView<LeaderBoardController> {
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
                  margin: EdgeInsets.only(top: 100),
                  child: AnimationLimiter(
                    child: ListView.builder(
                        // physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        // shrinkWrap: true,
                        itemCount: controller.listOfDuas["duas"].length,
                        /* gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 6,
                          crossAxisSpacing: 6,
                        ),*/
                        itemBuilder: (context, index) {
                          var item = controller.listOfDuas["duas"][index];
                          return AnimationConfiguration.staggeredGrid(
                            position: index,
                            duration: const Duration(milliseconds: 1500),
                            columnCount: 3,
                            child: ScaleAnimation(
                              child: FadeInAnimation(
                                child: controller.buildCard(
                                    index + 1, item['name'], item['steps']),
                              ),
                            ),
                          );
                        }),
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
