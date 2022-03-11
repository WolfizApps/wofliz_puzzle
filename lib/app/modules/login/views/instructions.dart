import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:puzzle_game/app/modules/main_game/controllers/main_game_controller.dart';
import 'package:puzzle_game/utils/my_storage.dart';
import 'package:puzzle_game/utils/my_utils.dart';
import 'package:video_player/video_player.dart';

import '../../../routes/app_pages.dart';

class Instruction extends StatefulWidget {
  bool? isFromMainScreen;

  Instruction({this.isFromMainScreen = false});

  @override
  _InstructionState createState() => _InstructionState();
}

class _InstructionState extends State<Instruction> {
  VideoPlayerController? _controller;
  late int videoLengthInSecods;
  final controller = Get.find<MainGameController>();

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        'assets/videos/instructions_video.mp4')
      ..initialize().then(
        (_) {
          setState(() {
            videoLengthInSecods = _controller?.value.duration.inSeconds ?? 0;
            _controller!.play();
          });
        },
      )
      ..addListener(() async {
        if ((await _controller?.position)?.inSeconds == videoLengthInSecods) {
          goToGameMainScreen();
        }
      });
    MyStorage.writeIsInstructionShow(false);
  }

  @override
  Widget build(BuildContext context) {
    MyUtils.makeScreenResponsive(context);
    return Scaffold(
      // onPressed: widget.isFromMainScreen!
      //     ? goBack
      //     : goToGameMainScreen,
      body: _controller!.value.isInitialized
          ? Stack(
              children: <Widget>[
                SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Stack(
                      children: [
                        SizedBox(
                          width: _controller!.value.size.width,
                          height: _controller!.value.size.height,
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
  }
}
