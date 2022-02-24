import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:puzzle_game/app/models/board.dart';
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
    board = Rx<Board>(levelOneBoard(onWin: onWin));
    _controller =
        VideoPlayerController.asset('assets/videos/instructions_video.mp4')
          ..initialize().then((_) {
            // _controller!.play();
          });
  }

  var playerName = "Zoraiz".obs;
  var steps = 0.obs;

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
      steps.value++;
    }
  }

  void dragEnded(Block block) {
    blockMovingAxis = null;
  }

  void resetGame() {
    board.value = levelOneBoard(onWin: onWin);
    steps.value = 0;
  }

  Future<void> onWin() async {
    await showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (_) => winDialog(steps: steps.value, userName: playerName.value),
    );

    resetGame();
  }

  void showLeaderBoard() {
    Get.toNamed(Routes.LEADER_BOARD);
  }

  void showInstructions() {
    _controller!.play();
    Get.dialog(Container(
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
  }

  @override
  void onClose() {
    board.value.blocks.close();
    board.close();
    steps.close();
  }
}
