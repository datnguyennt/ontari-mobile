// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i6;

import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/provider/user.provider.dart' as _i7;
import '../data/repository/user.repository.dart' as _i8;
import '../util/network/dio_client.dart' as _i4;
import '../util/network/logger.dart' as _i3;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.ConsoleLogger>(() => _i3.ConsoleLogger());
  gh.singleton<_i4.DioClient>(_i4.DioClient(gh<_i5.Dio>()));
  gh.factory<_i3.FileLogger>(() => _i3.FileLogger(gh<_i6.File>()));
  gh.singleton<_i7.UserProvider>(
      _i7.UserProvider(dioClient: gh<_i4.DioClient>()));
  gh.singleton<_i8.UserRepository>(_i8.UserRepository(gh<_i7.UserProvider>()));
  return getIt;
}
