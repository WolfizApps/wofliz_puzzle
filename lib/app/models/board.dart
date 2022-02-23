import 'package:get/get.dart';

import '../modules/main_game/controllers/main_game_controller.dart';
import 'block.dart';
import 'location.dart';

class Board {
  final int coloumns;
  final int rows;
  final RxList<Block> blocks;
  late final List<Block> initialSetup;
  List<List<_Space>> space = [];

  Board({required this.coloumns, required this.rows, required this.blocks}) {
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
    //
  }

  bool _moveBlockRight(Block block) {
    final canMove = _canMoveRight(block);
    if (canMove) {
      block.setOldLocation();

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
      block.setOldLocation();

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
      block.setOldLocation();

      for (final loc in block.location) {
        loc.rowIndex++;
      }
    }

    return canMove;
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

  bool _moveBlockUp(Block block) {
    final canMove = canMoveUp(block: block);
    if (canMove) {
      block.setOldLocation();
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
