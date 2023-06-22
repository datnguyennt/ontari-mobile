import 'package:dio/dio.dart';

import 'base_exception.dart';

Exception handleError(String error) {
  return AppException(error);
}

Exception handleDioError(DioException dioError) {
  switch (dioError.type) {
    case DioExceptionType.cancel:
      return AppException('Request to API server was cancelled');
    case DioExceptionType.connectionTimeout:
      return AppException('Connection timeout with API server');

    case DioExceptionType.receiveTimeout:
      return AppException('Receive timeout in connection with API server');
    case DioExceptionType.sendTimeout:
      return AppException('Send timeout in connection with API server');
    case DioExceptionType.unknown:
      if (dioError.message == null) {
        return AppException('No Internet');
      }
      if (dioError.message!.contains('SocketException')) {
        return AppException('No Internet');
      }
      return AppException('Unexpected error occurred');
    case DioExceptionType.badResponse:
      return _parseDioErrorResponse(dioError);
    default:
      return AppException('Something went wrong');
  }
}

AppException _parseDioErrorResponse(DioException dioError) {
  final int statusCode = dioError.response?.statusCode ?? -1;
  String? serverMessage;

  switch (statusCode) {
    case 400:
      return AppException(serverMessage ?? 'Bad request');
    case 401:
      return AppException(serverMessage ?? 'Unauthorized');
    case 403:
      return AppException(serverMessage ?? 'Forbidden');
    case 404:
      return AppException(serverMessage ?? 'Not found');
    case 500:
      return AppException(serverMessage ?? 'Internal server error');
    case 502:
      return AppException(serverMessage ?? 'Bad gateway');
    default:
      return AppException(serverMessage ?? 'Oops something went wrong');
  }
}

enum AuthResultStatus {
  successful,
  emailAlreadyExists,
  wrongPassword,
  invalidEmail,
  userNotFound,
  userDisabled,
  operationNotAllowed,
  tooManyRequests,
  undefined,
  weakPassword,
  accountExistsWithDifferentCredential
}

AuthResultStatus handleAuthException(dynamic e) {
  AuthResultStatus status;
  switch (e.code) {
    case 'invalid-email':
      status = AuthResultStatus.invalidEmail;
      break;
    case 'wrong-password':
      status = AuthResultStatus.wrongPassword;
      break;
    case 'user-not-found':
      status = AuthResultStatus.userNotFound;
      break;
    case 'user-disabled':
      status = AuthResultStatus.userDisabled;
      break;
    case 'ERROR_TOO_MANY_REQUESTS':
      status = AuthResultStatus.tooManyRequests;
      break;
    case 'operation-not-allowed':
      status = AuthResultStatus.operationNotAllowed;
      break;
    case 'email-already-in-use':
      status = AuthResultStatus.emailAlreadyExists;
      break;
    case 'weak-password':
      status = AuthResultStatus.weakPassword;
      break;
    case 'account-exists-with-different-credential':
      status = AuthResultStatus.accountExistsWithDifferentCredential;
      break;
    default:
      status = AuthResultStatus.undefined;
  }
  return status;
}

String generateExceptionMessage(AuthResultStatus exceptionCode) {
  String errorMessage;
  switch (exceptionCode) {
    case AuthResultStatus.invalidEmail:
      errorMessage = 'Your email address appears to be malformed.';
      break;
    case AuthResultStatus.wrongPassword:
      errorMessage = 'Your password is wrong.';
      break;
    case AuthResultStatus.userNotFound:
      errorMessage = "User with this email doesn't exist.";
      break;
    case AuthResultStatus.userDisabled:
      errorMessage = 'User with this email has been disabled.';
      break;
    case AuthResultStatus.tooManyRequests:
      errorMessage = 'Too many requests. Try again later.';
      break;
    case AuthResultStatus.operationNotAllowed:
      errorMessage = 'Signing in with Email and Password is not enabled.';
      break;
    case AuthResultStatus.emailAlreadyExists:
      errorMessage =
          'The email has already been registered. Please login or reset your password.';
      break;
    case AuthResultStatus.weakPassword:
      errorMessage = 'Password too weak';
      break;
    case AuthResultStatus.accountExistsWithDifferentCredential:
      errorMessage = 'The account already exists with a different credential';
      break;
    case AuthResultStatus.successful:
      errorMessage = '';
      break;
    case AuthResultStatus.undefined:
      errorMessage = 'Undefined';
      break;
  }

  return errorMessage;
}
