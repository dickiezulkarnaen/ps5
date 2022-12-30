import 'package:logger/logger.dart';

class Logging extends Logger {

  Logging._();

  static Logging? _logging;

  static Logging _instance() {
    return _logging ??= Logging._();
  }

  static void debug(dynamic message) {
    _instance().d(message);
  }

  static void warning(dynamic message) {
    _instance().w(message);
  }

  static void error(dynamic message) {
    _instance().e(message);
  }

  static void verbose(dynamic message) {
    _instance().v(message);
  }

  static void whatTF(dynamic message) {
    _instance().wtf(message);
  }

}