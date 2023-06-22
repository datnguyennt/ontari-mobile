import 'package:injectable/injectable.dart';
import '../../models/user.model.dart';
import '../dto/user_credential.dto.dart';
import '../provider/user.provider.dart';

abstract class UserRepository {
  Future<void> logout();

  Future<UserModel> signInCredential(
    UserCreadentialDto userDto,
  );

  Future<UserModel> signInWithPhoneNumber(String phoneNumber);
  Future<UserModel> signInWithEmail(UserCreadentialDto userDto);
  Future<UserModel> signUpWithEmail({
    required String email,
    required String password,
  });
}

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this.userProvider);
  final UserProviderImpl userProvider;

  @override
  Future<void> logout() {
    return userProvider.logout();
  }

  @override
  Future<UserModel> signInWithEmail(UserCreadentialDto userDto) async {
    final response = await userProvider.signInWithEmail(userDto);
    final UserModel user = UserModel.toUserModel(response);
    await userProvider.updateUserDataFirebase(user);
    return user;
  }

  @override
  Future<UserModel> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    final response = await userProvider.signUpWithEmail(
      email: email,
      password: password,
    );
    final UserModel user = UserModel.toUserModel(response);
    await userProvider.updateUserDataFirebase(user);
    return user;
  }

  @override
  Future<UserModel> signInCredential(
    UserCreadentialDto userDto,
  ) async {
    final response = await userProvider.signInCredential(userDto);
    final user = UserModel.fromJson(response.body['user']);
    return user;
  }

  @override
  Future<UserModel> signInWithPhoneNumber(String phoneNumber) {
    throw UnimplementedError();
  }
}
