import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:puzzle_game/app/models/board.dart';
import 'package:puzzle_game/app/models/hero_block.dart';
import 'package:puzzle_game/app/models/hover_block.dart';
import 'package:puzzle_game/utils/my_storage.dart';
import 'package:puzzle_game/widgets/win_dialog.dart';
import 'package:rive/rive.dart';
import 'package:video_player/video_player.dart';

import '../../../data/level_one_board.dart';
import '../../../models/block.dart';
import '../../../routes/app_pages.dart';

enum Direction { left, top, right, down }

class MainGameController extends GetxController {
  final isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    getBoard();
    loadSound();
    loadRive();
    _controller =
        VideoPlayerController.asset('assets/videos/instructions_video.mp4')
          ..initialize();

    playerName.value = MyStorage.readQuserName();
  }

  AudioPlayer? audioPlayer;
  FocusNode focusNode = FocusNode();

  var playerName = "".obs;

  Axis? blockMovingAxis;
  double blockHeight = 0.0;
  double blockWidth = 0.0;
  SMINumber? levelTrigger;

  HoverBlock? hoverBlock;
  late Rx<Board> board;

  VideoPlayerController? _controller;
  var tileSelected = false.obs;
  var keyboardActive = false;
  Artboard? artboard;

  Future<void> loadRive() async {
    final rivLoaded = await rootBundle.load('assets/lotties/character.riv');
    final file = RiveFile.import(rivLoaded);
    artboard = file.mainArtboard;
    var controller =
        StateMachineController.fromArtboard(artboard!, 'State Machine 1');
    if (controller != null) {
      artboard!.addController(controller);
      levelTrigger = controller.findSMI('level') as SMINumber;
      log("HERRR: $levelTrigger");
    }

    isLoading.value = false;
  }

  void dragUpdate(
    Block block,
    DragUpdateDetails dragUpdateDetails,
    Axis initialAxis,
  ) {
    if (blockMovingAxis != null) {
      return;
    }

    blockMovingAxis = initialAxis;
    Direction dir = Direction.left;

    if (blockMovingAxis == Axis.horizontal) {
      if (dragUpdateDetails.delta.dx < 0) {
        dir = Direction.left;
      } else {
        dir = Direction.right;
      }
    } else {
      if (dragUpdateDetails.delta.dy < 0) {
        dir = Direction.top;
      } else {
        dir = Direction.down;
      }
    }

    final didMove = board.value.moveBlock(direction: dir, block: block);
    if (didMove) {
      board.value.stepIncrement();
      playSlideSound();
      ifHeroBlockMoved(block);
    }
  }

  void ifHeroBlockMoved(Block block) {
    if (block.runtimeType == HeroBlock) {
      final rowIndex = block.startingRowIndex;
      if (rowIndex == 0) {
        levelTrigger?.change(4);
      } else if (rowIndex == 1 || rowIndex == 2) {
        levelTrigger?.change(3);
      } else if (rowIndex == 3) {
        levelTrigger?.change(2);
      } else if (rowIndex == 4 || rowIndex == 5) {
        levelTrigger?.change(1);
      }
    }
  }

  Future<void> loadSound() async {
    if (audioPlayer == null) {
      audioPlayer = AudioPlayer();
      await audioPlayer?.setAsset('assets/music/rock slide.mp3', preload: true);
      await audioPlayer?.setSpeed(5.0);
    }
  }

  void playSlideSound() async {
    await audioPlayer?.setAsset('assets/music/rock slide.mp3', preload: true);
    await audioPlayer!.play();
  }

  void onUpdate(Board board) async {
    final boardString = board.boardToString();
    MyStorage.writeBoard(boardString);
  }

  void getBoard() {
    final boardString = MyStorage.readBoard();

    if (boardString == null) {
      board = Rx<Board>(levelOneBoard(onWin: onWin, onUpdate: onUpdate));
    } else {
      board =
          Board.fromString(boardString, onWin: onWin, onUpdate: onUpdate).obs;
    }
  }

  void dragEnded(Block block) {
    blockMovingAxis = null;
  }

  void resetGame() {
    board.value = levelOneBoard(onWin: onWin, onUpdate: onUpdate);
    if (keyboardActive) {
      hoverBlock = HoverBlock(onBlock: board.value.blocks.first);
    }
    onUpdate(board.value);
    focusNode.requestFocus();
  }

  Future<void> onWin() async {
    //TODO: Call Firebase Function for updating leaderboard
    await showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (_) => winDialog(
        steps: board.value.steps.value,
        userName: playerName.value,
      ),
    );

    resetGame();
  }

  void showLeaderBoard() {
    Get.toNamed(Routes.LEADER_BOARD);
  }

  Future<void> showInstructions() async {
    _controller!.play();
    await Get.dialog(Container(
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.fill,
              child: SizedBox(
                width: _controller!.value.size.width,
                height: _controller!.value.size.height,
                child: VideoPlayer(_controller!),
              ),
            ),
          ),
        ],
      ),
    ));
    _controller!.pause();
  }

  /// [Keyboard Handles]
  void keyboardButtonPressed(RawKeyEvent event) {
    if (!keyboardActive) {
      keyboardActive = !keyboardActive;
      board.value.blocks.refresh();
      hoverBlock = HoverBlock(onBlock: board.value.blocks.first);
      return;
    }

    if (keyboardActive && event.isKeyPressed(LogicalKeyboardKey.enter)) {
      tileSelected.toggle();
      board.value.blocks.refresh();
      return;
    }

    /// [Block Move]
    if (tileSelected.value) {
      if (event.isKeyPressed(LogicalKeyboardKey.arrowDown)) {
        final didMove = board.value
            .moveBlock(direction: Direction.down, block: hoverBlock!.onBlock);
        if (didMove) {
          board.value.stepIncrement();
        }
      } else if (event.isKeyPressed(LogicalKeyboardKey.arrowUp)) {
        final didMove = board.value
            .moveBlock(direction: Direction.top, block: hoverBlock!.onBlock);
        if (didMove) {
          board.value.stepIncrement();
        }
      } else if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
        final didMove = board.value
            .moveBlock(direction: Direction.right, block: hoverBlock!.onBlock);
        if (didMove) {
          board.value.stepIncrement();
        }
      } else if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
        final didMove = board.value
            .moveBlock(direction: Direction.left, block: hoverBlock!.onBlock);
        if (didMove) {
          board.value.stepIncrement();
          ifHeroBlockMoved(hoverBlock!.onBlock);
        }
      }

      board.value.blocks.refresh();
    }

    /// [Selection Move]
    else {
      if (event.isKeyPressed(LogicalKeyboardKey.arrowDown)) {
        hoverBlock?.moveDown(board.value);
      } else if (event.isKeyPressed(LogicalKeyboardKey.arrowUp)) {
        hoverBlock?.moveUp(board.value);
      } else if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
        hoverBlock?.moveRight(board.value);
      } else if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
        hoverBlock?.moveLeft(board.value);
      }

      board.value.blocks.refresh();
    }
  }

  @override
  void onClose() {
    board.value.blocks.close();
    board.close();
    playerName.close();
    tileSelected.close();
    isLoading.close();
  }
}
