import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../../utils/my_storage.dart';
import '../../../routes/app_pages.dart';
import 'instructions.dart';

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
        if ((await _controller?.position)?.inSeconds == videoLengthInSecods &&
            !_controller!.value.isPlaying) {
          _controller!.pause();
          checkInstructionsPresence();
        }
      });
  }

  Future<void> checkInstructionsPresence() async {
    // await _controller!.dispose();
    // Get.off(InstructionVideo(isFromMainScreen: false,));
    if (await MyStorage.readIsInstructionShow()) {
    Get.off(InstructionVideo(isFromMainScreen: false,));
    } else {
      Get.offNamed(Routes.MAIN_GAME);
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(457, 812),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.landscape);
    return WillPopScope(
      onWillPop: () async {
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
        return true;
      },
      child: Scaffold(
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
                            alignment: Alignment.topRight,
                            width: _controller!.value.size.width,
                            // height: 60,

                            margin: EdgeInsets.only(top: 25),
                            padding: EdgeInsets.only(right: 35),
                            child: InkWell(
                              onTap: checkInstructionsPresence,
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
                                  "Skip",
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
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.pause();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }
}
