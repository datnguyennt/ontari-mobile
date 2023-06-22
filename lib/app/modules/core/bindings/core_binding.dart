import 'package:get/get.dart';

import '../../../services/auth.service.dart';

class CoreBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.put(AuthService()),
    ];
  }
}
