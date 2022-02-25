import 'package:puzzle_game/app/models/block.dart';
import 'package:puzzle_game/app/models/board.dart';
import 'package:puzzle_game/app/models/solid_block.dart';

class HoverBlock {
  Block onBlock;
  HoverBlock({required this.onBlock});

  bool isHere(Block block) {
    return block.id == onBlock.id;
  }

  void moveLeft(Board board) {
    Block? bl;
    var col = onBlock.startingColumnIndex - 1;
    var startRow = onBlock.startingRowIndex;
    var endRow = onBlock.endingRowIndex;

    while (col >= 0) {
      bool startRowcondition = board.blocks.any((bl) => bl.location.any((lo) =>
          (lo.columnIndex == col) &&
          (bl.startingRowIndex == startRow || bl.endingRowIndex == startRow)));

      bool endRowcondition = board.blocks.any((bl) => bl.location.any((lo) =>
          (lo.columnIndex == col) &&
          (bl.startingRowIndex == endRow || bl.endingRowIndex == endRow)));

      if (startRowcondition) {
        bl = board.blocks.firstWhere((bl) {
          return bl.location.any((lo) =>
              (lo.columnIndex == col) &&
              (bl.startingRowIndex == startRow ||
                  bl.endingRowIndex == startRow));
        });
      } else if (endRowcondition) {
        bl = board.blocks.firstWhere((bl) {
          return bl.location.any((lo) =>
              (lo.columnIndex == col) &&
              (bl.startingRowIndex == endRow || bl.endingRowIndex == endRow));
        });
      }

      if (bl != null && bl.runtimeType != SolidBlock) {
        onBlock = bl;
        break;
      }
      col--;
    }
  }

  void moveRight(Board board) {
    Block? bl;
    var col = onBlock.endingColumnIndex + 1;
    var startRow = onBlock.startingRowIndex;
    var endRow = onBlock.endingRowIndex;

    while (col <= 3) {
      bool startRowcondition = board.blocks.any((bl) => bl.location.any((lo) =>
          (lo.columnIndex == col) &&
          (bl.startingRowIndex == startRow || bl.endingRowIndex == startRow)));

      bool endRowcondition = board.blocks.any((bl) => bl.location.any((lo) =>
          (lo.columnIndex == col) &&
          (bl.startingRowIndex == endRow || bl.endingRowIndex == endRow)));

      if (startRowcondition) {
        bl = board.blocks.firstWhere((bl) {
          return bl.location.any((lo) =>
              (lo.columnIndex == col) &&
              (bl.startingRowIndex == startRow ||
                  bl.endingRowIndex == startRow));
        });
      } else if (endRowcondition) {
        bl = board.blocks.firstWhere((bl) {
          return bl.location.any((lo) =>
              (lo.columnIndex == col) &&
              (bl.startingRowIndex == endRow || bl.endingRowIndex == endRow));
        });
      }

      if (bl != null && bl.runtimeType != SolidBlock) {
        onBlock = bl;
        break;
      }
      col++;
    }
  }

  void moveUp(Board board) {
    Block? bl;
    var startCol = onBlock.startingColumnIndex;
    var endCol = onBlock.endingColumnIndex;
    var row = onBlock.startingRowIndex - 1;

    while (row >= 0) {
      bool startColcondition = board.blocks.any((bl) => bl.location.any((lo) =>
          (lo.rowIndex == row) &&
          (bl.startingColumnIndex == startCol ||
              bl.endingColumnIndex == startCol)));

      bool endColcondition = board.blocks.any((bl) => bl.location.any((lo) =>
          (lo.rowIndex == row) &&
          (bl.startingColumnIndex == endCol || bl.endingRowIndex == endCol)));

      if (startColcondition) {
        bl = board.blocks.firstWhere((bl) {
          return bl.location.any((lo) =>
              (lo.rowIndex == row) &&
              (bl.startingColumnIndex == startCol ||
                  bl.endingColumnIndex == startCol));
        });
      } else if (endColcondition) {
        bl = board.blocks.firstWhere((bl) {
          return bl.location.any((lo) =>
              (lo.rowIndex == row) &&
              (bl.startingColumnIndex == endCol ||
                  bl.endingColumnIndex == endCol));
        });
      }

      if (bl != null && bl.runtimeType != SolidBlock) {
        onBlock = bl;
        break;
      }
      row--;
    }
  }

  void moveDown(Board board) {
    Block? bl;
    var startCol = onBlock.startingColumnIndex;
    var endCol = onBlock.endingColumnIndex;
    var row = onBlock.endingRowIndex + 1;

    while (row <= 6) {
      bool startColcondition = board.blocks.any((bl) => bl.location.any((lo) =>
          (lo.rowIndex == row) &&
          (bl.startingColumnIndex == startCol ||
              bl.endingColumnIndex == startCol)));

      bool endColcondition = board.blocks.any((bl) => bl.location.any((lo) =>
          (lo.rowIndex == row) &&
          (bl.startingColumnIndex == endCol || bl.endingRowIndex == endCol)));

      if (startColcondition) {
        bl = board.blocks.firstWhere((bl) {
          return bl.location.any((lo) =>
              (lo.rowIndex == row) &&
              (bl.startingColumnIndex == startCol ||
                  bl.endingColumnIndex == startCol));
        });
      } else if (endColcondition) {
        bl = board.blocks.firstWhere((bl) {
          return bl.location.any((lo) =>
              (lo.rowIndex == row) &&
              (bl.startingColumnIndex == endCol ||
                  bl.endingColumnIndex == endCol));
        });
      }

      if (bl != null && bl.runtimeType != SolidBlock) {
        onBlock = bl;
        break;
      }
      row++;
    }
  }
}
