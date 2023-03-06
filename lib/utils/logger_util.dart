


import 'dart:developer';

import 'package:flutter/foundation.dart';

class Logging {

  static void init() {}

  static void debug(dynamic message) {
    if (kDebugMode) log(message);
  }

  static void warning(dynamic message) {
    if (kDebugMode) log(message);
  }

  static void error(dynamic message, {dynamic error}) {
    if (kDebugMode) log(message, error: error);
  }

}