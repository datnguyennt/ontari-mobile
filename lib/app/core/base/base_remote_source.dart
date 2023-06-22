import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../di/di.dart';

import '../../data/database/firebase_database.dart';
import '../network/base_exception.dart';
import '../network/dio.helper.dart';
import '../network/error_handlers.dart';
import '../utils/logger.dart';

abstract class BaseRemoteSource with LogMixin {
  DioHelper get dioHelper => getIt<DioHelper>();
  FirebaseDataBase get firebaseDataBase => getIt<FirebaseDataBase>();

  Future<HttpResponse> callApiWithErrorParser<T>(
      Future<HttpResponse> api) async {
    try {
      final HttpResponse response = await api;
      return response;
    } on FirebaseAuthException catch (e) {
      final status = handleAuthException(e);
      throw generateExceptionMessage(status);
    } on DioException catch (dioError) {
      throw handleDioError(dioError);
    } catch (error) {
      if (error is BaseException) {
        rethrow;
      }
      throw handleError('$error');
    }
  }
}
