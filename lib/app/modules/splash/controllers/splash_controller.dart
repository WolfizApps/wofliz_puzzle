import 'dart:async';

import 'package:get/get.dart';

import '../../../../utils/my_storage.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();

    Future.delayed(


         Duration(seconds: 3), () {

           if( !MyStorage.readIsUserLoggedIn()){

           Get.offNamed(Routes.REGISTER);}
         else{
           Get.offNamed(Routes.CHOOSE_CHARACTER);
           }
         }


    );

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;
}
