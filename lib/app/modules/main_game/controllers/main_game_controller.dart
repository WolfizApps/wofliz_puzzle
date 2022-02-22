import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:puzzle_game/app/routes/app_pages.dart';
import 'package:puzzle_game/utils/my_utils.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:puzzle_game/widgets/spannable_grid_cell_data.dart';
import 'package:soundpool/soundpool.dart';

class MainGameController extends GetxController {
  List<int> data = List.generate(20, (index) => index).obs;
  List<SpannableGridCellData>? initalCellsData = [];

  static const String value = "assets/lotties/wolf_character1.json";
  final GlobalKey _globalKey1 = GlobalKey();
  final GlobalKey _globalKey2 = GlobalKey();
  final GlobalKey _globalKey3 = GlobalKey();
  final GlobalKey _globalKey4 = GlobalKey();
  final GlobalKey _globalKey5 = GlobalKey();
  final GlobalKey _globalKey6 = GlobalKey();
  final GlobalKey _globalKey7 = GlobalKey();
  final GlobalKey _globalKey8 = GlobalKey();
  final GlobalKey _globalKey9 = GlobalKey();
  final GlobalKey _globalKey10 = GlobalKey();
  final GlobalKey _globalKey11 = GlobalKey();
  final GlobalKey _globalKey12 = GlobalKey();

  @override
  void onInit() {
    super.onInit();
    intiMovingSound();
    initalCellsData = getCells();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  List<SpannableGridCellData> getCells() {
    final result = <SpannableGridCellData>[];
    result.add(
      SpannableGridCellData(
        column: 1,
        row: 1,
        columnSpan: 1,
        rowSpan: 2,
        id: "0",
        child: Container(
          decoration: MyUtils.carBoxDecoration(
              cardImage: "assets/images/two_by_one_card1.png",
              isShowCardImage: true),
          child: Lottie.asset(
            value,
            key: _globalKey1,
            fit: BoxFit.fill,
            repeat: true,
          ),
        ),
      ),
    );
    result.add(
      SpannableGridCellData(
        column: 2,
        row: 1,
        columnSpan: 2,
        rowSpan: 2,
        id: "1",
        child: Container(
          decoration: MyUtils.carBoxDecoration(
              cardImage: "assets/images/four_by_four_card1.png",
              isShowCardImage: false),
          // there is a problem in no 3, please check
          child: Lottie.asset(
            "assets/lotties/character_1.json",
            key: _globalKey2,
            fit: BoxFit.fill,
            repeat: true,
          ),
        ),
      ),
    );
    result.add(
      SpannableGridCellData(
        column: 4,
        row: 1,
        columnSpan: 1,
        rowSpan: 2,
        id: "2",
        child: Container(
          decoration: MyUtils.carBoxDecoration(
              cardImage: "assets/images/two_by_one_card3.png"),
        ),
      ),
    );
    result.add(
      SpannableGridCellData(
        column: 2,
        row: 3,
        columnSpan: 2,
        rowSpan: 1,
        id: "4",
        child: Focus(
          autofocus: true,
          onKey:(FocusNode node, RawKeyEvent event) {
            return (event.logicalKey == LogicalKeyboardKey.arrowLeft)
                ? KeyEventResult.handled
                : KeyEventResult.ignored;
          },
          child: Container(
            decoration: MyUtils.carBoxDecoration(
                cardImage: "assets/images/one_by_two_card1.png"),
          ),
        ),
      ),
    );
    result.add(
      SpannableGridCellData(

        column: 1,
        row: 4,
        columnSpan: 1,
        rowSpan: 2,
        id: "6",
        child: Container(
          decoration: MyUtils.carBoxDecoration(
              cardImage: "assets/images/two_by_one_card2.png"),
        ),
      ),
    );
    result.add(
      SpannableGridCellData(
        column: 2,
        row: 4,
        columnSpan: 1,
        rowSpan: 1,
        id: "7",
        child: Container(
          decoration: MyUtils.carBoxDecoration(
              cardImage: "assets/images/one_by_one_card3.png"),
        ),
      ),
    );
    result.add(
      SpannableGridCellData(
        column: 3,
        row: 4,
        columnSpan: 1,
        rowSpan: 1,
        id: "8",
        child: Container(
          decoration: MyUtils.carBoxDecoration(
              cardImage: "assets/images/one_by_one_card4.png"),
        ),
      ),
    );
    result.add(
      SpannableGridCellData(
        column: 4,
        row: 4,
        columnSpan: 1,
        rowSpan: 2,
        id: "9",
        child: Container(
          decoration: MyUtils.carBoxDecoration(
              cardImage: "assets/images/two_by_one_card4.png"),
        ),
      ),
    );
    result.add(
      SpannableGridCellData(
        column: 2,
        row: 5,
        columnSpan: 1,
        rowSpan: 1,
        id: "10",
        child: Container(
          decoration: MyUtils.carBoxDecoration(
              cardImage: "assets/images/one_by_one_card1.png"),
        ),
      ),
    );
    result.add(
      SpannableGridCellData(
        column: 3,
        row: 5,
        columnSpan: 1,
        rowSpan: 1,
        id: "11",
        child: Container(
          decoration: MyUtils.carBoxDecoration(
              cardImage: "assets/images/one_by_one_card2.png"),
        ),
      ),
    );
    return result;
  }

  // _shuffle method
  void shuffle() {
    Get.toNamed(Routes.LEADER_BOARD);
    // data = List.generate(20, (index) => index);
  }

  Soundpool pool = Soundpool.fromOptions(/*options: StreamType.notification*/);
  int? soundId;

  intiMovingSound() async {
    soundId = await rootBundle
        .load("assets/music/slide_sound.mp3")
        .then((ByteData soundData) {
      return pool.load(soundData);
    });
  }
}
