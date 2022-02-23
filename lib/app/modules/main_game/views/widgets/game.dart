import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/app/modules/main_game/controllers/main_game_controller.dart';

import 'block_widget.dart';

class Game extends StatelessWidget {
  final controller = Get.find<MainGameController>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, BoxConstraints box) {
      controller.blockHeight = box.maxHeight / controller.board.value.rows;
      controller.blockWidth = box.maxWidth / controller.board.value.coloumns;

      return Obx(
        () => Stack(
          children: controller.board.value.blocks
              .map(
                (block) => BlockWidget(block),
              )
              .toList(),
        ),
      );
    });
  }
}
