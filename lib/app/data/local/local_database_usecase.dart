
import 'package:ps5/app/models/user_model.dart';

abstract class ILocalDatabase {
  void setIsLoggedIn(bool value);
  Future<bool> isLoggedIn();
  void saveUser(UserModel user);
  Future<UserModel?> getCurrentUser();
}