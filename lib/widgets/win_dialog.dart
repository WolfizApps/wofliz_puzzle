import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

AlertDialog winDialog({required int steps, required String userName}) {
  return AlertDialog(
    backgroundColor: Colors.transparent,
    insetPadding: EdgeInsets.zero,
    elevation: 0,
    content: kIsWeb
        ? Container(
            constraints: BoxConstraints(maxWidth: 280, maxHeight: 500),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Lottie.asset('assets/lotties/new_victory.json'),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 95,
                      child: Column(
                        children: [

                          SizedBox(height: 14),
                          Text(
                            userName,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 33,
                            ),
                          ),
                          Text(
                            "You escaped from jungle in $steps steps",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: Get.back,
                  child: Container(
                    width: 238,
                    height: 76,
                    child: Image.asset(
                      'assets/images/play_again_icon.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          )
        : Container(
            constraints: BoxConstraints(maxWidth: 280, maxHeight: 500),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Lottie.asset('assets/lotties/new_victory.json'),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 95.h,
                        child: Column(
                          children: [

                            SizedBox(height: 14.h),
                            Text(
                              "CONGRATS!",
                              style: TextStyle(
                                color: Color(0xFF707070),
                                fontFamily: "leiralite",
                                fontSize: 33.sp,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 60.w, right: 60.w),
                              alignment: Alignment.center,
                              child: Text(
                                "You escaped from jungle in  $steps steps",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF707070),
                                  fontFamily: "Babybo",
                                  fontSize: 18.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: Get.back,
                    child: Container(
                      width: 238.w,
                      height: 76.h,
                      child: Image.asset(
                        'assets/images/play_again_icon.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
  );
}
