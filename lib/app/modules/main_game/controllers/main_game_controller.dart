import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/app/models/board.dart';

import '../../../data/level_one_board.dart';
import '../../../models/block.dart';

enum Direction { left, top, right, down }

class MainGameController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  var playerName = "Zoraiz".obs;
  var steps = 0.obs;

  Axis? blockMovingAxis;
  double blockHeight = 0.0;
  double blockWidth = 0.0;

  Rx<Board> board = Rx<Board>(levelOneBoard);

  void dragUpdate(
      Block block, DragUpdateDetails dragUpdateDetails, Axis initialAxis) {
    if (blockMovingAxis != null) {
      return;
    }

    blockMovingAxis = initialAxis;
    Direction dir = Direction.left;

    if (blockMovingAxis == Axis.horizontal) {
      if (dragUpdateDetails.delta.dx < 0) {
        dir = Direction.left;
      } else {
        dir = Direction.right;
      }
    } else {
      if (dragUpdateDetails.delta.dy < 0) {
        dir = Direction.top;
      } else {
        dir = Direction.down;
      }
    }

    board.value.moveBlock(direction: dir, block: block);
  }

  void dragEnded(Block block) {
    blockMovingAxis = null;
    block.draggingPosition = null;
    board.value.blocks.refresh();
  }

  void resetGame() {
    board.value = levelOneBoard;
  }

  @override
  void onClose() {
    board.value.blocks.close();
    board.close();
  }
}
