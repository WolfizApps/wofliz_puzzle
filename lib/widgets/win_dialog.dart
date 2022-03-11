import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:puzzle_game/app/routes/app_pages.dart';

AlertDialog winDialog({required int steps, required String userName}) {

  return AlertDialog(
    backgroundColor: Colors.transparent,
    insetPadding: EdgeInsets.zero,
    elevation: 0,
    content: kIsWeb
        ? Container(
            constraints: BoxConstraints(maxWidth: 280, maxHeight: 500),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Lottie.asset('assets/lotties/new_victory.json'),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 115,
                      child: Column(
                        children: [

                          SizedBox(height: 14),
                          Text(
                            userName,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 33,
                            ),
                          ),
                          Text(
                            "You escaped from jungle in $steps steps",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: Get.back,
                  child: Container(
                    width: 238,
                    height: 76,
                    child: Image.asset(
                      'assets/images/play_again_icon.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          )
        : Container(
            constraints: BoxConstraints(maxWidth: 320, maxHeight: 540),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Lottie.asset('assets/lotties/new_victory.json'),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 95,
                        child: Column(
                          children: [

                            SizedBox(height: 14),
                            Text(
                              "CONGRATS!",
                              style: TextStyle(
                                color: Color(0xFF707070),
                                fontFamily: "leiralite",
                                fontSize: 33,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 60, right: 60),
                              alignment: Alignment.center,
                              child: Text(
                                "You escaped from jungle in  $steps steps",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF707070),
                                  fontFamily: "Babybo",
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: Get.back,
                        child: Container(
                          width: 125,
                          height: 56,
                          child: Image.asset(
                            'assets/images/play_again_icon.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      GestureDetector(
                        onTap: openLeaderBoard,
                        child: Container(
                          width: 125,
                          height: 56,
                          child: Image.asset(
                            'assets/images/leader_board_icon_new.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
  );
}

void openLeaderBoard() {
  Get.back();
  Get.toNamed(Routes.LEADER_BOARD);
}
