import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/utils/my_utils.dart';

class LeaderBoardController extends GetxController {
  //TODO: Implement LeaderBoardController

  final count = 0.obs;
  Map<String, dynamic> listOfDuas = {
    "duas": [
      {
        "name": "Rozzee",
        "steps": "75",
      },
      {"name": "Khan", "steps": "112"},
      {"name": "Alena", "steps": "123"},
      {"name": "Alex", "steps": "128"},
      {"name": "John", "steps": "135"},
      {"name": "Moonix", "steps": "148"},
      {"name": "Ali", "steps": "158"},
      {"name": "Smith", "steps": "168"},
      {"name": "Afridi", "steps": "173"},
      {"name": "Watson", "steps": "203"},
    ]
  };

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;

  Widget buildCard(int index, String name, String steps) {
    return Container(
      height: 76,
      width: 330,
      margin: EdgeInsets.only(bottom: 13),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/leader_board_list.png",
              ),
              fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ListTile(
            leading: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "assets/images/number_background_icon.png",
                  height: 57,
                  width: 57,
                ),
                Text(
                  MyUtils.getFormattedNumber(index),
                  style: TextStyle(
                      fontSize: 28,
                      fontFamily: "leiralite",
                      color: Color(0xFF272B3C)),
                  textAlign: TextAlign.center,
                  // style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            title: Text(
              name,
              style: TextStyle(
                  fontSize: 27,
                  fontFamily: "leiralite",
                  color: Color(0xFFFFFFFF)),
              textAlign: TextAlign.left,
              // style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              "Steps: $steps",
              style: TextStyle(
                  fontSize: 18, fontFamily: "Babybo", color: Color(0xFFFFFFFF)),
              textAlign: TextAlign.left,
              // style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: index == 1
                ? Image.asset(
                    "assets/images/three_stars.png",
                    width: 78,
                    height: 43,
                  )
                : index == 2
                    ? Image.asset(
                        "assets/images/two_stars.png",
                        width: 78,
                        height: 43,
                      )
                    : index == 3
                        ? Image.asset(
                            "assets/images/one_star.png",
                            width: 78,
                            height: 43,
                          )
                        : SizedBox(),
          ),
        ],
      ),
    );
  }
}
