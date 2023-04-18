import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

abstract class Logger {
  void log(String msg);
}

@injectable
class ConsoleLogger extends Logger {
  @override
  void log(String msg) {
    if (kDebugMode) {
      print('${DateTime.now()} : $msg');
    }
  }
}

@injectable
class FileLogger extends Logger {
  FileLogger(this.file);
  File file;
  @override
  void log(String msg) {
    final logMsg = '${DateTime.now()} $msg \n';
    file.writeAsString(logMsg, mode: FileMode.append);
  }
}
