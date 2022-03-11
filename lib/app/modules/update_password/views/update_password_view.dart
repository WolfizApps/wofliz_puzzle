import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:puzzle_game/utils/my_utils.dart';

import '../controllers/update_password_controller.dart';

class UpdatePasswordView extends GetView<UpdatePasswordController> {
  @override
  Widget build(BuildContext context) {
    MyUtils.makeScreenResponsive(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('UpdatePasswordView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'UpdatePasswordView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
