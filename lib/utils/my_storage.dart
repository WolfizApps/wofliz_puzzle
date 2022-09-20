import 'package:get_storage/get_storage.dart';

class MyStorage {
  static final storage = GetStorage();
  static final String userEmail = 'user_email';
  static final String userPassword = 'user_password';
  static final String userName = 'user_name';
  static final String totalCount = 'total_count';
  static final String isUserLoggedIn = 'is_user_logged_in';
  static final String isInstructionShow = 'is_instruction_show';
  static final String board = 'true';

  static final String isPlayMusic = 'isPlayMusic';
  static final String isPlaySound = 'isPlaySound';

  ////userEmail
  static writeUserEmail(String value) {
    storage.write(userEmail, value);
  }

  static writeUserEmailIfNull(String value) {
    storage.writeIfNull(userEmail, value);
  }

  static String readQuserEmail() {
    writeUserEmailIfNull("userEmail");
    return storage.read(userEmail);
  }

  ////userPassword
  static writeUserPassword(String value) {
    storage.write(userPassword, value);
  }

  static writeUserPasswordIfNull(String value) {
    storage.writeIfNull(userPassword, value);
  }

  static String readUserPassword() {
    writeUserPasswordIfNull("userPassword");
    return storage.read(userPassword);
  }

  ////userName
  static writeUserName(String value) {
    storage.write(userName, value);
  }

  static String readQuserName() {
    return storage.read(userName) ?? '';
  }

  ////totalCount
  static writeTotalCount(String value) {
    storage.write(totalCount, value);
  }

  static writeTotalCountIfNull(String value) {
    storage.writeIfNull(totalCount, value);
  }

  static String readTotalCount() {
    writeTotalCountIfNull("totalCount");
    return storage.read(totalCount);
  }

  ////isUserLoggedIn
  static Future<void> writeIsUserLoggedIn(bool value) async {
    await storage.write(isUserLoggedIn, value);
  }

  static Future<void> writeIsUserLoggedInIfNull(bool value) async {
    await storage.writeIfNull(isUserLoggedIn, value);
  }

  static Future<bool> readIsUserLoggedIn() async {
    await writeIsUserLoggedInIfNull(false);
    return storage.read(isUserLoggedIn);
  }

  static Future<void> writeIsInstructionShow(bool value) async {
    await storage.write(isInstructionShow, value);
  }

  static Future<void> writeIsInstructionShowIfNull(bool value) async {
    await storage.writeIfNull(isInstructionShow, value);
  }

  static Future<bool> readIsInstructionShow() async {
    await writeIsInstructionShowIfNull(true);
    return storage.read(isInstructionShow);
  }

  static Future<void> readName() async {
    await writeIsInstructionShowIfNull(true);
    return storage.read(isInstructionShow);
  }

  static Future<void> writeBoard(String gameBoard) async {
    storage.write(board, gameBoard);
  }

  static String? readBoard() {
    try {
      return storage.read(board);
    } catch (e) {
      return null;
    }
  }

  static Future<void> writeLevel(String level) async {
    storage.write('level', level);
  }

  static String? readLevel() {
    try {
      return storage.read('level');
    } catch (e) {
      return null;
    }
  }

  ////isPlayMusic
  static writeIsPlayMusic(bool value) {
    storage.write(isPlayMusic, value);
  }

  static bool readIsPlayMusic() {
    storage.writeIfNull(isPlayMusic, true);
    return storage.read(isPlayMusic);
  }

  ////isPlaySound
  static writeIsPlaySound(bool value) {
    storage.write(isPlaySound, value);
  }

  static bool readIsPlaySound() {
    storage.writeIfNull(isPlaySound, true);
    return storage.read(isPlaySound);
  }
}
