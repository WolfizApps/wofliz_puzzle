import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

AlertDialog winDialog({required int steps, required String userName}) {
  return AlertDialog(
    backgroundColor: Colors.transparent,
    insetPadding: EdgeInsets.zero,
    elevation: 0,
    content: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Lottie.asset('assets/lotties/victory.json'),
            Positioned(
              left: 0,
              right: 0,
              bottom: 80.h,
              child: Column(
                children: [
                  Text(
                    "Congrats!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(height: 14.h),
                  Text(
                    userName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 33.sp,
                    ),
                  ),
                  Text(
                    "You escaped from jungle in $steps steps",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
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
  );
}
