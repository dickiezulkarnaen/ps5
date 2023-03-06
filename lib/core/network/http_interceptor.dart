
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ps5/utils/logger_util.dart';

class HttpInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Logging.debug('Request        : [${options.method}] - ${options.uri}');
    Logging.debug('Headers        : ${jsonEncode(options.headers)}');
    if (options.data != null) Logging.debug('Body        : ${jsonEncode(options.data)}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Logging.debug('Response       : [${response.statusCode}] - ${jsonEncode(response.data)}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    Logging.error('Error Response : [${err.response?.statusCode}] - ${err.response?.data}', error: err);
    Logging.error('Message        : ${err.message} - ${err.response?.statusMessage}', error: err);
    if (err.response?.statusCode == 401) {
      // Logout
    }
    super.onError(err, handler);
  }

}