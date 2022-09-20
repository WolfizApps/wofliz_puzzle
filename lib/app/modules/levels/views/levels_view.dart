import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/levels_controller.dart';

class LevelsView extends GetView<LevelsController> {
  const LevelsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          child: Stack(
            children: [
              Container(
                height: Get.height,
                width: Get.width,
                child: Image.asset(
                  'assets/images/levels_bg.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: -15.h,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.only(top: 14.h),
                  child: Image.asset('assets/images/levels-image-1.png'),
                ),
              ),
              Positioned(
                top: 24.h,
                left: 12.w,
                right: 12.w,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Image.asset(
                    'assets/images/levels-dialg.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),

              ///Levels Selectable
              Positioned(
                top: 277.5.h,
                left: 25.w,
                right: 0,
                child: Container(
                  width: Get.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.changeLevel('forest');
                        },
                        child: Image.asset(
                          'assets/images/forest.png',
                          width: 77.w,
                          height: 127.46.h,
                        ),
                      ),
                      SizedBox(width: 12.5.w),
                      InkWell(
                        onTap: () {
                          controller.changeLevel('space');
                        },
                        child: Image.asset(
                          'assets/images/space.png',
                          width: 77.w,
                          height: 127.46.h,
                        ),
                      ),
                      SizedBox(width: 12.5.w),
                      InkWell(
                        onTap: () {
                          controller.changeLevel('ocean');
                        },
                        child: Image.asset(
                          'assets/images/ocean.png',
                          width: 77.w,
                          height: 127.46.h,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                  size: 41.r,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
