import 'package:flutter/material.dart';

import 'location.dart';

class Block {
  List<Location> location;
  Color color;
  String lottiePath;

  Block(
      {required this.location, required this.color, required this.lottiePath});

  int get height {
    int h = 0;
    final recordedRowNumbers = <int>[];
    for (final loc in location) {
      if (!recordedRowNumbers.any((element) => element == loc.rowIndex)) {
        h++;
      }
      recordedRowNumbers.add(loc.rowIndex);
    }

    return h;
  }

  int get width {
    int w = 0;
    final recordedRowNumbers = <int>[];
    for (final loc in location) {
      if (!recordedRowNumbers.any((element) => element == loc.columnIndex)) {
        w++;
      }
      recordedRowNumbers.add(loc.columnIndex);
    }

    return w;
  }

  int get startingRowIndex {
    int blockFirstRowIndex = location.first.rowIndex;

    for (final loc in location) {
      if (loc.rowIndex < blockFirstRowIndex) {
        blockFirstRowIndex = loc.rowIndex;
      }
    }

    return blockFirstRowIndex;
  }

  int get endingRowIndex {
    int blockLastRowIndex = location.last.rowIndex;

    for (final loc in location) {
      if (loc.rowIndex > blockLastRowIndex) {
        blockLastRowIndex = loc.rowIndex;
      }
    }

    return blockLastRowIndex;
  }

  int get startingColumnIndex {
    int blockFirstColumnIndex = location.first.columnIndex;

    for (final loc in location) {
      if (loc.columnIndex < blockFirstColumnIndex) {
        blockFirstColumnIndex = loc.columnIndex;
      }
    }

    return blockFirstColumnIndex;
  }

  int get endingColumnIndex {
    int blockLastColumnIndex = location.last.columnIndex;

    for (final loc in location) {
      if (loc.columnIndex > blockLastColumnIndex) {
        blockLastColumnIndex = loc.columnIndex;
      }
    }

    return blockLastColumnIndex;
  }
}
