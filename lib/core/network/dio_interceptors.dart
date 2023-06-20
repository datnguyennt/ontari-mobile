import 'dart:io';
import 'package:dio/dio.dart';
import '../constant/app_constants.dart';
import '../utils/logger.dart';
import 'token_manager.dart';

class TokenInterceptor extends InterceptorsWrapper with LogMixin {
  final Dio _dio;
  final TokenManager tokenManager = const TokenManager();
  String? _accessToken;

  TokenInterceptor(this._dio);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    _accessToken = await tokenManager.getAccessToken();
    if (!options.headers.containsKey(HttpHeaders.authorizationHeader)) {
      if (_accessToken != null) {
        options.headers.addAll({
          HttpHeaders.authorizationHeader:
              '${AppConstants.tokenType} $_accessToken',
        });
      }
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler,) async {
    try {
      if (_accessToken != null && err.response?.statusCode == 401) {
        // await _refreshToken(err, handler, options);
        // Recall Api with new access token
        err.requestOptions.headers[HttpHeaders.authorizationHeader] =
            '${AppConstants.tokenType} $_accessToken';
        final opts = Options(
          method: err.requestOptions.method,
          headers: err.requestOptions.headers,
        );
        final cloneReq = await _dio.request(
          err.requestOptions.path,
          options: opts,
          data: err.requestOptions.data,
          queryParameters: err.requestOptions.queryParameters,
        );
        logD('💫 RECALL: => ${err.requestOptions.path}');
        return handler.resolve(cloneReq);
      }
    } catch (e) {
      logE(
        'onError: ${err.response?.statusCode} - onError: ${err.response}',
      );
    }
    return handler.next(err);
  }

  // Future<void> _refreshToken(
  //   DioException err,
  //   ErrorInterceptorHandler handler,
  //   Options? options,
  // ) async {
  //   try {
  //     String refreshToken = await tokenManager.getRefreshToken();
  //     if (refreshToken.isEmpty) {
  //       tokenManager.cleanAuthBox();
  //       return;
  //     }
  //     // _tokenDio.options.headers[AppConstants.tokenType] = _accessToken;
  //     log('REQUEST: POST => ${Endpoints.refershToken}');
  //     final response = await _tokenDio
  //         .post(Endpoints.refershToken, data: {'refreshToken': refreshToken});
  //     TokenModel tokenData = TokenModel.fromJson(response.data['data']);

  //     _accessToken = tokenData.accessToken;
  //     await tokenManager.setAccessToken(tokenData.accessToken);
  //     await tokenManager.setRefreshToken(tokenData.refreshToken);
  //     await tokenManager.setTokenExpiredTime(tokenData.expiresIn);
  //   } catch (_) {
  //     tokenManager.cleanAuthBox();
  //   }
  // }
}
