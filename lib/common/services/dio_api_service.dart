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
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        contentType: Headers.jsonContentType,
        responseType: ResponseType.plain,
      ),
    );
  }

  Future<Response<dynamic>> get(
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
