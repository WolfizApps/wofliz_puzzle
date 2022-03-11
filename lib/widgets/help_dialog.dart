import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/app/modules/main_game/controllers/main_game_controller.dart';
import 'package:puzzle_game/utils/my_utils.dart';
import 'package:video_player/video_player.dart';

class HelpDialog extends StatefulWidget {

  @override
  State<HelpDialog> createState() => _HelpDialogState();
}


class _HelpDialogState extends State<HelpDialog> {
  final _controller = Get.find<MainGameController>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.controller!.pause();
    _controller.controller!.seekTo(Duration(milliseconds: 0));
  }
  @override
  Widget build(BuildContext context) {

    MyUtils.makeScreenResponsive(context);
    return Container(
      alignment: Alignment.center,
      child: _controller.controller!.value.isInitialized
          ? Stack(
        children: <Widget>[
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.fill,
              child: Stack(
                children: [
                  SizedBox(
                    width: _controller.value.size.width,
                    height: _controller.value.size.height,
                    child: VideoPlayer(_controller.controller!),
                  ),
                  Container(
                    // changed by fazal
                    alignment: Alignment.topRight,
                    width: _controller.value.size.width,
                    margin: EdgeInsets.only(top: 25),
                    padding: EdgeInsets.only(right: 35),
                    child: TextButton(
                      onPressed: _controller.goBack,
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
                          "Close",
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
        height: Get.height,
        width: Get.width,
        color: Colors.black,
      ),
    );
  }
}
