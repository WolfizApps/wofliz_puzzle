import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/app/modules/login/views/instructions.dart';
import 'package:video_player/video_player.dart';

import '../../../../utils/my_storage.dart';
import '../../../routes/app_pages.dart';

class InitialVideo extends StatefulWidget {
  @override
  _InitialVideoState createState() => _InitialVideoState();
}

class _InitialVideoState extends State<InitialVideo> {
  VideoPlayerController? _controller;
  late int videoLengthInSecods;

  @override
  void initState() {
    super.initState();
    videoInit();
  }

  Future<void> videoInit() async {
    _controller = VideoPlayerController.asset('assets/videos/cutscene.mp4');
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
          isPlaying.value = false;
          checkInstructionsPresence();
        }
      });
    });
  }

  final isPlaying = false.obs;

  Future<void> checkInstructionsPresence() async {
    if (await MyStorage.readIsInstructionShow()) {
      // TODO: uncommented
   /*     Get.off(() => InstructionVideo(
        isFromMainScreen: false,
      ));*/
      Get.offNamed(Routes.MAIN_GAME);
    } else {
      Get.offNamed(Routes.MAIN_GAME);
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    return WillPopScope(
      onWillPop: () async {
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
        return true;
      },
      child: Obx(
        () => Scaffold(
          body: isPlaying.value
              ? Stack(
                  children: [
                    SizedBox(
                      width: _controller!.value.size.width,
                      height: _controller!.value.size.height,
                      child: VideoPlayer(_controller!),
                    ),
                    Container(
                      // changed by fazal
                      alignment: Alignment.topRight,
                      width: _controller!.value.size.width,
                      // height: 60,
                      margin: EdgeInsets.only(top: 25),
                      padding: EdgeInsets.only(right: 35),
                      child: InkWell(
                        onTap: checkInstructionsPresence,
                        child: Container(
                          // width: ,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            border: Border.all(color: Colors.white, width: 3),
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: Text(
                            "Skip",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
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
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    _controller!.dispose();
    isPlaying.close();
  }
}
