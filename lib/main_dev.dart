import 'package:ontari_mobile/firebase_options_dev.dart';
import 'package:ontari_mobile/flavors.dart';
import 'package:ontari_mobile/main_app.dart';

void main() {
  mainApp(Flavor.DEV, DefaultFirebaseOptionsDev.currentPlatform);
}