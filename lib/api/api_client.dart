// lib/api/api_client.dart
import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;

  // Ganti BASE_URL ini dengan URL mockapi Anda (contoh dari mockapi.io)
  static const String baseUrl = 'https://68ff5f6ae02b16d1753da9db.mockapi.io/';

  ApiClient()
    : _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: 15000,
          receiveTimeout: 15000,
        ),
      );

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) {
    return _dio.get(path, queryParameters: queryParameters);
  }

  Future<Response> post(String path, dynamic data) {
    return _dio.post(path, data: data);
  }

  Future<Response> put(String path, dynamic data) {
    return _dio.put(path, data: data);
  }

  Future<Response> delete(String path) {
    return _dio.delete(path);
  }
}
