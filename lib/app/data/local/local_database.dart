
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ps5/app/models/user_model.dart';

class LocalDatabase {

  static Future<void> initialize() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    await Hive.openBox('box');
  }

  static UserModel? getCurrentUser() {
    return Hive.box('box').get(Keys._user);
  }

  static bool isLoggedIn() {
    return Hive.box('box').get(Keys._isLoggedIn, defaultValue: false);
  }

  static void saveUser(UserModel user) {
    Hive.box('box').put(Keys._user, user);
  }

  static void setIsLoggedIn(bool value) {
    Hive.box('box').put(Keys._isLoggedIn, value);
  }

}

mixin Keys {
  static const _isLoggedIn = 'IS_LOGGED_IN';
  static const _user = 'USER';
}