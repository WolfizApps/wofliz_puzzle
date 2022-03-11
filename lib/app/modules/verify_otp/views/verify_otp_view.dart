import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puzzle_game/utils/my_utils.dart';

import '../controllers/verify_otp_controller.dart';

class VerifyOtpView extends GetView<VerifyOtpController> {
  @override
  Widget build(BuildContext context) {
    MyUtils.makeScreenResponsive(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('VerifyOtpView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'VerifyOtpView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
