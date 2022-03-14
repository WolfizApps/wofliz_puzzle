import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/app/modules/main_game/controllers/main_game_controller.dart';
import 'package:puzzle_game/app/routes/app_pages.dart';
import 'package:puzzle_game/utils/my_storage.dart';
import 'package:puzzle_game/utils/my_utils.dart';
import 'package:flutter/foundation.dart' show kIsWeb;


class SettingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // LeaderBoardController controller=Get.put(LeaderBoardController());

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    final _controller = Get.find<MainGameController>();
    MyUtils.makeScreenResponsive(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(kIsWeb ? "assets/images/web_bg_img.jpg": "assets/images/register_main_bg.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 54,
                      height: 54,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 15, left: 20),
                      child: Image.asset(
                        "assets/images/back_btn.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: Get.width,
                      constraints: BoxConstraints(
                        maxWidth: 450,
                        maxHeight: 560,
                      ),
                      padding: EdgeInsets.only(left: 45.w, right: 45.w),
                      height: 400,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                "assets/images/setting_new_bg.png",
                              ),
                              fit: BoxFit.fill)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Music",
                                    style: TextStyle(
                                        color: Color(0xFF272B3C),
                                        fontSize: 25,
                                        fontFamily: "leiralite"),
                                  ),
                                ),
                                Spacer(),
                                Flexible(
                                  child: Container(
                                    margin: EdgeInsets.only(right: 10.w),
                                    child: InkWell(
                                      onTap: _controller.changeMusic,
                                      child: Obx(
                                        () => Image.asset(
                                          _controller.isPlayMusic.value
                                              ? "assets/images/switch_on_icon.png"
                                              : "assets/images/switch_off_icon.png",
                                          height: 25.h,
                                          width: 42.w,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  "Sound",
                                  style: TextStyle(
                                      color: Color(0xFF272B3C),
                                      fontSize: 25,
                                      fontFamily: "leiralite"),
                                ),
                              ),
                              Spacer(),
                              Flexible(
                                child: Container(
                                  margin: EdgeInsets.only(right: 10.w),
                                  child: InkWell(
                                    onTap: _controller.changeSound,
                                    child: Obx(
                                          () => Image.asset(
                                        _controller.isPlaySound.value
                                            ? "assets/images/switch_on_icon.png"
                                            : "assets/images/switch_off_icon.png",
                                        height: 25.h,
                                        width: 42.w,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Material(
                        color: Colors.transparent,
                        child: Container(
                            width: Get.width,
                            height: 76.h,
                            margin: EdgeInsets.only(left: 70.w, right: 70.w),
                            child: InkWell(
                                onTap: () {
                                  MyStorage.writeIsUserLoggedIn(false);
                                  MyStorage.writeUserEmail("");
                                  MyStorage.writeTotalCount("0");
                                  MyStorage.writeUserName("");
                                  MyStorage.writeUserPassword("");
                                  Get.offAllNamed(Routes.REGISTER);
                                },
                                child: Image.asset("assets/images/log_out_icon.png"))),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
