import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:puzzle_game/app/modules/main_game/controllers/main_game_controller.dart';
import 'package:puzzle_game/utils/my_storage.dart';
import 'package:puzzle_game/utils/my_utils.dart';
import 'package:video_player/video_player.dart';

import '../../../routes/app_pages.dart';

class InstructionVideo extends StatefulWidget {
  bool? isFromMainScreen;

  InstructionVideo({this.isFromMainScreen = false});

  @override
  _InstructionVideoState createState() => _InstructionVideoState();
}

class _InstructionVideoState extends State<InstructionVideo> {
  VideoPlayerController? _controller;
  late int videoLengthInSecods;
  MainGameController? controller;

  @override
  void initState() {
    super.initState();
    if (widget.isFromMainScreen!) {
      controller = Get.find<MainGameController>();
      if (controller!.isPlayMusic.value) {
        controller!.player.pause();
      }
    }

    MyStorage.writeIsInstructionShow(false);
  }

  Future<void> videoInit() async {
    _controller =
        VideoPlayerController.asset('assets/videos/instructions_video.mp4');
    await _controller?.initialize();

    isPlaying.value = true;
    await _controller!.play();
    log("NOW");
    videoLengthInSecods = _controller?.value.duration.inSeconds ?? 0;
    _controller!.addListener(() async {
      setState(() {
        if (!_controller!.value.isPlaying &&
            (_controller!.value.duration == _controller!.value.position)) {
          // _controller!.pause();
          print("if, Video ended");
          goToGameMainScreen();
        }
      });
    });
  }

  final isPlaying = false.obs;

  @override
  Widget build(BuildContext context) {
    MyUtils.makeScreenResponsive(context);
    return Scaffold(
      body: isPlaying.value
          ? Stack(
              children: <Widget>[
                SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: _controller!.value.aspectRatio,
                          child: VideoPlayer(_controller!),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          width: _controller!.value.size.width,
                          // height: 60,

                          margin: EdgeInsets.only(top: 25),
                          padding: EdgeInsets.only(right: 35),
                          child: InkWell(
                            onTap: widget.isFromMainScreen!
                                ? goBack
                                : goToGameMainScreen,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                border:
                                    Border.all(color: Colors.white, width: 3),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: Text(
                                widget.isFromMainScreen! ? "Close" : "Skip",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 36),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          : Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
            ),
    );
  }

  Future<void> goToGameMainScreen() async {
    _controller!.pause();
    _controller!.seekTo(Duration(milliseconds: 0));
    Get.offNamed(Routes.MAIN_GAME);
  }

  Future<void> goBack() async {
    Get.back();
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
    isPlaying.close();
    if (widget.isFromMainScreen!) {
      if (controller!.isPlayMusic.value) {
        controller!.player.play();
      }
    }
  }
}
