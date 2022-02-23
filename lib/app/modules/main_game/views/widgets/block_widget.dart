import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  late final AnimationController animationController;
  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation = Tween<double>(begin: 0, end: 10).animate(animationController);
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
          height: widget.block.height * controller.blockHeight,
          width: widget.block.width * controller.blockWidth,
          decoration: BoxDecoration(
            color: widget.block.color,
          ),
          // child: Image.network(
          //   widget.block.isHorizontal
          //       ? "https://www.freeiconspng.com/uploads/police-car-top-png-11.png"
          //       : "https://freepngimg.com/save/137298-top-ferrari-view-hd-image-free/900x1083",
          //   fit: BoxFit.cover,
          // ),
        ),
      ),
    );
  }
}
