import 'package:get_storage/get_storage.dart';

class MyStorage {
  static final storage = GetStorage();
  static final String userEmail = 'user_email';
  static final String userPassword = 'user_password';
  static final String userName = 'user_name';
  static final String totalCount = 'total_count';
  static final String isUserLoggedIn = 'is_user_logged_in';
  static final String isInstructionShow='true';

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

  static writeUserNameIfNull(String value) {
    storage.writeIfNull(userName, value);
  }

  static String readQuserName() {
    writeUserNameIfNull("userName");
    return storage.read(userName);
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
  static writeIsUserLoggedIn(bool value) {
    storage.write(isUserLoggedIn, value);
  }

  static writeIsInstructionShow(bool value)
  {
    storage.write(isInstructionShow, value);
  }
  static writeIsUserLoggedInIfNull(bool value) {
    storage.writeIfNull(isUserLoggedIn, value);
  }

  static bool readIsUserLoggedIn() {
    writeIsUserLoggedInIfNull(false);
    return storage.read(isUserLoggedIn);
  }
  static bool readIsInstructionShow(){
    //writeIsInstructionShow(false);
    return storage.read(isInstructionShow);

  }
}
