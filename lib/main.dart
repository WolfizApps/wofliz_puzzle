import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import 'package:puzzle_game/widgets/spannable_grid.dart';
import 'package:puzzle_game/widgets/spannable_grid_cell_data.dart';
import 'package:puzzle_game/widgets/spannable_grid_options.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Puzzle',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PuzzlePage(),
    );
  }
}

class PuzzlePage extends StatefulWidget {
  const PuzzlePage({Key? key}) : super(key: key);

  @override
  State<PuzzlePage> createState() => _PuzzlePageState();
}

class _PuzzlePageState extends State<PuzzlePage> {
  final int _complexity = 4;
  var cells;
  late List<int> _data;

  @override
  void initState() {

    _data = List.generate(_complexity * (_complexity + 1), (index) => index);

    super.initState();
  }

  bool _singleCell = false;

  List<SpannableGridCellData> _getCells() {
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
            child: Text("Tile 1x2",
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
            child: Text("Tile zo",
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
            child: Text("Tile 1x2",
              // style: Theme.of(context).textTheme.title,
            )
              //  Lottie.asset("assets/75980-licking-dog.json"),
          ),
        ),
      ),
    ));

    /* result.add(SpannableGridCellData(
        column: 1,
        row: 3,
        columnSpan: 1,
        rowSpan: 1,
        id: "3",
        child: Container(
          color: Colors.transparent,
          child: Center(
            child: Text(
              "blank",
              // style: Theme.of(context).textTheme.title,
            ),
          ),
        ),
      ));*/
    result.add(
        SpannableGridCellData(
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
              child: Text("Tile 2x1",
                // style: Theme.of(context).textTheme.title,
              )
                  //Lottie.asset("assets/34605-lonely-wolf.json"),
            ),
          ),
        ),
      ),
    ));
    /*result.add(SpannableGridCellData(
        column: 4,
        row: 3,
        columnSpan: 1,
        rowSpan: 1,
        id: "5",
        child: Container(
          color: Colors.transparent,
          child: Center(
            child: Text(
              "blank",
              // style: Theme.of(context).textTheme.title,
            ),
            // Lottie.asset("assets/75980-licking-dog.json"),
          ),
        ),
      ));*/
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
            child: Text("Tile 1x2",
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
            child: Text("Tile 1x1",
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
            child: Text("Tile 1x1",
              // style: Theme.of(context).textTheme.title,
            ),
              //  Lottie.asset("assets/75980-licking-dog.json"),
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
            child: Text("Tile 1x2",
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
            child: Text("Tile 1x1",
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
            child: Text("Tile 1x1",
              // style: Theme.of(context).textTheme.title,
            )
             //   Lottie.asset("assets/18465-dog-walking.json"),
          ),
        ),
      ),
    ));
    return result;
  }

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
                  cells: _getCells(),
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

                  /*onCellChanged: (cell) {
                    print(cell?.id.toString());
                  },*/
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => _shuffle(),
                child: Text('Shuffle'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // _shuffle method
  void _shuffle() {
    setState(() {
      _data.shuffle();
    });
  }

  Widget _buildTile(int value) {
    if (value == 0) {
      return Container();
    }
    return GestureDetector(
      onTap: () => _trySwap(value),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        width: 64.0,
        child: Center(
          child: Text(
            '$value',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  _list() {
    cells = <SpannableGridCellData>[];
    cells.add(SpannableGridCellData(
      column: 1,
      row: 1,
      columnSpan: 1,
      rowSpan: 2,
      id: "0",
      child: GestureDetector(
        onTap: () => _trySwap(0),
        child: Container(
          color: Colors.lime,
          child: Center(
            child: /*Text("Tile 1x2",
              // style: Theme.of(context).textTheme.title,
            )*/
                Lottie.asset("assets/18465-dog-walking.json"),
          ),
        ),
      ),
    ));
    cells.add(SpannableGridCellData(
      column: 2,
      row: 1,
      columnSpan: 2,
      rowSpan: 2,
      id: "1",
      child: GestureDetector(
        onTap: () => _trySwap(1),
        child: Container(
          color: Colors.lime,
          child: Center(
            child: /*Text("Tile 2x2",
              // style: Theme.of(context).textTheme.title,
            )*/
                Lottie.asset("assets/87510-character-with-mixed-emotions.json"),
          ),
        ),
      ),
    ));
    cells.add(SpannableGridCellData(
      column: 4,
      row: 1,
      columnSpan: 1,
      rowSpan: 2,
      id: "2",
      child: Container(
        color: Colors.lime,
        child: Center(
          child: /*Text("Tile 1x2",
            // style: Theme.of(context).textTheme.title,
          )*/
              Lottie.asset("assets/75980-licking-dog.json"),
        ),
      ),
    ));
    /*cells.add(SpannableGridCellData(
      column: 1,
      row: 3,
      columnSpan: 1,
      rowSpan: 1,
      id: "3",
      child: Container(
        color: Colors.transparent,
        child: Center(
          child: Text(
            "blank",
            // style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
    ));*/
    cells.add(SpannableGridCellData(
      column: 2,
      row: 3,
      columnSpan: 2,
      rowSpan: 1,
      id: "4",
      child: Container(
        color: Colors.lime,
        child: Center(
          child: /*Text("Tile 2x1",
            // style: Theme.of(context).textTheme.title,
          )*/
              Lottie.asset("assets/34605-lonely-wolf.json"),
        ),
      ),
    ));
    /*cells.add(SpannableGridCellData(
      column: 4,
      row: 3,
      columnSpan: 1,
      rowSpan: 1,
      id: "5",
      child: Container(
        color: Colors.transparent,
        child: Center(
          child: Text(
            "blank",
            // style: Theme.of(context).textTheme.title,
          ),
          // Lottie.asset("assets/75980-licking-dog.json"),
        ),
      ),
    ));*/
    cells.add(SpannableGridCellData(
      column: 1,
      row: 4,
      columnSpan: 1,
      rowSpan: 2,
      id: "6",
      child: Container(
        color: Colors.lime,
        child: Center(
          child: /*Text("Tile 1x2",
            // style: Theme.of(context).textTheme.title,
          ),*/
              Lottie.asset("assets/75980-licking-dog.json"),
        ),
      ),
    ));
    cells.add(SpannableGridCellData(
      column: 2,
      row: 4,
      columnSpan: 1,
      rowSpan: 1,
      id: "7",
      child: Container(
        color: Colors.lime,
        child: Center(
          child: /*Text("Tile 1x1",
            // style: Theme.of(context).textTheme.title,
          ),*/
              Lottie.asset("assets/61023-character-walk.json"),
        ),
      ),
    ));
    cells.add(SpannableGridCellData(
      column: 3,
      row: 4,
      columnSpan: 1,
      rowSpan: 1,
      id: "8",
      child: Container(
        color: Colors.lime,
        child: Center(
          child: /*Text("Tile 1x1",
            // style: Theme.of(context).textTheme.title,
          ),*/
              Lottie.asset("assets/75980-licking-dog.json"),
        ),
      ),
    ));
    cells.add(SpannableGridCellData(
      column: 4,
      row: 4,
      columnSpan: 1,
      rowSpan: 2,
      id: "9",
      child: Container(
        color: Colors.lime,
        child: Center(
          child: /*Text("Tile 1x2",
            // style: Theme.of(context).textTheme.title,
          ),*/
              Lottie.asset("assets/75980-licking-dog.json"),
        ),
      ),
    ));
    cells.add(SpannableGridCellData(
      column: 2,
      row: 5,
      columnSpan: 1,
      rowSpan: 1,
      id: "10",
      child: Container(
        color: Colors.lime,
        child: Center(
          child: /*Text("Tile 1x1",
            // style: Theme.of(context).textTheme.title,
          ),*/
              Lottie.asset("assets/75980-licking-dog.json"),
        ),
      ),
    ));
    cells.add(SpannableGridCellData(
      column: 3,
      row: 5,
      columnSpan: 1,
      rowSpan: 1,
      id: "11",
      child: Container(
        color: Colors.lime,
        child: Center(
          child: /*Text("Tile 1x1",
            // style: Theme.of(context).textTheme.title,
          ),*/
              Lottie.asset("assets/18465-dog-walking.json"),
        ),
      ),
    ));
  }

  // try to swap the tile with the empty tile
  _trySwap(int value) {
    final int emptyIndex = cells.indexOf(3);

    // get empty row and column
    final int emptyRow = emptyIndex ~/ _complexity;
    final int emptyCol = emptyIndex % _complexity;

    // get value index
    final int valueIndex = _data.indexOf(3);

    // get tile row and column
    final int tileRow = valueIndex ~/ _complexity;
    final int tileCol = valueIndex % _complexity;

    // check if the tile is in the same row or column
    if (emptyRow == tileRow || emptyCol == tileCol) {
      // get all tiles between the empty tile and the tile

      // rebuild the widget
      setState(() {
        // swap the tiles
        final int temp = _data[emptyIndex];
        _data[emptyIndex] = _data[valueIndex];
        _data[valueIndex] = temp;
      });
    }
  }
}
