import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import '../../../core/base/base_remote_source.dart';
import '../../../core/constant/firebase_constants.dart';
import '../../../core/network/dio.helper.dart';
import '../../models/user.model.dart';
import '../dto/user_credential.dto.dart';

abstract class UserProvider {
  Future<void> logout();

  Future<HttpResponse> signInCredential(
    UserCreadentialDto userDto,
  );

  Future<User> signInWithPhoneNumber(String phoneNumber);
  Future<User> signInWithEmail(
    UserCreadentialDto userDto,
  );
  Future<User> signUpWithEmail({
    required String email,
    required String password,
  });

  Future<void> updateUserDataFirebase(UserModel user);
}

@LazySingleton()
class UserProviderImpl extends BaseRemoteSource implements UserProvider {
  UserProviderImpl();

  @override
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<User> signInWithEmail(
    UserCreadentialDto userDto,
  ) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userDto.email,
        password: userDto.password,
      );
      if (credential.user == null) {
        throw Exception('a');
      }
      return credential.user!;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user == null) {
        throw Exception('a');
      }
      return credential.user!;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<HttpResponse> signInCredential(
    UserCreadentialDto userDto,
  ) async {
    try {
      final response = await dioHelper.post(
        'https://dummyjson.com/auth/login',
        data: {
          'username': 'kminchelle',
          'password': '0lelplR',
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User> signInWithPhoneNumber(String phoneNumber) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateUserDataFirebase(UserModel user) async {
    try {
      await firebaseDataBase.setDocument(
        collectionName: FirebaseCollection.users,
        data: user.toJson(),
        id: user.userId,
      );
    } catch (e) {
      rethrow;
    }
  }
}
