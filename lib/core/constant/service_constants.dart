import '../../flavors.dart';

abstract class ServiceConstants {
  static final baseUrl = AppFlavor.apiBaseUrl;
  static const version = '/1.0';
  static const timeOut = 30 * 1000;
}

class RequestHeader {
  static const tokenKey = 'AUTH_TOKEN';
  static const language = 'Lang';
}

class RequestHeaderValue {
  static const String langVi = 'vi';
  static const String langEn = 'en';
}

class NetworkRequestValues {
  static const contentType = 'application/json';
}
