import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

import '../../../../utils/my_storage.dart';
import '../../../routes/app_pages.dart';
import 'instructions.dart';

class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 22), () {
      try {
        if (!MyStorage.readIsInstructionShow()) {
          Get.to(Instruction());
        } else {
          Get.toNamed(Routes.MAIN_GAME);
        }
      } catch (e) {
        Get.to(Instruction());
      }
    });
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/cutscene.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller!.play();
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //   title: 'Video Demo',
      home: Scaffold(
        body: Center(
          child: _controller!.value.isInitialized
              ? Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  //aspectRatio: _controller!.value.aspectRatio,
                  child: VideoPlayer(_controller!),
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
    _controller!.dispose();
  }
}
