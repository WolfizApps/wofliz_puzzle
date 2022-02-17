import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/widgets/spannable_grid.dart';
import 'package:puzzle_game/widgets/spannable_grid_options.dart';

import '../controllers/main_game_controller.dart';

class MainGameView2 extends GetView<MainGameController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SpannableGrid(
                  columns: 4,
                  editingStrategy:
                      SpannableGridEditingStrategy.immediate().copyWith(
                    moveOnlyToNearby: false,
                    allowed: true,
                    immediate: true,
                  ),
                  showGrid: true,
                  rows: 5,
                  cells: controller.initialCellsData!,
                  /* emptyCellView: Container(
                    height: 50,
                    width: 50,
                  ),*/
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
              SizedBox(
                height: 20,
              ),

              ElevatedButton(
                onPressed: () => controller.shuffle(),
                child: Text('Shuffle'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
