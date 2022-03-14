import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/utils/my_utils.dart';

import '../controllers/leader_board_controller.dart';
import '../models/leaderboard.dart';

class LeaderBoardView extends GetView<LeaderBoardController> {
  @override
  Widget build(BuildContext context) {
    // LeaderBoardController controller=Get.put(LeaderBoardController());

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    MyUtils.makeScreenResponsive(context);
    return WillPopScope(
      onWillPop: () => willpop(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(kIsWeb
                    ? "assets/images/web_bg_img.jpg"
                    : "assets/images/register_main_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                      controller.list.clear();
                    },
                    child: Align(
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
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 100),
                    child: FutureBuilder<List<LeaderBoard>>(
                      future: controller.get_board(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return AnimationLimiter(
                            child: ListView.builder(
                                itemCount: snapshot.data?.length,
                                itemBuilder: (context, index) {
                                  var item = snapshot.data;
                                  return Container(
                                    width: Get.width,
                                    margin:
                                        EdgeInsets.only(left: 30, right: 30),
                                    constraints: BoxConstraints(
                                      maxWidth: 500,
                                    ),
                                    child: AnimationConfiguration.staggeredGrid(
                                        position: index,
                                        duration:
                                            const Duration(milliseconds: 200),
                                        columnCount: 3,
                                        child: ScaleAnimation(
                                          child: FadeInAnimation(
                                            child: controller.buildCard(
                                              index + 1,
                                              item![index].name,
                                              item[index].stage,
                                            ),
                                          ),
                                        )),
                                  );
                                }),
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  willpop() {
    Get.back();
    controller.list.clear();
  }
}
