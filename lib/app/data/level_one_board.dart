import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/board.dart';
import '../models/block.dart';
import '../models/location.dart';

Board get levelOneBoard => Board(
      coloumns: 4,
      rows: 5,
      blocks: <Block>[
        Block(
          color: Colors.pink,
          location: [
            Location(rowIndex: 0, columnIndex: 0),
            Location(rowIndex: 1, columnIndex: 0),
          ],
        ),
        Block(
          color: Colors.green,
          location: [
            Location(rowIndex: 0, columnIndex: 1),
            Location(rowIndex: 0, columnIndex: 2),
            Location(rowIndex: 1, columnIndex: 1),
            Location(rowIndex: 1, columnIndex: 2),
          ],
        ),
        Block(
          color: Colors.yellow,
          location: [
            Location(rowIndex: 0, columnIndex: 3),
            Location(rowIndex: 1, columnIndex: 3),
          ],
        ),
        Block(
          color: Colors.purpleAccent,
          location: [
            Location(rowIndex: 2, columnIndex: 1),
            Location(rowIndex: 2, columnIndex: 2),
          ],
        ),
        Block(
          color: Colors.indigo,
          location: [
            Location(rowIndex: 3, columnIndex: 0),
            Location(rowIndex: 4, columnIndex: 0),
          ],
        ),
        Block(
          color: Colors.grey,
          location: [
            Location(rowIndex: 3, columnIndex: 3),
            Location(rowIndex: 4, columnIndex: 3),
          ],
        ),
        Block(
          color: Colors.deepOrange,
          location: [
            Location(rowIndex: 3, columnIndex: 1),
          ],
        ),
        Block(
          color: Colors.teal,
          location: [
            Location(rowIndex: 3, columnIndex: 2),
          ],
        ),
        Block(
          color: Colors.cyan,
          location: [
            Location(rowIndex: 4, columnIndex: 1),
          ],
        ),
        Block(
          color: Colors.brown,
          location: [
            Location(rowIndex: 4, columnIndex: 2),
          ],
        ),
      ].obs,
    );
