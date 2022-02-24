import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:puzzle_game/app/models/board.dart';
import 'package:puzzle_game/utils/my_storage.dart';
import 'package:puzzle_game/widgets/win_dialog.dart';
import 'package:video_player/video_player.dart';

import '../../../data/level_one_board.dart';
import '../../../models/block.dart';
import '../../../routes/app_pages.dart';

enum Direction { left, top, right, down }

class MainGameController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getBoard();
    loadSound();
    _controller =
        VideoPlayerController.asset('assets/videos/instructions_video.mp4')
          ..initialize();

    playerName.value = MyStorage.readQuserName();
  }

  AudioPlayer? audioPlayer;

  var playerName = "".obs;

  Axis? blockMovingAxis;
  double blockHeight = 0.0;
  double blockWidth = 0.0;

  late Rx<Board> board;

  VideoPlayerController? _controller;

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
    board.value.stepsReset();
    onUpdate(board.value);
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

  @override
  void onClose() {
    board.value.blocks.close();
    board.close();
    playerName.close();
  }
}
