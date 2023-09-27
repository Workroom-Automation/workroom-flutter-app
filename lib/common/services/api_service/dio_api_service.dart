import 'package:dio/dio.dart';
import 'package:supertokens_flutter/dio.dart';

class DioApiService {
  DioApiService(String baseUrl) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        // connectTimeout: timeOut,
        // receiveTimeout: timeOut,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.plain,
      ),
    );
    _dio.interceptors.add(SuperTokensInterceptorWrapper(client: _dio));
  }

  late final Dio _dio;
  int timeOut = 15000;

  Future<Response<Map<String, dynamic>>> get(
    String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  ) {
    return _dio.get(
      path,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );
  }

  Future<Response<dynamic>> post(
    String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  ) {
    return _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );
  }

  Future<Response<dynamic>> put(
    String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  ) {
    return _dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );
  }

  Future<Response<dynamic>> delete(
    String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  ) {
    return _dio.delete(
      path,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );
  }
}
