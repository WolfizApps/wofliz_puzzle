import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/app/modules/main_game/controllers/main_game_controller.dart';
import 'package:puzzle_game/utils/my_utils.dart';

import 'block_widget.dart';

class Game extends StatelessWidget {
  final controller = Get.find<MainGameController>();
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    MyUtils.makeScreenResponsive(context);
    return LayoutBuilder(builder: (_, BoxConstraints box) {
      controller.blockHeight = (box.maxHeight / controller.board.value.rows);
      controller.blockWidth = box.maxWidth / controller.board.value.coloumns;

      return Obx(
        () => controller.isLoading.value
            ? SizedBox()
            : Stack(
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
