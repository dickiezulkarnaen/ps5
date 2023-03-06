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

  final interceptor = Interceptor();

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
      final completion = Completion();
      final statusCode = request.statusCode ?? 500;
      completion.isSuccessful = statusCode >= 200 && statusCode <= 300;
      completion.message = request.statusMessage;
      completion.result = request.data;
      return completion;
     } on DioError catch(e) {
      final completion = Completion();
      completion.isSuccessful = false;
      completion.message = e.response?.statusMessage;
      completion.result = e.response?.data;
      return completion;
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