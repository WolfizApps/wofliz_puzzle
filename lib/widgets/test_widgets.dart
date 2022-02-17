import 'package:flutter/material.dart';
import 'package:puzzle_game/utils/my_utils.dart';
import 'package:puzzle_game/widgets/lottie_widget.dart';

class TestWidgets {
  final w1 = Container(
    decoration: BoxDecoration(
      color: Colors.transparent,
      boxShadow: [MyUtils.myCardShadow()],
    ),
    // there is a problem in no 3, please check
    child: TestLottie(
      // key: _globalKey,
      imgName: "assets/lotties/character_1.json",
    ),
  );
}
