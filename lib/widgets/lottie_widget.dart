import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:puzzle_game/utils/my_utils.dart';

class TestLottie extends StatelessWidget {
  String? imgName;
  Key? key;

  TestLottie({Key? key, String? imgName});

  @override
  Widget build(BuildContext context) {
    MyUtils.makeScreenResponsive(context);
    return Lottie.asset(
      imgName!,
      key: key!,
      fit: BoxFit.fill,
      repeat: false,
    );
  }
}
