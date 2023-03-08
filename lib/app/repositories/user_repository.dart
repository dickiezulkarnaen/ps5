
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ps5/app/base/base_repository.dart';
import 'package:ps5/app/data/local/local_database.dart';
import 'package:ps5/app/models/user_model.dart';
import 'package:ps5/app/repositories/user_repository_usecase.dart';
import 'package:ps5/core/completion.dart';
import 'package:ps5/utils/logger_util.dart';

class UserRepository extends BaseRepository implements IUserRepository {

  static final _firebaseFirestore = FirebaseFirestore.instance;

  @override
  void saveUserToLocal(UserModel user) {
    LocalDatabase.saveUser(user);
  }

  @override
  Future<Completion> getUserFromLocal(String email) async {
    final res = LocalDatabase.getCurrentUser();
    return Completion(result: res);
  }

  @override
  Future<Completion> getUserFromServer(String email) async {
    try {
      final user = await _firebaseFirestore.collection('users').where('email', isEqualTo: email).get();
      final data = user.docs.isNotEmpty ? user.docs[0] : null;
      Logging.debug('USER : ${jsonEncode(data)}');
      if (data != null) {
        return Completion(isSuccessful: true, result: jsonEncode(data), message: 'Success');
      } else {
        return Completion(isSuccessful: false, result: jsonEncode(data), message: 'No data available');
      }
    } catch (e) {
      return Completion(isSuccessful: false, result: e, message: 'Unable to get data');
    }
  }

  @override
  Future<Completion> getUser(String email) async {
    final fromServer = await getUserFromServer(email);
    if (fromServer.isSuccessful) {
      return fromServer;
    } else {
      final fromLocal = await getUserFromLocal(email);
      return fromLocal;
    }
  }

}