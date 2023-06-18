import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../core/network/dio.helper.dart';
import '../../../core/network/failure.dart';
import '../../models/user.model.dart';
import '../dto/user_credential.dto.dart';
import '../provider/user.provider.dart';

@Singleton()
class UserRepository implements IUserProvider {
  UserRepository(this._userProvider);
  final UserProvider _userProvider;

  @override
  Future<void> logout() {
    return _userProvider.logout();
  }

  @override
  Future<Either<Failure, UserModel>> signInWithEmail(UserCreadentialDto userDto) {
    return _userProvider.signInWithEmail(userDto);
  }

  @override
  Future<Either<Failure, UserModel>> signUpWithEmail({
    required String email,
    required String password,
  }) {
    return _userProvider.signUpWithEmail(email: email, password: password);
  }

  @override
  Future<Either<DioException, HttpResponse>> signInCredential(
    UserCreadentialDto userDto,
  ) {
    return _userProvider.signInCredential(userDto);
  }

  @override
  Future<Either<Failure, UserModel>> signInWithPhoneNumber(String phoneNumber) {
    return _userProvider.signInWithPhoneNumber(phoneNumber);
  }
}
