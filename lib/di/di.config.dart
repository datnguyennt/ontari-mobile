// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:ontari_mobile/core/network/dio.helper.dart' as _i5;
import 'package:ontari_mobile/core/routes/router.dart' as _i3;
import 'package:ontari_mobile/core/service/navigation_service.dart' as _i6;
import 'package:ontari_mobile/data/remote/provider/user.provider.dart' as _i8;
import 'package:ontari_mobile/data/remote/repository/user.repository.dart'
    as _i9;
import 'package:ontari_mobile/modules/auth/bloc/auth_bloc/auth_bloc.dart'
    as _i4;
import 'package:ontari_mobile/modules/auth/bloc/login_bloc/login_bloc.dart'
    as _i10;
import 'package:ontari_mobile/modules/core/blocs/bloc/theme_bloc.dart' as _i7;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.AppRouter>(() => _i3.AppRouter());
  gh.singleton<_i4.AuthBloc>(_i4.AuthBloc());
  gh.lazySingleton<_i5.DioHelper>(() => _i5.DioHelper());
  gh.lazySingleton<_i6.NavigationService>(
      () => _i6.NavigationService(gh<_i3.AppRouter>()));
  gh.singleton<_i7.ThemeBloc>(_i7.ThemeBloc());
  gh.lazySingleton<_i8.UserProvider>(
      () => _i8.UserProvider(dioClient: gh<_i5.DioHelper>()));
  gh.singleton<_i9.UserRepository>(_i9.UserRepository(gh<_i8.UserProvider>()));
  gh.factory<_i10.LoginBloc>(
      () => _i10.LoginBloc(userRepository: gh<_i9.UserRepository>()));
  return getIt;
}
