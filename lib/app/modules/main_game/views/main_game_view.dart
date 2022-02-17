import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/widgets/spannable_grid.dart';
import 'package:puzzle_game/widgets/spannable_grid_options.dart';
import 'package:puzzle_game/widgets/test_widgets.dart';

import '../controllers/main_game_controller.dart';

class MainGameView extends GetView<MainGameController> {
  @override
  Widget build(BuildContext context) {
    // var w1 = Recipe(/*[],*/ 1, 1.0);
    return Scaffold(
      body: Center(
        child: Container(
          width: Get.width,
          height: Get.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/images/main_game_bg.png",
                  ),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 80.0, bottom: 110, left: 16, right: 16),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SpannableGrid(
                      columns: 4,
                      editingStrategy:
                          SpannableGridEditingStrategy.immediate().copyWith(
                        moveOnlyToNearby: true,
                        allowed: true,
                        immediate: true,
                      ),
                      showGrid: true,
                      emptyCellView: Container(
                        color: Colors.transparent,
                      ),
                      rows: 5,
                      cells:
                          /*controller.initalCellsData!*/ controller.getCells(),
                      onCellChanged: (cell) {
                        print("Id: " +
                            cell!.id.toString() +
                            "Column: " +
                            cell.column.toString() +
                            ": Rows" +
                            cell.row.toString());
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await controller.pool.play(controller.soundId!);
                    },
                    child: Text('Shuffle'),
                  ),

                  /*Container(
                    height: 150,
                    width: 150,
                    child: Lottie.asset("assets/61023-character-walk.json",
                        fit: BoxFit.cover, repeat: true),
                  ),*/
                  /*SizedBox(
                    height: 20,
                  ),
                  */
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
