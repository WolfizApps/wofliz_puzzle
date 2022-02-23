import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/app/modules/main_game/controllers/main_game_controller.dart';

import 'block_widget.dart';

class Game extends StatelessWidget {
  final controller = Get.find<MainGameController>();

  @override
  Widget build(BuildContext context) {
    print(controller.board.blocks.first.startingColumnIndex);
    print(controller.board.blocks.first.endingColumnIndex);
    print(controller.board.blocks.first.startingRowIndex);
    print(controller.board.blocks.first.endingRowIndex);
    return LayoutBuilder(builder: (_, BoxConstraints box) {
      controller.blockHeight = box.maxHeight / controller.board.rows;
      controller.blockWidth = box.maxWidth / controller.board.coloumns;

      return Obx(
        () => Stack(
          children: controller.board.blocks
              .map(
                (block) => BlockWidget(block),
              )
              .toList(),
        ),
      );
    });
  }
}
