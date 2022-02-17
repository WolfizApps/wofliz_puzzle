import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyUtils {
  static showToast(String message) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Color(0XFF6D54B5),
      textColor: Colors.white,
      fontSize: 24.0,
    );
  }

  static String getFormattedNumber(int number) {
    if (number >= 11 && number <= 13) {
      return number.toString() + 'th';
    }

    switch (number % 10) {
      case 1:
        return number.toString() + 'st';
      case 2:
        return number.toString() + 'nd';
      case 3:
        return number.toString() + 'rd';
      default:
        return number.toString() + 'th';
    }
  }

  static myCardShadow() {
    return BoxShadow(
      color: Colors.black.withOpacity(0.80), //color of shadow
      spreadRadius: 3, //spread radius
      blurRadius: 7, // blur radius
      offset: Offset(0, 10), // changes position of shadow
    );
  }

  static carBoxDecoration(
      {required String cardImage, bool isShowCardImage = true}) {
    return isShowCardImage
        ? BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
                image: AssetImage(
                  cardImage,
                ),
                fit: BoxFit.fill),
            boxShadow: [myCardShadow()],
          )
        : BoxDecoration(
            color: Colors.transparent,
            boxShadow: [myCardShadow()],
          );
  }

  static makeScreenResponsive(BuildContext context){
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(457, 812),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);
  }
}
