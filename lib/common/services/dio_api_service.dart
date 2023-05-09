import 'dart:io';

import 'package:dio/dio.dart';

class DioApiService {
  late String _baseUrl;

  String get baseUrl => _baseUrl;

  set baseUrl(String value) {
    _baseUrl = value;
    initializeDio();
  }

  late final Dio _dio;

  void initializeDio() {
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          HttpHeaders.userAgentHeader: 'dio',
          'api': '1.0.0',
        },
        contentType: Headers.jsonContentType,
        responseType: ResponseType.plain,
      ),
    );
  }

  Future<Response<dynamic>> get(
    String path,
    Map<String, dynamic>? queryParameters,
  ) {
    return _dio.get(path, queryParameters: queryParameters);
  }

  Future<Response<dynamic>> post(
    String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  ) {
    return _dio.post(path, data: data, queryParameters: queryParameters);
  }

  Future<Response<dynamic>> put(
    String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  ) {
    return _dio.put(path, data: data, queryParameters: queryParameters);
  }

  Future<Response<dynamic>> delete(
    String path,
    Map<String, dynamic>? queryParameters,
  ) {
    return _dio.delete(path, queryParameters: queryParameters);
  }
}
