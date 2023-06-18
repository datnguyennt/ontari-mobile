import 'firebase_options_dev.dart';
import 'flavors.dart';
import 'main_app.dart';

void main() {
  mainApp(Flavor.DEV, DefaultFirebaseOptionsDev.currentPlatform);
}
