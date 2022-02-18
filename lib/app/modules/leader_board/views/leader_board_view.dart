import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../controllers/leader_board_controller.dart';
import '../models/leaderboard.dart';

class LeaderBoardView extends GetView<LeaderBoardController> {


  @override
  Widget build(BuildContext context) {
    LeaderBoardController controller=Get.put(LeaderBoardController());

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return WillPopScope(
      onWillPop: ()=>willpop(),
      child: Scaffold(
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
                  GestureDetector(
                    onTap: (){
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

                    child:FutureBuilder<List<LeaderBoard>>(
                      future: controller.get_board(),
                      builder: ( context,snapshot){
                        if(snapshot.hasData) {
                          return AnimationLimiter(
                            child:
                            ListView.builder(
                              // physics: const NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.only(left: 8, right: 8),
                                // shrinkWrap: true,

                                itemCount: snapshot.data?.length,
                                /* gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 6,
                            crossAxisSpacing: 6,
                          ),*/
                                itemBuilder: (context, index) {
                                  var item = snapshot.data;

                                  return AnimationConfiguration.staggeredGrid(
                                      position: index,
                                      duration: const Duration(milliseconds: 200),
                                      columnCount: 3,
                                      child: ScaleAnimation(
                                        child: FadeInAnimation(
                                          child: controller.buildCard(
                                            index + 1, item![index].name,
                                            item[index].stage,
                                          ),
                                        ),
                                      ));
                                }),
                          );
                        }
                        else{
                          return Center(child: CircularProgressIndicator(),);
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
    controller.list.clear();
  }
}
