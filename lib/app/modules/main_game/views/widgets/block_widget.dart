import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:puzzle_game/app/models/hero_block.dart';
import 'package:puzzle_game/app/models/solid_block.dart';
import 'package:puzzle_game/app/modules/main_game/controllers/main_game_controller.dart';
import 'package:puzzle_game/utils/my_utils.dart';
import 'package:rive/rive.dart';

import '../../../../../utils/my_utils.dart';
import '../../../../models/block.dart';

class BlockWidget extends StatelessWidget {
  final controller = Get.find<MainGameController>();

  final Block block;

  BlockWidget(this.block);

  double get positionTop => block.startingRowIndex * controller.blockHeight;

  double get positionLeft => (block.startingColumnIndex * controller.blockWidth);

  @override
  Widget build(BuildContext context) {
    MyUtils.makeScreenResponsive(context);
    return AnimatedPositioned(
      duration: Duration(milliseconds: 400),
      top: positionTop,
      left: positionLeft,
      curve: Curves.easeOut,
      child: GestureDetector(
        onVerticalDragEnd: (dragUpdateDetails) {
          controller.dragEnded(block);
        },
        onHorizontalDragEnd: (dragUpdateDetails) {
          controller.dragEnded(block);
        },
        onVerticalDragUpdate: (dragUpdateDetails) {
          controller.dragUpdate(block, dragUpdateDetails, Axis.vertical);
        },
        onHorizontalDragUpdate: (dragUpdateDetails) {
          controller.dragUpdate(block, dragUpdateDetails, Axis.horizontal);
        },
        child: Stack(
          children: [
            GestureDetector(
              onVerticalDragEnd: (dragUpdateDetails) {
                controller.dragEnded(block);
              },
              onHorizontalDragEnd: (dragUpdateDetails) {
                controller.dragEnded(block);
              },
              onVerticalDragUpdate: (dragUpdateDetails) {
                controller.dragUpdate(block, dragUpdateDetails, Axis.vertical);
              },
              onHorizontalDragUpdate: (dragUpdateDetails) {
                controller.dragUpdate(block, dragUpdateDetails, Axis.horizontal);
              },
              child: block.runtimeType == HeroBlock
                  ? Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("${controller.assetForLevel("assets/images/img_11")}.png"),
                        ),
                      ),
                      height: block.height * controller.blockHeight,
                      width: block.width * controller.blockWidth,
                      child: Rive(artboard: controller.artBoard!),
                    )
                  : block.runtimeType == SolidBlock
                      ? SizedBox()
                      : Container(
                          height: block.height * controller.blockHeight,
                          width: block.width * controller.blockWidth,
                          decoration: MyUtils.carBoxDecoration(cardImage: "cardImage", isShowCardImage: false),
                          margin: EdgeInsets.all(2.r),
                          // padding: EdgeInsets.all(vertical: 2.h, horizontal: 5.w).,
                          child: Lottie.asset(
                            '${controller.assetForLevel("assets/lotties/${block.lottiePath}")}.json',
                            fit: BoxFit.fill,
                          ),
                        ),
            ),
            if (controller.keyboardActive && (controller.hoverBlock?.isHere(block) ?? false))
              Obx(
                () => Container(
                  height: block.height * controller.blockHeight,
                  width: block.width * controller.blockWidth,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(controller.tileSelected.value ? 0.6 : 0.2),
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
