

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:puzzle_game/utils/my_storage.dart';

import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

import '../../../routes/app_pages.dart';


class Instruction extends StatefulWidget {
  @override
  _InstructionState createState() => _InstructionState();
}

class _InstructionState extends State<Instruction> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    Future.delayed(


        Duration(seconds: 13), () {

      MyStorage.writeIsInstructionShow(true);
      Get.toNamed(Routes.MAIN_GAME);
    }


    );
    super.initState();
    _controller = VideoPlayerController.asset(
        'assets/videos/instructions.mp4')
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
     // title: 'Video Demo',
      home: Scaffold(
        body: _controller!.value.isInitialized
            ? Stack(
          children: <Widget>[
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.fill,
                child: SizedBox(
                  width: _controller!.value.size.width ?? 0,
                  height: _controller!.value.size.height ?? 0,
                  child: VideoPlayer(_controller!),
                ),
              ),
            ),
            //FURTHER IMPLEMENTATION
          ],
        )
            : Container(
             height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
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





