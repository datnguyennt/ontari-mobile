// ignore_for_file: constant_identifier_names

enum Flavor {
  PROD,
  DEV,
}

class AppFlavor {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title => 'Ontari';
}
