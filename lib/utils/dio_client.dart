import 'package:dio/dio.dart';
import 'logger_service.dart';

class DioClient {
  final Dio _dio = Dio();

  DioClient() {
    _dio.options.connectTimeout = Duration(milliseconds: 15000);
    _dio.options.receiveTimeout = Duration(milliseconds: 3000);
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        LoggerService.log('Request: ${options.method} ${options.uri}');
        LoggerService.log('Query Parameters: ${options.queryParameters}');
        LoggerService.log('Request Body: ${options.data}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        LoggerService.log('Response: ${response.statusCode} ${response.data}');
        return handler.next(response);
      },
      onError: (DioError e, handler) {
        LoggerService.error('Error: ${e.message}');
        return handler.next(e);
      },
    ));
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters, dynamic body}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters, data: body);
      return response;
    } catch (e) {
      LoggerService.error('GET request failed: $e');
      rethrow;
    }
  }

  Future<Response> post(String path, {Map<String, dynamic>? queryParameters, dynamic body}) async {
    try {
      final response = await _dio.post(path, queryParameters: queryParameters, data: body);
      return response;
    } catch (e) {
      LoggerService.error('POST request failed: $e');
      rethrow;
    }
  }

  Future<Response> put(String path, {Map<String, dynamic>? queryParameters, dynamic body}) async {
    try {
      final response = await _dio.put(path, queryParameters: queryParameters, data: body);
      return response;
    } catch (e) {
      LoggerService.error('PUT request failed: $e');
      rethrow;
    }
  }

  Future<Response> delete(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.delete(path, queryParameters: queryParameters);
      return response;
    } catch (e) {
      LoggerService.error('DELETE request failed: $e');
      rethrow;
    }
  }
}
