import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/utils/my_utils.dart';
import 'package:video_player/video_player.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    MyUtils.makeScreenResponsive(context);

    return Scaffold(
      // onPressed: widget.isFromMainScreen!
      //     ? goBack
      //     : goToGameMainScreen,
      body: controller.videoController!.value.isInitialized
          ? Stack(
              children: <Widget>[
                SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: SizedBox(
                      width: controller.videoController!.value.size.width,
                      height: controller.videoController!.value.size.height,
                      child: VideoPlayer(controller.videoController!),
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
}
