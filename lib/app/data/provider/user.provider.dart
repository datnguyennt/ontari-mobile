import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:ontari_mobile/app/util/auth_exception.dart';
import 'package:ontari_mobile/app/util/network/dio_client.dart';
import 'package:ontari_mobile/app/util/network/failure.dart';

abstract class IUserProvider {
  Future<void> logout();

  Future<Either<DioError, HttpResponse>> signInCredential({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> signInWithEmail({
    required String email,
    required String password,
  });
  Future<Either<Failure, User>> signUpWithEmail({
    required String email,
    required String password,
  });
}

@singleton
class UserProvider implements IUserProvider {
  UserProvider({required this.dioClient});

  final DioClient dioClient;
  @override
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<Either<Failure, User>> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
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
      return Right(credential.user!);
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
  Future<Either<Failure, User>> signUpWithEmail({
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
      return Right(credential.user!);
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
  Future<Either<DioError, HttpResponse>> signInCredential({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dioClient.post(
        'https://dummyjson.com/auth/login',
        data: {
          'username': 'kminchelle',
          'password': '0lelplR',
        },
      );
      return Right(response);
    } on DioError catch (e) {
      return Left(e);
    }
  }
}
