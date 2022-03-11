import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:puzzle_game/app/modules/choose_character/bindings/choose_character_binding.dart';
import 'package:puzzle_game/app/modules/choose_character/views/choose_character_view.dart';
import 'package:puzzle_game/app/modules/forgot_password/bindings/forgot_password_binding.dart';
import 'package:puzzle_game/app/modules/forgot_password/views/forgot_password_view.dart';
import 'package:puzzle_game/app/modules/home/bindings/home_binding.dart';
import 'package:puzzle_game/app/modules/home/views/home_view.dart';
import 'package:puzzle_game/app/modules/leader_board/bindings/leader_board_binding.dart';
import 'package:puzzle_game/app/modules/leader_board/views/leader_board_view.dart';
import 'package:puzzle_game/app/modules/login/bindings/login_binding.dart';
import 'package:puzzle_game/app/modules/login/views/login_view.dart';
import 'package:puzzle_game/app/modules/main_game/bindings/main_game_binding.dart';
import 'package:puzzle_game/app/modules/main_game/views/main_game_view.dart';
import 'package:puzzle_game/app/modules/register/bindings/register_binding.dart';
import 'package:puzzle_game/app/modules/register/views/register_view.dart';
import 'package:puzzle_game/app/modules/splash/bindings/splash_binding.dart';
import 'package:puzzle_game/app/modules/splash/views/splash_view.dart';
import 'package:puzzle_game/app/modules/update_password/bindings/update_password_binding.dart';
import 'package:puzzle_game/app/modules/update_password/views/update_password_view.dart';
import 'package:puzzle_game/app/modules/verify_otp/bindings/verify_otp_binding.dart';
import 'package:puzzle_game/app/modules/verify_otp/views/verify_otp_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.REGISTER;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => MyHomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY_OTP,
      page: () => VerifyOtpView(),
      binding: VerifyOtpBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_PASSWORD,
      page: () => UpdatePasswordView(),
      binding: UpdatePasswordBinding(),
    ),
    GetPage(
      name: _Paths.CHOOSE_CHARACTER,
      page: () => ChooseCharacterView(),
      binding: ChooseCharacterBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_GAME,
      page: () => MainGameView(),
      binding: MainGameBinding(),
    ),
    GetPage(
      name: _Paths.LEADER_BOARD,
      page: () => LeaderBoardView(),
      binding: LeaderBoardBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
