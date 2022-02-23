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
          lottiePath: 'wolf_character1',
          location: [
            Location(rowIndex: 0, columnIndex: 0),
            Location(rowIndex: 1, columnIndex: 0),
          ],
        ),
        Block(
          color: Colors.green,
          lottiePath: 'character_1',
          location: [
            Location(rowIndex: 0, columnIndex: 1),
            Location(rowIndex: 0, columnIndex: 2),
            Location(rowIndex: 1, columnIndex: 1),
            Location(rowIndex: 1, columnIndex: 2),
          ],
        ),
        Block(
          color: Colors.yellow,
          lottiePath: 'tree1',
          location: [
            Location(rowIndex: 0, columnIndex: 3),
            Location(rowIndex: 1, columnIndex: 3),
          ],
        ),
        Block(
          color: Colors.purpleAccent,
          lottiePath: 'stone1',
          location: [
            Location(rowIndex: 2, columnIndex: 1),
            Location(rowIndex: 2, columnIndex: 2),
          ],
        ),
        Block(
          color: Colors.indigo,
          lottiePath: 'spider1',
          location: [
            Location(rowIndex: 3, columnIndex: 0),
            Location(rowIndex: 4, columnIndex: 0),
          ],
        ),
        Block(
          color: Colors.grey,
          lottiePath: 'wolf6',
          location: [
            Location(rowIndex: 3, columnIndex: 3),
            Location(rowIndex: 4, columnIndex: 3),
          ],
        ),
        Block(
          lottiePath: 'bat1',
          color: Colors.deepOrange,
          location: [
            Location(rowIndex: 3, columnIndex: 1),
          ],
        ),
        Block(
          color: Colors.teal,
          lottiePath: 'hand',
          location: [
            Location(rowIndex: 3, columnIndex: 2),
          ],
        ),
        Block(
          lottiePath: 'wolf_new3',
          color: Colors.cyan,
          location: [
            Location(rowIndex: 4, columnIndex: 1),
          ],
        ),
        Block(
          color: Colors.brown,
          lottiePath: 'wolf_new4',
          location: [
            Location(rowIndex: 4, columnIndex: 2),
          ],
        ),
      ].obs,
    );
