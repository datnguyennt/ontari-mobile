import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ontari_mobile/core/common/logger.dart';
import 'package:ontari_mobile/core/file.utils.dart';
import 'package:ontari_mobile/core/network/dio_interceptors.dart';
import 'package:ontari_mobile/data/remote/service/service_constants.dart';
import 'package:path/path.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DioHelper with LogMixin {
  getDio() {
    Dio dio = Dio();
    dio.options = BaseOptions(
      baseUrl: ServiceConstants.baseUrl,
      contentType: NetworkRequestValues.contentType,
      sendTimeout: ServiceConstants.timeOut,
      connectTimeout: ServiceConstants.timeOut,
      receiveTimeout: ServiceConstants.timeOut,
    );
    if (!kIsWeb) {
      dio.interceptors.add(TokenInterceptor(dio));
    }
    return dio;
  }

  Future<HttpResponse> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    logD('REQUEST: GET => $url');
    final dio = getDio();
    try {
      final response = await dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return HttpResponse(
        body: response.data,
        headers: response.headers,
        request: response.requestOptions,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    } catch (e) {
      logE('message $e');
      rethrow;
    }
  }

  Future<HttpResponse> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    logD('REQUEST: POST => $url');
    final dio = getDio();
    try {
      final response = await dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return HttpResponse(
        body: response.data,
        headers: response.headers,
        request: response.requestOptions,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    } catch (e) {
      logE('message $e');
      rethrow;
    }
  }

  Future<HttpResponse> put(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    logD('REQUEST: PUT => $url');
    final dio = getDio();
    try {
      final response = await dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return HttpResponse(
        body: response.data,
        headers: response.headers,
        request: response.requestOptions,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    } catch (e) {
      logE('message $e');
      rethrow;
    }
  }

  Future<HttpResponse> delete(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    logD('REQUEST: DELETE => $url');
    final dio = getDio();
    try {
      final response = await dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return HttpResponse(
        body: response.data,
        headers: response.headers,
        request: response.requestOptions,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    } catch (e) {
      logE('message $e');
      rethrow;
    }
  }

  Future<HttpResponse> uploadFile(
    String url, {
    required File file,
    Options? options,
  }) async {
    logD('REQUEST: UPLOAD FILE => $url');
    final dio = getDio();

    try {
      final uploadFile = await MultipartFile.fromFile(
        file.path,
        filename: basename(file.path),
      );
      final formData = FormData.fromMap({'file': uploadFile});
      final response = await dio.post(url, data: formData, options: options);
      return HttpResponse(
        body: response.data,
        headers: response.headers,
        request: response.requestOptions,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    } catch (e) {
      logE('message $e');
      rethrow;
    }
  }

  Future<HttpResponse> patch(
    String url, {
    FormData? formData,
    Object? data,
    Options? options,
  }) async {
    logD('REQUEST: PATCH => $url');
    final dio = getDio();
    try {
      if (formData != null) data = formData;
      final Response response =
          await dio.patch(url, data: data, options: options);
      return HttpResponse(
        body: response.data,
        headers: response.headers,
        request: response.requestOptions,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    } catch (e) {
      logE('message $e');
      rethrow;
    }
  }

  static String? getUriQueryParam(Uri uri, String key) {
    final queryParams = uri.queryParametersAll.entries.toList();
    if (queryParams.any((_) => _.key == key)) {
      return queryParams.firstWhere((_) => _.key == key).value.first;
    }
    return null;
  }

  Future<HttpResponse> postFormData(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? formData,
  }) async {
    final dio = getDio();
    try {
      if (formData != null) {
        data = await DioHelper.mapToFormData(formData);
      }
      final Response response = await dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        onSendProgress: onSendProgress,
        options: options,
      );
      return HttpResponse(
        body: response.data,
        headers: response.headers,
        request: response.requestOptions,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    } catch (e) {
      logE('message $e');
      rethrow;
    }
  }

  Future<HttpResponse> patchFormData(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Map<String, dynamic>? formData,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final dio = getDio();
    try {
      if (formData != null) {
        data = await DioHelper.mapToFormData(formData);
      }
      final Response response = await dio.patch(
        url,
        data: data,
        queryParameters: queryParameters,
        onSendProgress: onSendProgress,
        options: options,
      );
      return HttpResponse(
        body: response.data,
        headers: response.headers,
        request: response.requestOptions,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    } catch (e) {
      logE('message $e');
      rethrow;
    }
  }

  Future<HttpResponse> putToS3(
    String url,
    Object data, {
    Options? options,
  }) async {
    logD('REQUEST: PUT => $url');

    Dio dio = Dio();
    final Response response = await dio.put(url, data: data, options: options);
    return HttpResponse(
      body: response.data,
      headers: response.headers,
      request: response.requestOptions,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }

  static Future<FormData> mapToFormData(Map<String, dynamic> map) async {
    final formData = FormData.fromMap(map);
    final FormData newData = FormData();

    ///
    formData.fields.forEach((element) async {
      newData.fields.add(MapEntry(element.key, element.value));
    });

    ///
    formData.files.forEach((element) async {
      if (element.key.contains('[') || element.key.contains(']')) {
        final newKey =
            element.key.replaceAllMapped(RegExp('([+[a-zA-Z]+])'), (m) {
          return '${m[0]}'.replaceAll('[', '.').replaceAll(']', '');
        });
        final newValue = element.value;
        final newEntry = MapEntry(newKey, newValue);
        newData.files.add(newEntry);
      } else {
        newData.files.add(element);
      }
    });

    /// Check image
    final FormData res = FormData();
    int index = 0;
    int count = 0;
    for (var element in formData.fields) {
      if (element.key.contains('attachments')) {
        if (!element.key.contains('$index')) {
          count = 0;
          index++;
        }
        final String image = element.value;
        try {
          final mediaType = FileUtil.getMediaType(File(image));
          final uploadFile = await MultipartFile.fromFile(
            image,
            filename: basename(image),
            contentType: mediaType,
          );
          res.files.add(MapEntry('files', uploadFile));
          res.fields.add(MapEntry('${element.key}[$index]', basename(image)));
          count++;
        } catch (_) {
          res.fields.add(MapEntry('${element.key}[$index]', image));
          count++;
        }
        continue;
      }

      if (element.key.contains('images')) {
        if (!element.key.contains('$index')) {
          count = 0;
          index++;
        }
        final String image = element.value;
        try {
          final mediaType = FileUtil.getMediaType(File(image));
          final uploadFile = await MultipartFile.fromFile(
            image,
            filename: basename(image),
            contentType: mediaType,
          );
          res.files.add(MapEntry('files', uploadFile));
          res.fields.add(MapEntry('${element.key}[$count]', basename(image)));
          count++;
        } catch (_) {
          res.fields.add(MapEntry('${element.key}[$count]', image));
          count++;
        }
        continue;
      }

      if (element.key.contains('image')) {
        final String image = element.value;
        try {
          final mediaType = FileUtil.getMediaType(File(image));
          final uploadFile = await MultipartFile.fromFile(
            image,
            filename: basename(image),
            contentType: mediaType,
          );
          res.files.add(MapEntry('files', uploadFile));
          res.fields.add(MapEntry(element.key, basename(image)));
        } catch (_) {
          res.fields.add(MapEntry(element.key, element.value));
        }
      } else if (element.key.contains('brandIcon')) {
        final String image = element.value;
        try {
          final mediaType = FileUtil.getMediaType(File(image));
          final uploadFile = await MultipartFile.fromFile(
            image,
            filename: basename(image),
            contentType: mediaType,
          );
          res.files.add(MapEntry('file', uploadFile));
          res.fields.add(MapEntry(element.key, basename(image)));
        } catch (_) {
          res.fields.add(MapEntry(element.key, element.value));
        }
      } else {
        res.fields.add(element);
      }
    }
    return res;
  }
}

class HttpResponse {
  HttpResponse({
    this.body,
    this.headers,
    this.request,
    this.statusCode,
    this.statusMessage,
    this.extra,
  });

  dynamic body;
  Headers? headers;
  RequestOptions? request;
  int? statusCode;
  String? statusMessage;
  Map<String, dynamic>? extra;
}
