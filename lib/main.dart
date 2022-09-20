// import 'package:firebase_core/firebase_core.dart';
// import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:puzzle_game/app/routes/app_pages.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // if (kIsWeb || Platform.isAndroid || Platform.isIOS) {
  //   await Firebase.initializeApp();
  // } else {
  //   await Firestore.initialize("puzzle-game-1dc21");
  //   await Firebase.initializeApp(
  //       options: const FirebaseOptions(
  //           apiKey: "AIzaSyAu2LViM3xSRMbW05T-i71fas0BS5439Uk",
  //           appId: "1:293222509278:android:40fddbc6b49084cf91704f",
  //           messagingSenderId: '293222509278',
  //           projectId: "puzzle-game-1dc21"));
  // }

  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 811),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => GetMaterialApp(
          title: 'Puzzle',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          builder: (_, __) {
            // ScreenUtil.setContext(_);
            return __!;
          },
          getPages: AppPages.routes,
          initialRoute: Routes.SPLASH),
    );
  }
}
