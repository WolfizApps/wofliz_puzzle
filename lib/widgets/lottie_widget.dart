import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TestLottie extends StatelessWidget {
  String? imgName;
  Key? key;

  TestLottie({Key? key, String? imgName});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      imgName!,
      key: key!,
      fit: BoxFit.fill,
      repeat: false,
    );
  }
}
