import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:path_provider/path_provider.dart';

class FileUtil {
  static String applicationDir = '';

  static Future<void> getApplicationDir() async {
    final String dir = (await getApplicationSupportDirectory()).path;
    FileUtil.applicationDir = dir.replaceAll('files', '');
  }

  static String getFileExtension(String fileName) {
    try {
      return ".${fileName.split('.').last}";
    } catch (e) {
      return '';
    }
  }

  static String getMimeType(String path) {
    return lookupMimeType(path).toString();
  }

  static MediaType getMediaType(File file) {
    return MediaType.parse(getMimeType(file.path));
  }

  static Future<File> getImageFileFromAssets({
    required String path,
    required String fileName,
  }) async {
    final byteData = await rootBundle.load(path);
    final file = File('$applicationDir/$fileName.png');
    await file.writeAsBytes(
      byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes),
    );
    return file;
  }
}
