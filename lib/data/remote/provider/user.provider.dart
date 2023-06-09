import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import '../../../core/common/exception/auth_exception.dart';
import '../../../core/constant/firebase_constants.dart';
import '../../../core/network/dio.helper.dart';
import '../../../core/network/failure.dart';
import '../../database/firebase_database.dart';
import '../../models/user.model.dart';
import '../dto/user_credential.dto.dart';

abstract class IUserProvider {
  Future<void> logout();

  Future<Either<DioException, HttpResponse>> signInCredential(
    UserCreadentialDto userDto,
  );

  Future<Either<Failure, UserModel>> signInWithPhoneNumber(String phoneNumber);
  Future<Either<Failure, UserModel>> signInWithEmail(
      UserCreadentialDto userDto,);
  Future<Either<Failure, UserModel>> signUpWithEmail({
    required String email,
    required String password,
  });
}

@LazySingleton()
class UserProvider implements IUserProvider {
  FirebaseDataBase firebaseDataBase;
  UserProvider({required this.dioClient, required this.firebaseDataBase});

  final DioHelper dioClient;
  @override
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<Either<Failure, UserModel>> signInWithEmail(
    UserCreadentialDto userDto,
  ) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userDto.email,
        password: userDto.password,
      );
      if (credential.user == null) {
        return Left(
          Exception(
            AuthExceptionHandler.generateExceptionMessage(
              AuthResultStatus.userNotFound,
            ),
          ),
        );
      }
      final UserModel user = UserModel.toUserModel(credential.user!);
      await firebaseDataBase.setDocument(
        collectionName: FirebaseCollection.users,
        data: user.toJson(),
        id: user.userId,
      );
      return Right(user);
    } on FirebaseAuthException catch (e) {
      final status = AuthExceptionHandler.handleException(e);
      return Left(
        Exception(AuthExceptionHandler.generateExceptionMessage(status)),
      );
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signUpWithEmail({
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
        return Left(
          Exception(
            AuthExceptionHandler.generateExceptionMessage(
              AuthResultStatus.userNotFound,
            ),
          ),
        );
      }

      final UserModel user = UserModel.toUserModel(credential.user!);
      await firebaseDataBase.setDocument(
        collectionName: FirebaseCollection.users,
        data: user.toJson(),
        id: user.userId,
      );
      return Right(user);
    } on FirebaseAuthException catch (e) {
      final status = AuthExceptionHandler.handleException(e);
      return Left(
        Exception(AuthExceptionHandler.generateExceptionMessage(status)),
      );
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<DioException, HttpResponse>> signInCredential(
    UserCreadentialDto userDto,
  ) async {
    try {
      final response = await dioClient.post(
        'https://dummyjson.com/auth/login',
        data: {
          'username': 'kminchelle',
          'password': '0lelplR',
        },
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, UserModel>> signInWithPhoneNumber(String phoneNumber) {
    // TODO: implement signInWithPhoneNumber
    throw UnimplementedError();
  }
}
