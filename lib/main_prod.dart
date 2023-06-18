import 'firebase_options_prod.dart';
import 'flavors.dart';
import 'main_app.dart';

void main() {
  mainApp(Flavor.PROD, DefaultFirebaseOptionsProd.currentPlatform);
}
