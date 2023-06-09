import 'package:dio/dio.dart';
import 'package:ontari_mobile/core/common/exception/error_type.dart';
import 'package:ontari_mobile/core/common/exception/result.dart';
import 'package:ontari_mobile/core/common/logger.dart';
import 'package:ontari_mobile/data/remote/dto/model_base_response.dart';

typedef EntityToModelMapper<Entity, Data> = Data? Function(Entity? entity);
typedef SaveResult<Data> = Future Function(Data? data);

abstract class BaseRepository with LogMixin {
  Future<Result<Data>> safeDbCall<Entity, Data>(
    Future<Entity?> callDb, {
    required EntityToModelMapper<Entity, Data> mapperDb,
  }) async {
    try {
      final response = await callDb;
      if (response != null) {
        logD('DB success message -> $response');
        return Success(mapperDb.call(response));
      } else {
        logD('DB response is null');
        return Error(ErrorType.GENERIC, 'DB response is null!');
      }
    } catch (exception) {
      logD('DB failure message -> $exception');
      return Error(ErrorType.GENERIC, 'Unknown DB error');
    }
  }

  Future<Result<Data>> safeApiCall<Data>(
    Future<ModelBaseResponse<Data>> call, {
    SaveResult<Data>? saveResult,
  }) async {
    logD('safeApiCall');
    try {
      var response = await call;
      if (response.isSuccess()) {
        await saveResult?.call(response.data);
        return Success(response.data);
      } else if (response.isTokenExprired()) {
        return Error(
          ErrorType.TOKEN_EXPIRED,
          response.message ?? 'Unknown Error',
        );
      } else {
        logE('response.message -> ${response.message}');
        return Error(ErrorType.GENERIC, response.message ?? 'Unknown Error');
      }
    } on Exception catch (exception) {
      logE('Api error message -> ${exception.toString()}');
      if (exception is DioException) {
        switch (exception.type) {
          case DioExceptionType.connectionTimeout:
          case DioExceptionType.sendTimeout:
          case DioExceptionType.receiveTimeout:
          case DioExceptionType.cancel:
            return Error(ErrorType.POOR_NETWORK, exception.message ?? '');
          case DioExceptionType.unknown:
            return Error(ErrorType.NO_NETWORK, exception.message ?? '');
          case DioExceptionType.badCertificate:
          case DioExceptionType.badResponse:
          case DioExceptionType.connectionError:
            return Error(ErrorType.GENERIC, exception.message ?? '');
        }
      }
      return Error(ErrorType.GENERIC, 'Unknown API error');
    }
  }
}
