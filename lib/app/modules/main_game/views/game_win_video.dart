import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:puzzle_game/app/modules/main_game/controllers/main_game_controller.dart';
import 'package:puzzle_game/utils/my_storage.dart';
import 'package:puzzle_game/utils/my_utils.dart';
import 'package:video_player/video_player.dart';

import '../../../routes/app_pages.dart';

class GameWinVideo extends StatefulWidget {
  @override
  _GameWinVideoState createState() => _GameWinVideoState();
}

class _GameWinVideoState extends State<GameWinVideo> {
  VideoPlayerController? _controller;
  late int videoLengthInSecods;
  MainGameController? controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(
        'assets/videos/end_video.mp4')
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
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
