import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    // changed by fazal
                    alignment: Alignment.topCenter,
                    width: _controller!.value.size.width,
                    height: 60,
                    margin: EdgeInsets.only(top: 15),
                    child: TextButton(
                      onPressed: widget.isFromMainScreen!
                          ? goBack
                          : goToGameMainScreen,
                      child: Text(
                        "Skip",
                        style:
                        TextStyle(color: Colors.white, fontSize: 36),
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
