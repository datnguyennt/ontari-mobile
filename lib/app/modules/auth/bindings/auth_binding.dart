import 'package:get/get.dart';

import '../../../../di/di.dart';
import '../../../data/remote/repository/user.repository.dart';
import '../controllers/login.controller.dart';

class AuthBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(
        () => LoginControler(userRepository: getIt<UserRepository>()),
      ),
    ];
  }
}
