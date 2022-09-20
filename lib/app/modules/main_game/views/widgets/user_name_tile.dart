import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/app/modules/main_game/controllers/main_game_controller.dart';
import 'package:puzzle_game/utils/my_utils.dart';

class UsernameTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyUtils.makeScreenResponsive(context);
    final controller = Get.find<MainGameController>();

    return Container(
      height: 95.h,
      width: 225.w,
      constraints: BoxConstraints(
        maxWidth: 300,
        maxHeight: 200,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("${controller.assetForLevel('assets/images/main_board_player_bg')}.png"),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.only(top: 15, left: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 10,
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 15),
            child: Image.asset(
              "assets/images/user_icon.png",
              width: 25.w,
              height: 30.h,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.playerName.value,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                      fontFamily: "leiralite",
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Steps: ",
                          maxLines: 1,
                          style: TextStyle(
                            color: Color(0xFFFFE948),
                            fontSize: 18,
                            fontFamily: "Babybo",
                          ),
                        ),
                        Text(
                          controller.board.value.steps.value.toString(),
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "Babybo",
                          ),
                        ),
                      ],
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
