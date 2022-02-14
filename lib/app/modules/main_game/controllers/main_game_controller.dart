import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/widgets/spannable_grid_cell_data.dart';

class MainGameController extends GetxController {
  List<int> data = List.generate(20, (index) => index).obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  List<SpannableGridCellData> getCells() {
    final result = <SpannableGridCellData>[];
    result.add(SpannableGridCellData(
      column: 1,
      row: 1,
      columnSpan: 1,
      rowSpan: 2,
      id: "0",
      child: Scaffold(
        body: Container(
          color: Colors.lime,
          child: Center(
              child: Text(
            "Tile 1x2",
            // style: Theme.of(context).textTheme.title,
          )
              //   child: Lottie.asset("assets/18465-dog-walking.json"),
              ),
        ),
      ),
    ));
    result.add(SpannableGridCellData(
      column: 2,
      row: 1,
      columnSpan: 2,
      rowSpan: 2,
      id: "1",
      child: Scaffold(
        body: Container(
          color: Colors.lime,
          child: Center(
              child: Text(
            "Tile zo",
            // style: Theme.of(context).textTheme.title,
          )
              //Lottie.asset("assets/87510-character-with-mixed-emotions.json"),
              ),
        ),
      ),
    ));
    result.add(SpannableGridCellData(
      column: 4,
      row: 1,
      columnSpan: 1,
      rowSpan: 2,
      id: "2",
      child: Scaffold(
        body: Container(
          color: Colors.lime,
          child: Center(
              child: Text(
            "Tile 1x2",
            // style: Theme.of(context).textTheme.title,
          )
              //  Lottie.asset("assets/75980-licking-dog.json"),
              ),
        ),
      ),
    ));
    result.add(SpannableGridCellData(
      column: 2,
      row: 3,
      columnSpan: 2,
      rowSpan: 1,
      id: "4",
      child: Scaffold(
        body: Slidable(
          child: Container(
            color: Colors.lime,
            child: Center(
                child: Text(
              "Tile 2x1",
              // style: Theme.of(context).textTheme.title,
            )
                //Lottie.asset("assets/34605-lonely-wolf.json"),
                ),
          ),
        ),
      ),
    ));
    result.add(SpannableGridCellData(
      column: 1,
      row: 4,
      columnSpan: 1,
      rowSpan: 2,
      id: "6",
      child: Scaffold(
        body: Container(
          color: Colors.lime,
          child: Center(
            child: Text(
              "Tile 1x2",
              // style: Theme.of(context).textTheme.title,
            ),
            //Lottie.asset("assets/75980-licking-dog.json"),
          ),
        ),
      ),
    ));
    result.add(SpannableGridCellData(
      column: 2,
      row: 4,
      columnSpan: 1,
      rowSpan: 1,
      id: "7",
      child: Scaffold(
        body: Container(
          color: Colors.lime,
          child: Center(
            child: Text(
              "Tile 1x1",
              // style: Theme.of(context).textTheme.title,
            ),
            //  Lottie.asset("assets/61023-character-walk.json"),
          ),
        ),
      ),
    ));
    result.add(SpannableGridCellData(
      column: 3,
      row: 4,
      columnSpan: 1,
      rowSpan: 1,
      id: "8",
      child: Scaffold(
        body: Container(
          color: Colors.lime,
          child: Center(
            child: Text(
              "Tile 1x1",
              // style: Theme.of(context).textTheme.title,
            ),
          ),
        ),
      ),
    ));
    result.add(SpannableGridCellData(
      column: 4,
      row: 4,
      columnSpan: 1,
      rowSpan: 2,
      id: "9",
      child: Scaffold(
        body: Container(
          color: Colors.lime,
          child: Center(
            child: Text(
              "Tile 1x2",
              // style: Theme.of(context).textTheme.title,
            ),
            //  Lottie.asset("assets/75980-licking-dog.json"),
          ),
        ),
      ),
    ));
    result.add(SpannableGridCellData(
      column: 2,
      row: 5,
      columnSpan: 1,
      rowSpan: 1,
      id: "10",
      child: Scaffold(
        body: Container(
          color: Colors.lime,
          child: Center(
            child: Text(
              "Tile 1x1",
              // style: Theme.of(context).textTheme.title,
            ),
            //  Lottie.asset("assets/75980-licking-dog.json"),
          ),
        ),
      ),
    ));
    result.add(SpannableGridCellData(
      column: 3,
      row: 5,
      columnSpan: 1,
      rowSpan: 1,
      id: "11",
      child: Scaffold(
        body: Container(
          color: Colors.lime,
          child: Center(
              child: Text(
            "Tile 1x1",
            // style: Theme.of(context).textTheme.title,
          )
              //   Lottie.asset("assets/18465-dog-walking.json"),
              ),
        ),
      ),
    ));
    return result;
  }

  // _shuffle method
  void shuffle() {
    data = List.generate(20, (index) => index);
  }
}
