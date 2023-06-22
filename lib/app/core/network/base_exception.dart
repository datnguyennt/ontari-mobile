
abstract class BaseException implements Exception {
  final String message;

  BaseException({this.message = 'There\'s an error'});
}

class AppException extends BaseException {
  AppException(
    String message,
  ) : super(message: message);
}
