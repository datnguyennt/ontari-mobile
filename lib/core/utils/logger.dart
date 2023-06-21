import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;
import 'package:flutter/foundation.dart';

class Log {
  Log._();

  static const _enableLog = LogConfig.enableGeneralLog;

  static void d(
    Object? message, {
    String? name,
    DateTime? time,
  }) {
    _log('💡 $message', name: name ?? '', time: time);
  }

  static void e(
    Object? errorMessage, {
    String? name,
    Object? errorObject,
    StackTrace? stackTrace,
    DateTime? time,
  }) {
    _log(
      '💢 $errorMessage',
      name: name ?? '',
      error: errorObject,
      stackTrace: stackTrace,
      time: time,
    );
  }

  static String prettyJson(Map<String, dynamic> json) {
    if (!LogConfig.isPrettyJson) {
      return json.toString();
    }

    final indent = '  ' * 2;
    final encoder = JsonEncoder.withIndent(indent);

    return encoder.convert(json);
  }

  static void _log(
    String message, {
    int level = 0,
    String name = '',
    DateTime? time,
    int? sequenceNumber,
    Zone? zone,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (_enableLog) {
      dev.log(
        message,
        name: name,
        time: time,
        sequenceNumber: sequenceNumber,
        level: level,
        zone: zone,
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
}

class LogConfig {
  const LogConfig._();

  static const enableGeneralLog = kDebugMode;
  static const isPrettyJson = kDebugMode;

  /// bloc observer
  static const logOnBlocChange = false;
  static const logOnBlocCreate = false;
  static const logOnBlocClose = false;
  static const logOnBlocError = false;
  static const logOnBlocEvent = kDebugMode;
  static const logOnBlocTransition = false;

  /// navigator observer
  static const enableNavigatorObserverLog = kDebugMode;

  /// disposeBag
  static const enableDisposeBagLog = false;

  /// stream event log
  static const logOnStreamListen = false;
  static const logOnStreamData = false;
  static const logOnStreamError = false;
  static const logOnStreamDone = false;
  static const logOnStreamCancel = false;

  /// log interceptor
  static const enableLogInterceptor = kDebugMode;
  static const enableLogRequestInfo = kDebugMode;
  static const enableLogSuccessResponse = kDebugMode;
  static const enableLogErrorResponse = kDebugMode;

  /// enable log usecase
  static const enableLogUseCaseInput = kDebugMode;
  static const enableLogUseCaseOutput = kDebugMode;
  static const enableLogUseCaseError = kDebugMode;
}

mixin LogMixin on Object {
  void logD(String message, {DateTime? time}) {
    Log.d(message, name: runtimeType.toString(), time: time);
  }

  void logE(
    Object? errorMessage, {
    Object? clazz,
    Object? errorObject,
    StackTrace? stackTrace,
    DateTime? time,
  }) {
    Log.e(
      errorMessage,
      name: runtimeType.toString(),
      errorObject: errorObject,
      stackTrace: stackTrace,
      time: time,
    );
  }
}
