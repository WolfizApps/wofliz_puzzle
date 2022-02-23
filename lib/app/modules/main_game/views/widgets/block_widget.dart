import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:puzzle_game/app/modules/main_game/controllers/main_game_controller.dart';

import '../../../../models/block.dart';

class BlockWidget extends StatefulWidget {
  final Block block;

  BlockWidget(this.block);

  @override
  State<BlockWidget> createState() => _BlockWidgetState();
}

class _BlockWidgetState extends State<BlockWidget>
    with SingleTickerProviderStateMixin {
  final controller = Get.find<MainGameController>();

  @override
  void initState() {
    super.initState();
  }

  double positionTop(
      {required Block block, required double blockW, required double blockH}) {
    return block.startingRowIndex * blockH;
  }

  double positionLeft(
      {required Block block, required double blockW, required double blockH}) {
    return block.startingColumnIndex * blockW;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: positionTop(
        block: widget.block,
        blockW: controller.blockWidth,
        blockH: controller.blockHeight,
      ),
      left: positionLeft(
        block: widget.block,
        blockW: controller.blockWidth,
        blockH: controller.blockHeight,
      ),
      child: GestureDetector(
        onVerticalDragEnd: (dragUpdateDetails) {
          controller.dragEnded(widget.block);
        },
        onHorizontalDragEnd: (dragUpdateDetails) {
          controller.dragEnded(widget.block);
        },
        onVerticalDragUpdate: (dragUpdateDetails) {
          controller.dragUpdate(widget.block, dragUpdateDetails, Axis.vertical);
        },
        onHorizontalDragUpdate: (dragUpdateDetails) {
          controller.dragUpdate(
              widget.block, dragUpdateDetails, Axis.horizontal);
        },
        child: Container(
          padding: EdgeInsets.all(2.r),
          height: widget.block.height * controller.blockHeight,
          width: widget.block.width * controller.blockWidth,
          child: Lottie.asset(
            'assets/lotties/${widget.block.lottiePath}.json',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
