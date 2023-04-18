// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes, cascade_invocations, comment_references
import 'dart:io' as _i4;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'package:ontari_mobile/app/data/provider/user.provider.dart' as _i5;
import 'package:ontari_mobile/app/data/repository/user.repository.dart' as _i6;
import 'package:ontari_mobile/app/util/network/logger.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.ConsoleLogger>(() => _i3.ConsoleLogger());
  gh.factory<_i3.FileLogger>(() => _i3.FileLogger(get<_i4.File>()));
  gh.factory<_i5.UserProvider>(() => _i5.UserProvider());
  gh.factory<_i6.UserRepository>(
      () => _i6.UserRepository(get<_i5.UserProvider>()),);
  return get;
}
