import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:ontari_mobile/app/data/provider/user.provider.dart';
import 'package:ontari_mobile/app/util/network/failure.dart';

@injectable
class UserRepository implements IUserProvider {
  UserRepository(this._userProvider);
  final UserProvider _userProvider;

  @override
  Future<void> logout() {
    return _userProvider.logout();
  }

  @override
  Future<Either<Failure, User>> signInWithEmail(
      {required String email, required String password,}) {
    return _userProvider.signInWithEmail(email: email, password: password);
  }

  @override
  Future<Either<Failure, User>> signUpWithEmail(
      {required String email, required String password,}) {
    return _userProvider.signUpWithEmail(email: email, password: password);
  }
}
