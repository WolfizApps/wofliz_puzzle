import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../../utils/my_storage.dart';
import '../../../routes/app_pages.dart';
import 'instructions.dart';

class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController? _controller;
  late int videoLengthInSecods;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/cutscene.mp4')
      ..initialize().then(
            (_) {
          setState(() {
            videoLengthInSecods = _controller?.value.duration.inSeconds ?? 0;
            _controller!.play();
          });
        },
      )
      ..addListener(() async {
        if ((await _controller?.position)?.inSeconds == videoLengthInSecods && !_controller!.value.isPlaying) {
          checkInstructionsPresence();
        }
      });
  }

  Future<void> checkInstructionsPresence() async {
    if (await MyStorage.readIsInstructionShow()) {
      Get.off(Instruction());
    } else {
      Get.offNamed(Routes.MAIN_GAME);
    }
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
                      onPressed: checkInstructionsPresence,
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

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }
}
