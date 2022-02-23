import 'package:get/get.dart';

import '../modules/main_game/controllers/main_game_controller.dart';
import 'block.dart';
import 'location.dart';

class Board {
  final int coloumns;
  final int rows;
  final RxList<Block> blocks;
  List<List<_Space>> space = [];

  Board({required this.coloumns, required this.rows, required this.blocks}) {
    for (var i = 0; i < rows; i++) {
      space.add([for (var j = 0; j < coloumns; j++) _Space(true)]);
    }
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

  void moveBlock({required Direction direction, required Block block}) {
    switch (direction) {
      case Direction.top:
        _moveBlockUp(block);
        break;
      case Direction.down:
        _moveBlockDown(block);
        break;
      case Direction.left:
        _moveBlockLeft(block);
        break;
      case Direction.right:
        _moveBlockRight(block);
        break;
      default:
        break;
    }

    _calculateSpace();
    blocks.refresh();
  }

  void _checkIfCompleted() {
    //
  }

  void _moveBlockRight(Block block) {
    if (_canMoveRight(block)) {
      for (final loc in block.location) {
        loc.columnIndex++;
      }
    }
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

  void _moveBlockLeft(Block block) {
    if (_canMoveLeft(block)) {
      for (final loc in block.location) {
        loc.columnIndex--;
      }
    }
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

  void _moveBlockDown(Block block) {
    if (canMoveDown(block: block)) {
      for (final loc in block.location) {
        loc.rowIndex++;
      }
    }
  }

  bool canMoveDown({required Block block}) {
    bool spaceAvailable = true;

    var blockLastRowIndex = block.endingRowIndex;

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

  void _moveBlockUp(Block block) {
    if (canMoveUp(block: block)) {
      for (final loc in block.location) {
        loc.rowIndex--;
      }
    }
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
