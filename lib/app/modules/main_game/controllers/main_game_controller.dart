import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:puzzle_game/app/models/board.dart';
import 'package:puzzle_game/app/models/hero_block.dart';
import 'package:puzzle_game/app/models/hover_block.dart';
import 'package:puzzle_game/app/modules/login/views/instructions.dart';
import 'package:puzzle_game/app/modules/main_game/views/setting_view.dart';
import 'package:puzzle_game/utils/my_storage.dart';
import 'package:puzzle_game/widgets/win_dialog.dart';
import 'package:rive/rive.dart';

import '../../../data/level_one_board.dart';
import '../../../models/block.dart';
import '../../../routes/app_pages.dart';

enum Direction { left, top, right, down }

class MainGameController extends SuperController {
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getBoard();
    loadSound();
    loadRive();
    isPlayMusic.value = MyStorage.readIsPlayMusic();
    isPlaySound.value = MyStorage.readIsPlaySound();
    initAudio();

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
  final isPlayMusic = true.obs;
  final isPlaySound = true.obs;

  late Rx<Board> board;
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

  final player = AudioPlayer();

  void dragUpdate(
    Block block,
    DragUpdateDetails dragUpdateDetails,
    Axis initialAxis,
  ) {
    if (keyboardActive) {
      keyboardActive = !keyboardActive;
      board.value.blocks.refresh();
      tileSelected.value = false;
      hoverBlock = HoverBlock(onBlock: board.value.blocks.first);
      return;
    }
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
      if (isPlaySound.value) {
        playSlideSound();
      }
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
    await audioPlayer?.play();
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
    print("I am called");
    board.value = levelOneBoard(onWin: onWin, onUpdate: onUpdate);
    if (keyboardActive) {
      hoverBlock = HoverBlock(onBlock: board.value.blocks.first);
    }
    onUpdate(board.value);
    focusNode.requestFocus();
  }

  addDataToFirebase() {
    print("Adding data to the firbase");
    try {
      FirebaseFirestore.instance.collection('leaderboard').add({
        'name': playerName.value.toString(),
        'stage': board.value.steps.value.toString(),
        'email': MyStorage.readQuserEmail()
      });
      print("data added to Firebase!");
    } catch (e) {
      print("Failed to Add Data to Firebase!");
    }
  }

  Future<void> onWin() async {
    //TODO: Call Firebase Function for updating leaderboard
    addDataToFirebase();
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
    Get.to(InstructionVideo(
      isFromMainScreen: true,
    ));
  }

  Future<void> showSettings() async {
    Get.to(() => SettingView());
  }

  Future<void> goToInstructionsScreen() async {
    if (isPlayMusic.value) {
      player.pause();
    }
    Get.to(InstructionVideo(isFromMainScreen: true));
  }

  initAudio() async {
    await player.setAsset('assets/music/music2.mp3');
    player.setLoopMode(LoopMode.all);
    if (isPlayMusic.value) {
      player.play();
    }
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
    player.dispose();
    isPlayMusic.close();
    isPlaySound.close();
    audioPlayer!.dispose();
  }

  void changeMusic() {
    isPlayMusic.toggle();
    MyStorage.writeIsPlayMusic(isPlayMusic.value);
    if (isPlayMusic.value) {
      player.play();
    } else {
      player.pause();
    }
  }

  void changeSound() {
    isPlaySound.toggle();
    MyStorage.writeIsPlayMusic(isPlayMusic.value);
  }

  @override
  void onDetached() {
    print("On in detach");
  }

  @override
  void onInactive() {
    print("On in activate");
  }

  @override
  void onPaused() {
    print("On in pause");
    if (player.playing) {
      player.pause();
    }
  }

  @override
  void onResumed() {
    print("On in resume");
    // TODO: implement onResumed
    if (isPlayMusic.value) {
      player.play();
    }
  }
}
