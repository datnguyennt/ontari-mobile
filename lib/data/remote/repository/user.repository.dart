import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:ontari_mobile/core/network/dio.helper.dart';
import 'package:ontari_mobile/core/network/failure.dart';
import 'package:ontari_mobile/data/remote/provider/user.provider.dart';

@Singleton()
class UserRepository implements IUserProvider {
  UserRepository(this._userProvider);
  final UserProvider _userProvider;

  @override
  Future<void> logout() {
    return _userProvider.logout();
  }

  @override
  Future<Either<Failure, User>> signInWithEmail({
    required String email,
    required String password,
  }) {
    return _userProvider.signInWithEmail(email: email, password: password);
  }

  @override
  Future<Either<Failure, User>> signUpWithEmail({
    required String email,
    required String password,
  }) {
    return _userProvider.signUpWithEmail(email: email, password: password);
  }

  @override
  Future<Either<DioException, HttpResponse>> signInCredential({
    required String email,
    required String password,
  }) {
    return _userProvider.signInCredential(email: email, password: password);
  }
}
