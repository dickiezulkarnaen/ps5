import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ps5/core/completion.dart';
import 'package:ps5/utils/logger_util.dart';


enum Method { get, post, put, delete, patch }

abstract class Http {

  String get baseUrl;
  Map<String, dynamic> get baseHeaders;

  late Dio dio;

  Http() {
    final baseOption = BaseOptions(
      baseUrl: baseUrl,
      headers: baseHeaders,
      sendTimeout: 50000,
      receiveTimeout: 50000,
    );
    dio = Dio(baseOption);
  }

  Future<Completion> request({
    required Method method,
    required String path,
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    Map<String, dynamic>? additionalHeaders,
    Options? options,
  }) async {
    final headers = baseHeaders;
    if (additionalHeaders != null) headers.addAll(additionalHeaders);
    final options = Options(
      method: method.name.toUpperCase(),
      headers: headers,
      contentType: 'application/json',
    );
    try {
      Logging.debug('Request : ${dio.options.baseUrl}$path');
      Logging.debug('Params : $params');
      final request = await dio.request(
        path,
        queryParameters: params,
        data: body,
        options: options,
      );
      final completion = Completion();
      final statusCode = request.statusCode ?? 500;
      completion.isSuccessful = statusCode >= 200 && statusCode <= 300;
      completion.message = request.statusMessage;
      completion.result = request.data;
      Logging.debug('Response : $statusCode - ${request.data}');
      return completion;
     } on DioError catch(e) {
      final completion = Completion();
      completion.isSuccessful = false;
      completion.message = e.response?.statusMessage;
      completion.result = e.response?.data;
      Logging.error('Error : ${jsonEncode(completion.result)}');
      return completion;
     }
  }

  Future<Completion> get({required String path, Map<String, dynamic>? params}) async {
    return await request(method: Method.get, path: path, params: params);
  }

  Future<Completion> post(String path, Map<String, dynamic>? body) async {
    return await request(method: Method.post, path: path, body: body);
  }

  Future<Completion> put(String path, Map<String, dynamic>? params, Map<String, dynamic>? body) async {
    return await request(method: Method.put, path: path, params: params, body: body);
  }

  Future<Completion> delete(String path, Map<String, dynamic>? params, Map<String, dynamic>? body) async {
    return await request(method: Method.delete, path: path, params: params, body: body);
  }

}