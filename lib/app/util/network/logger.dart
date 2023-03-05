import 'dart:io';

import 'package:injectable/injectable.dart';

abstract class Logger {
  void log(String msg);
}

@injectable
class ConsoleLogger extends Logger {
  @override
  void log(String msg) {
    print('${DateTime.now()} : $msg');
  }
}

@injectable
class FileLogger extends Logger {
  File file;
  FileLogger(this.file);
  @override
  void log(String msg) {
    String logMsg = '${DateTime.now()} $msg \n';
    file.writeAsString(logMsg, mode: FileMode.append);
  }
}