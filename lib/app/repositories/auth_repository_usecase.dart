
import 'package:ps5/core/completion.dart';

abstract class IAuthRepository {
  Future<Completion> doLoginWithEmailAndPassword(String email, String password);
  void doSignOut();
  void setIsLoggedIn(bool value);
  bool isLoggedIn();
}