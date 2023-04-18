// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'package:path/path.dart';

// import 'package:ontari_mobile/package/quartet_dart/lib/src/quartet.dart';

// Future<void> main() async {
//   print('Input path: ');
//   var dirAddress = stdin.readLineSync(encoding: utf8);
//   //print(dirAddress);
//   if (dirAddress == null) return;

//   bool exists = await Directory(dirAddress).exists();
//   if (exists) {
//     var dir = Directory(dirAddress);
//     var nameOfDir = dirAddress.substring(dirAddress.lastIndexOf('/'));
//     var file = File('$dirAddress/asset.dart');
//     var sink = file.openWrite();
//     readFile(dir.path, dir, sink);
//     sink.close();
//   } else {
//     print('Wrong input!!!');
//   }
// }

// void readFile(String parent, Directory dir, IOSink sink) {
//   List contents = dir.listSync();
//   print('Input class name: ');
//   var classname = stdin.readLineSync(encoding: utf8);
//   sink.write('class $classname { \n');
//   for (var fileOrDir in contents) {
//     if (fileOrDir is File) {
//       File file = File(fileOrDir.path);
//       String filename = basenameWithoutExtension(file.path)
//           .replaceAll('_', ' ')
//           .replaceAll('-', ' ');
//       filename = camelCase(filename);
//       String path = fileOrDir.path.replaceAll('\\', '/');
//       writeFile(filename, path, sink);
//     } else if (fileOrDir is Directory) {
//       readFile(parent, fileOrDir, sink);
//     }
//   }
//   sink.write('}\n');
// }

// void writeFile(String fileName, String path, IOSink sink) {
//   sink.write('static const $fileName = \'$path\';\n');
// }
