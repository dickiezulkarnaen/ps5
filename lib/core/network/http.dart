import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ps5/core/completion.dart';
import 'package:ps5/core/network/http_interceptor.dart';
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
    dio.interceptors.add(HttpInterceptor());
  }

  Future<Completion> request({
    required Method method,
    required String path,
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    Map<String, dynamic>? additionalHeaders,
  }) async {
    if (additionalHeaders != null) baseHeaders.addAll(additionalHeaders);
    final options = Options(
      method: method.name.toUpperCase(),
      headers: baseHeaders,
      contentType: 'application/json',
    );
    try {
      final request = await dio.request(
        path,
        queryParameters: params,
        data: body,
        options: options,
      );
      final statusCode = request.statusCode ?? 500;
      final isSuccessful = statusCode >= 200 && statusCode <= 300;
      return Completion(isSuccessful: isSuccessful, message: request.statusMessage, result: request.data);
     } on DioError catch(e) {
      return Completion(isSuccessful: false, message: e.response?.statusMessage, result: e.response?.data);
     }
  }

  Future<Completion> get(
      {required String path,
      Map<String, dynamic>? params,
      Map<String, dynamic>? additionalHeaders}) async {
    return await request(
      method: Method.get,
      path: path,
      params: params,
      additionalHeaders: additionalHeaders,
    );
  }

  Future<Completion> post(
      {required String path,
      Map<String, dynamic>? body,
      Map<String, dynamic>? additionalHeaders}) async {
    return await request(
        method: Method.post,
        path: path,
        body: body,
        additionalHeaders: additionalHeaders);
  }

  Future<Completion> put(
      {required String path,
      Map<String, dynamic>? params,
      Map<String, dynamic>? body,
      Map<String, dynamic>? additionalHeaders}) async {
    return await request(
        method: Method.put,
        path: path,
        params: params,
        body: body,
        additionalHeaders: additionalHeaders);
  }

  Future<Completion> delete(
      {required String path,
      Map<String, dynamic>? params,
      Map<String, dynamic>? body,
      Map<String, dynamic>? additionalHeaders}) async {
    return await request(
        method: Method.delete,
        path: path,
        params: params,
        body: body,
        additionalHeaders: additionalHeaders);
  }
}