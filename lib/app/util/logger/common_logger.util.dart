import 'package:logger/logger.dart';

// enum Level {
//   verbose,
//   debug,
//   info,
//   warning,
//   error,
//   wtf,
//   nothing,
// }

class CommonLog {
  static final _logger = Logger(
      printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 50,
  ),);

  static void info(String message) {
    _logger.log(
      Level.info,
      message,
      'An error',
      const StringStackTrace('Your stacktrace here'),
    );
  }

  static void debug(String message) {
    _logger.log(
      Level.debug,
      message,
      const StringStackTrace('Your stacktrace here'),
    );
  }

  static void error(String message) {
    _logger.log(
      Level.error,
      message,
      // const StringStackTrace("Your stacktrace here"),
    );
  }
}

class StringStackTrace implements StackTrace {

  const StringStackTrace(this._stackTrace);
  final String _stackTrace;

  @override
  String toString() => _stackTrace;
}
