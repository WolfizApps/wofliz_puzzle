import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:puzzle_game/app/modules/main_game/controllers/main_game_controller.dart';

import '../../../../models/block.dart';

class BlockWidget extends StatelessWidget {
  final controller = Get.find<MainGameController>();

  final Block block;

  BlockWidget(this.block);

  double get positionTop => block.startingRowIndex * controller.blockHeight;

  double get positionLeft => block.startingColumnIndex * controller.blockWidth;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 400),
      top: positionTop,
      left: positionLeft,
      curve: Curves.fastOutSlowIn,
      child: GestureDetector(
        onVerticalDragEnd: (dragUpdateDetails) {
          controller.dragEnded(block);
        },
        onHorizontalDragEnd: (dragUpdateDetails) {
          controller.dragEnded(block);
        },
        onVerticalDragUpdate: (dragUpdateDetails) {
          controller.dragUpdate(block, dragUpdateDetails, Axis.vertical);
        },
        onHorizontalDragUpdate: (dragUpdateDetails) {
          controller.dragUpdate(block, dragUpdateDetails, Axis.horizontal);
        },
        child: Container(
          height: block.height * controller.blockHeight,
          width: block.width * controller.blockWidth,
          padding: EdgeInsets.all(5),
          child: Lottie.asset(
            'assets/lotties/${block.lottiePath}.json',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
