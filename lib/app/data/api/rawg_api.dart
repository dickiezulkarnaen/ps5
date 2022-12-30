

import 'package:ps5_dicky_iskandar_z/app/constants/api_constants.dart';
import 'package:ps5_dicky_iskandar_z/core/network/http.dart';

class RawgApi extends Http {

  @override
  Map<String, dynamic> get baseHeaders => {};

  @override
  String get baseUrl => ApiConstant.rawgApiBaseUrl;

}