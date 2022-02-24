import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/app/models/hero_block.dart';
import 'package:puzzle_game/app/models/solid_block.dart';
import '../modules/main_game/controllers/main_game_controller.dart';
import 'block.dart';
import 'location.dart';

class Board {
  final int coloumns;
  final VoidCallback onWin;
  final int rows;
  final RxList<Block> blocks;
  final Rx<int> steps = RxInt(0);
  late final List<Block> initialSetup;
  List<List<_Space>> space = [];
  final Function(Board) onUpdate;

  Board({
    required this.coloumns,
    required this.rows,
    required this.blocks,
    required this.onWin,
    required this.onUpdate,
  }) {
    for (var i = 0; i < rows; i++) {
      space.add([for (var j = 0; j < coloumns; j++) _Space(true)]);
    }

    // ignore: invalid_use_of_protected_member
    initialSetup = blocks.value;
    _calculateSpace();
    ever(steps, (_) {
      onUpdate(this);
    });
  }

  void _calculateSpace() {
    for (var i = 0; i < rows; i++) {
      for (var j = 0; j < coloumns; j++) {
        final isFree = !blocks.any((block) {
          //Jis ki location i x j ho
          return block.location.any((location) =>
              location.rowIndex == i && location.columnIndex == j);
        });
        space[i][j].isFree = isFree;
      }
    }

    _checkIfCompleted();
  }

  void dispose() {
    steps.close();
    blocks.close();
  }

  String boardToString() {
    final boardInJson = {};
    boardInJson['steps'] = steps.value;
    boardInJson['coloumns'] = coloumns;
    boardInJson['rows'] = rows;
    boardInJson['blocks'] = [
      for (final singleBlock in blocks)
        {
          if (singleBlock.runtimeType == HeroBlock)
            "solution": [
              for (final loc in (singleBlock as HeroBlock).solution)
                {
                  "row_index": loc.rowIndex,
                  "col_index": loc.columnIndex,
                }
            ],
          if (singleBlock.runtimeType == SolidBlock)
            "lottie_path": ''
          else
            "lottie_path": singleBlock.lottiePath,
          "location": [
            for (final loc in singleBlock.location)
              {
                "row_index": loc.rowIndex,
                "col_index": loc.columnIndex,
              }
          ],
        }
    ];

    return jsonEncode(boardInJson);
  }

  static Board fromString(String data,
      {required VoidCallback onWin, required void Function(Board) onUpdate}) {
    final jsonData = json.decode(data);
    final theBoard = Board(
      onUpdate: onUpdate,
      onWin: onWin,
      coloumns: jsonData['coloumns'],
      rows: jsonData['rows'],
      blocks: <Block>[
        for (final blockJson in List<Map>.from(jsonData['blocks']))
          if (blockJson.containsKey('solution'))
            HeroBlock(
              solution: [
                for (final locJson in List<Map>.from(blockJson['solution']))
                  Location(
                    rowIndex: locJson['row_index'],
                    columnIndex: locJson['col_index'],
                  ),
              ],
              location: [
                for (final locJson in List<Map>.from(blockJson['location']))
                  Location(
                    rowIndex: locJson['row_index'],
                    columnIndex: locJson['col_index'],
                  ),
              ],
              lottiePath: blockJson['lottie_path'],
            )
          else if ((blockJson['lottie_path'] as String).isEmpty)
            SolidBlock(
              location: [
                for (final locJson in List<Map>.from(blockJson['location']))
                  Location(
                    rowIndex: locJson['row_index'],
                    columnIndex: locJson['col_index'],
                  ),
              ],
            )
          else
            Block(
              lottiePath: blockJson['lottie_path'],
              location: [
                for (final locJson in List<Map>.from(blockJson['location']))
                  Location(
                    rowIndex: locJson['row_index'],
                    columnIndex: locJson['col_index'],
                  ),
              ],
            ),
      ].obs,
    );
    theBoard.steps.value = jsonData['steps'];
    return theBoard;
  }

  bool moveBlock({required Direction direction, required Block block}) {
    bool didMove = false;
    switch (direction) {
      case Direction.top:
        didMove = _moveBlockUp(block);
        break;
      case Direction.down:
        didMove = _moveBlockDown(block);
        break;
      case Direction.left:
        didMove = _moveBlockLeft(block);
        break;
      case Direction.right:
        didMove = _moveBlockRight(block);
        break;
      default:
        didMove = false;
        break;
    }

    _calculateSpace();
    blocks.refresh();
    return didMove;
  }

  void _checkIfCompleted() {
    final heroBlock = blocks.firstWhere(
      (element) => element.runtimeType == HeroBlock,
    );

    bool hasCompleted = true;

    for (final loc in heroBlock.location) {
      final hasCompletedThisLoc = (heroBlock as HeroBlock).solution.any(
            (element) =>
                element.rowIndex == loc.rowIndex &&
                element.columnIndex == loc.columnIndex,
          );
      hasCompleted = hasCompletedThisLoc;

      if (!hasCompletedThisLoc) {
        break;
      }
    }

    if (hasCompleted) {
      onWin();
    }
  }

  bool _moveBlockRight(Block block) {
    final canMove = _canMoveRight(block);
    if (canMove) {
      for (final loc in block.location) {
        loc.columnIndex++;
      }
    }
    return canMove;
  }

  bool _canMoveRight(Block block) {
    bool spaceAvailable = true;
    var blockLastColumnIndex = block.endingColumnIndex;

    if (blockLastColumnIndex == (coloumns - 1)) {
      return false;
    }

    for (final loc in block.location) {
      spaceAvailable = _spaceAvailable(
        Location(
          rowIndex: loc.rowIndex,
          columnIndex: blockLastColumnIndex + 1,
        ),
      );
      if (!spaceAvailable) return spaceAvailable;
    }

    return spaceAvailable;
  }

  bool _moveBlockLeft(Block block) {
    final canMove = _canMoveLeft(block);
    if (canMove) {
      for (final loc in block.location) {
        loc.columnIndex--;
      }
    }
    return canMove;
  }

  bool _canMoveLeft(Block block) {
    bool spaceAvailable = true;
    var blockFirstColumnIndex = block.startingColumnIndex;

    if (blockFirstColumnIndex == 0) {
      return false;
    }

    for (final loc in block.location) {
      spaceAvailable = _spaceAvailable(
        Location(
          rowIndex: loc.rowIndex,
          columnIndex: blockFirstColumnIndex - 1,
        ),
      );
      if (!spaceAvailable) return spaceAvailable;
    }

    return spaceAvailable;
  }

  bool _moveBlockDown(Block block) {
    final canMove = canMoveDown(block: block);
    if (canMove) {
      for (final loc in block.location) {
        loc.rowIndex++;
      }
    }

    return canMove;
  }

  bool canMoveDown({required Block block}) {
    bool spaceAvailable = true;
    var blockLastRowIndex = block.endingRowIndex;
    var isNotHeroBlock = block.runtimeType != HeroBlock;
    var wantsToMoveToWinBlock =
        (blockLastRowIndex + 1 == 5) || (blockLastRowIndex + 1 == 6);
    if ((isNotHeroBlock && wantsToMoveToWinBlock)) {
      return false;
    }
    if (blockLastRowIndex == (rows - 1)) {
      return false;
    }

    for (final loc in block.location) {
      spaceAvailable = _spaceAvailable(Location(
          rowIndex: blockLastRowIndex + 1, columnIndex: loc.columnIndex));
      if (!spaceAvailable) return spaceAvailable;
    }

    return spaceAvailable;
  }

  bool _moveBlockUp(Block block) {
    final canMove = canMoveUp(block: block);
    if (canMove) {
      for (final loc in block.location) {
        loc.rowIndex--;
      }
    }
    return canMove;
  }

  bool canMoveUp({required Block block}) {
    bool spaceAvailable = true;
    int blockFirstRowIndex = block.startingRowIndex;

    if (blockFirstRowIndex == 0) {
      return false;
    }

    for (final loc in block.location) {
      spaceAvailable = _spaceAvailable(Location(
          rowIndex: blockFirstRowIndex - 1, columnIndex: loc.columnIndex));
      if (!spaceAvailable) return spaceAvailable;
    }

    return spaceAvailable;
  }

  bool _spaceAvailable(Location location) {
    try {
      bool isFree = space[location.rowIndex][location.columnIndex].isFree;
      return isFree;
    } catch (e) {
      return false;
    }
  }

  void stepIncrement() {
    steps.value++;
  }

  void stepsReset() {
    steps.value = 0;
  }
}

class _Space {
  bool isFree;

  _Space(this.isFree);
}
