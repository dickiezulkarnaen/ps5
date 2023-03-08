import 'dart:isolate';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:ps5/app/base/base_repository.dart';
import 'package:ps5/app/data/local/local_database.dart';
import 'package:ps5/app/repositories/auth_repository_usecase.dart';
import 'package:ps5/core/completion.dart';
import 'package:ps5/utils/logger_util.dart';

class AuthRepository extends BaseRepository implements IAuthRepository {

  static final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<Completion> doLoginWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      final data = {
        'email' : userCredential.user?.email,
        'uid' : userCredential.user?.uid,
      };
      return Completion(isSuccessful: userCredential.user != null, result: data);
    } on FirebaseAuthException catch (e) {
      Logging.error(e.message);
      return Completion(isSuccessful: false, result: e, message: e.message);
    }
  }

  @override
  void doSignOut() {
    //Isolate.spawn(_doSignOutIsolate, 2);
    LocalDatabase.setIsLoggedIn(false);
    _firebaseAuth.signOut();
  }

  @override
  void setIsLoggedIn(bool value) {
    LocalDatabase.setIsLoggedIn(value);
  }

  @override
  bool isLoggedIn() {
    return LocalDatabase.isLoggedIn();
  }

}

void _doSignOutIsolate(int attempt) {

}