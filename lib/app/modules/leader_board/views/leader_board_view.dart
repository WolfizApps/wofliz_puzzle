import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/leader_board_controller.dart';

class LeaderBoardView extends GetView<LeaderBoardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LeaderBoardView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'LeaderBoardView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
