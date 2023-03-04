enum Flavor {
  PROD,
  DEV,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.PROD:
        return 'Ontari-Prod';
      case Flavor.DEV:
        return 'Ontari-Dev';
      default:
        return 'title';
    }
  }

}
