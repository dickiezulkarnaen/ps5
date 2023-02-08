

import 'package:ps5/app/constants/constants.dart';
import 'package:ps5/core/network/http.dart';

class RawgApi extends Http {

  @override
  Map<String, dynamic> get baseHeaders => {};

  @override
  String get baseUrl => ApiConstant.rawgApiBaseUrl;

}