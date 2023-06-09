enum Flavor {
  DEV,
  QA,
  STAGING,
  PROD,
}

class AppFlavor {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.DEV:
        return '[DEV] eLearning Marketplace';
      case Flavor.QA:
        return '[QA] eLearning Marketplace';
      case Flavor.STAGING:
        return '[ST] eLearning Marketplace';
      case Flavor.PROD:
        return 'eLearning Marketplace';
      default:
        return 'Title';
    }
  }

  static String get apiBaseUrl {
    switch (appFlavor) {
      case Flavor.PROD:
        return 'http://192.168.2.238:8000';
      case Flavor.STAGING:
        return 'http://192.168.2.238:8000';
      case Flavor.QA:
        return 'http://192.168.2.238:8000';
      case Flavor.DEV:
        return 'http://192.168.2.238:8000';
      default:
        return '';
    }
  }

  static String get conditionsTerms {
    switch (appFlavor) {
      case Flavor.PROD:
        return 'https://www.termsfeed.com/live/60cbd5a7-7ccd-4a3d-8521-6ae6c7212771';
      case Flavor.STAGING:
        return 'https://www.termsfeed.com/live/60cbd5a7-7ccd-4a3d-8521-6ae6c7212771';
      case Flavor.QA:
        return 'https://www.termsfeed.com/live/60cbd5a7-7ccd-4a3d-8521-6ae6c7212771';
      case Flavor.DEV:
        return 'https://www.termsfeed.com/live/60cbd5a7-7ccd-4a3d-8521-6ae6c7212771';
      default:
        return '';
    }
  }
}
