import 'package:flutter/material.dart';
import 'main_app.dart';
import 'flavors.dart';

void main() {
  AppFlavor.appFlavor = Flavor.DEV;
  runApp(const App());
}
