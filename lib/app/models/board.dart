import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/app/models/hero_block.dart';

import '../modules/main_game/controllers/main_game_controller.dart';
import 'block.dart';
import 'location.dart';

class Board {
  final int coloumns;
  final VoidCallback onWin;
  final int rows;
  final RxList<Block> blocks;
  late final List<Block> initialSetup;
  List<List<_Space>> space = [];

  Board(
      {required this.coloumns,
      required this.rows,
      required this.blocks,
      required this.onWin}) {
    for (var i = 0; i < rows; i++) {
      space.add([for (var j = 0; j < coloumns; j++) _Space(true)]);
    }

    // ignore: invalid_use_of_protected_member
    initialSetup = blocks.value;
    _calculateSpace();
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

  String boardToString() {
    final boardInJson = {};
    boardInJson['coloumns'] = coloumns;
    boardInJson['rows'] = rows;
    boardInJson['blocks'] = [
      for (final singleBlock in blocks)
        {
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

    return boardInJson.toString();
  }

  static Board fromString(String data, {required VoidCallback onWin}) {
    final jsonData = json.decode(data);
    return Board(
      onWin: onWin,
      coloumns: jsonData['coloumns'],
      rows: jsonData['rows'],
      blocks: <Block>[
        for (final blockJson in jsonData['blocks'] as List<Map>)
          Block(
            lottiePath: blockJson['lottie_path'],
            location: [
              for (final locJson in blockJson['location'] as List<Map>)
                Location(
                  rowIndex: locJson['row_index'],
                  columnIndex: locJson['col_index'],
                ),
            ],
          ),
      ].obs,
    );
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
}

class _Space {
  bool isFree;

  _Space(this.isFree);
}
