// ignore_for_file: strict_raw_type

import 'package:dio/dio.dart';

const baseUrl = 'https://opentdb.com/api.php';

class DioRequest {
  DioRequest() {
    updateDioInterceptors();
  }
  final Dio _dio = Dio();

  void updateAuthorization(String token) {
    _dio.options.headers['authorization'] = token;
  }

  void updateDioInterceptors() {
    _dio
      ..options = BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        validateStatus: (value) {
          return value! <= 500;
        },
        headers: {
          'Accept': 'application/json',
        },
      )
      ..interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
      )
      ..interceptors.add(
        InterceptorsWrapper(
          onError: (DioError e, handler) {
            if (e.response?.statusCode == 402) {
              //logout user and go to login page
            }
            return handler.next(e);
          },
        ),
      );
  }

  // requests
  Future<Response> get(String path) async {
    return _dio.get(path);
  }

  Future<Response> post(String path, {Object? data}) async {
    return _dio.post(path, data: data);
  }
}
