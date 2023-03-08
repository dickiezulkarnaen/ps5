import 'package:firebase_core/firebase_core.dart';

class FirebaseApplication {
  static Future<void> init() async {
    await Firebase.initializeApp();
  }
}