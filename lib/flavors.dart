import 'package:firebase_core/firebase_core.dart';
import 'firebase_options_dev.dart';
import 'firebase_options_prod.dart';

enum Flavor {
  DEV,
  PROD,
}

class AppFlavor {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.DEV:
        return '[DEV] Ontari';
      case Flavor.PROD:
        return 'Ontari';
      default:
        return 'Ontari';
    }
  }

  static String get apiBaseUrl {
    switch (appFlavor) {
      case Flavor.PROD:
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
      case Flavor.DEV:
        return 'https://www.termsfeed.com/live/60cbd5a7-7ccd-4a3d-8521-6ae6c7212771';
      default:
        return '';
    }
  }

  static FirebaseOptions get firebaseConfig {
    switch (appFlavor) {
      case Flavor.PROD:
        return DefaultFirebaseOptionsProd.currentPlatform;
      case Flavor.DEV:
        return DefaultFirebaseOptionsDev.currentPlatform;
      default:
        return DefaultFirebaseOptionsDev.currentPlatform;
    }
  }
}
