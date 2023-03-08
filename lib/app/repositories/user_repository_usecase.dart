
import 'package:ps5/app/models/user_model.dart';
import 'package:ps5/core/completion.dart';

abstract class IUserRepository {
  Future<Completion> getUser(String email);
  Future<Completion> getUserFromServer(String email);
  void saveUserToLocal(UserModel user);
  Future<Completion> getUserFromLocal(String email);
}