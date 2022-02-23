import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/app/models/hero_block.dart';

import '../models/board.dart';
import '../models/block.dart';
import '../models/location.dart';

Board levelOneBoard({required VoidCallback onWin}) => Board(
      onWin: onWin,
      coloumns: 4,
      rows: 5,
      blocks: <Block>[
        Block(
          lottiePath: 'wolf_character1',
          location: [
            Location(rowIndex: 0, columnIndex: 0),
            Location(rowIndex: 1, columnIndex: 0),
          ],
        ),
        HeroBlock(
          solution: [
            Location(rowIndex: 3, columnIndex: 1),
            Location(rowIndex: 3, columnIndex: 2),
            Location(rowIndex: 4, columnIndex: 1),
            Location(rowIndex: 4, columnIndex: 2),
          ],
          lottiePath: 'character_1',
          location: [
            Location(rowIndex: 0, columnIndex: 1),
            Location(rowIndex: 0, columnIndex: 2),
            Location(rowIndex: 1, columnIndex: 1),
            Location(rowIndex: 1, columnIndex: 2),
          ],
        ),
        Block(
          lottiePath: 'tree1',
          location: [
            Location(rowIndex: 0, columnIndex: 3),
            Location(rowIndex: 1, columnIndex: 3),
          ],
        ),
        Block(
          lottiePath: 'stone1',
          location: [
            Location(rowIndex: 2, columnIndex: 1),
            Location(rowIndex: 2, columnIndex: 2),
          ],
        ),
        Block(
          lottiePath: 'spider1',
          location: [
            Location(rowIndex: 3, columnIndex: 0),
            Location(rowIndex: 4, columnIndex: 0),
          ],
        ),
        Block(
          lottiePath: 'wolf6',
          location: [
            Location(rowIndex: 3, columnIndex: 3),
            Location(rowIndex: 4, columnIndex: 3),
          ],
        ),
        Block(
          lottiePath: 'bat1',
          location: [
            Location(rowIndex: 3, columnIndex: 1),
          ],
        ),
        Block(
          lottiePath: 'hand',
          location: [
            Location(rowIndex: 3, columnIndex: 2),
          ],
        ),
        Block(
          lottiePath: 'wolf_new3',
          location: [
            Location(rowIndex: 4, columnIndex: 1),
          ],
        ),
        Block(
          lottiePath: 'wolf_new4',
          location: [
            Location(rowIndex: 4, columnIndex: 2),
          ],
        ),
      ].obs,
    );
