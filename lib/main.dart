import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:puzzle_game/app/routes/app_pages.dart';
import 'package:puzzle_game/utils/my_storage.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:firebase_core/firebase_core.dart';
main() async {
  /*SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,overlays: []);*/
  WidgetsFlutterBinding.ensureInitialized();

  if(kIsWeb || Platform.isAndroid || Platform.isIOS) {
    await Firebase.initializeApp();
     }
  else{
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAu2LViM3xSRMbW05T-i71fas0BS5439Uk",
            appId: "1:293222509278:android:40fddbc6b49084cf91704f",
            messagingSenderId: '293222509278',
            projectId: "puzzle-game-1dc21"
        )
    );

  }
  // await Firebase.initializeApp(
  //     name: 'puzzle_game',
  //     options: const FirebaseOptions(
  //       apiKey: "AIzaSyBWZYXXC87DHcP6jBfX-op2Q2-vWG4Mdfc",
  //       appId: "1:293222509278:web:f6587a04ce2c3e8891704f",
  //       messagingSenderId: "293222509278",
  //       projectId:"puzzle-game-1dc21",
  //     )
  // );

  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Puzzle',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: AppPages.routes,
      initialRoute: !MyStorage.readIsUserLoggedIn()
          ? Routes.SPLASH
          : Routes.CHOOSE_CHARACTER,
      // home: AppPages.INITIAL,
    );
  }
}
