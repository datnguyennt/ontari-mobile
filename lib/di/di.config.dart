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
import 'package:ontari_mobile/core/network/dio.helper.dart' as _i6;
import 'package:ontari_mobile/core/routes/router.dart' as _i3;
import 'package:ontari_mobile/core/service/navigation_service.dart' as _i8;
import 'package:ontari_mobile/data/database/firebase_database.dart' as _i7;
import 'package:ontari_mobile/data/remote/provider/user.provider.dart' as _i10;
import 'package:ontari_mobile/data/remote/repository/user.repository.dart'
    as _i11;
import 'package:ontari_mobile/modules/auth/bloc/auth_bloc/auth_bloc.dart'
    as _i4;
import 'package:ontari_mobile/modules/auth/bloc/login_bloc/login_bloc.dart'
    as _i12;
import 'package:ontari_mobile/modules/core/blocs/dashboard_bloc/dashboard_bloc.dart'
    as _i5;
import 'package:ontari_mobile/modules/core/blocs/theme_bloc/theme_bloc.dart'
    as _i9;

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
  gh.factory<_i5.DashBoardBloc>(() => _i5.DashBoardBloc());
  gh.lazySingleton<_i6.DioHelper>(() => _i6.DioHelper());
  gh.singleton<_i7.FirebaseDataBase>(_i7.FirebaseDataBase());
  gh.lazySingleton<_i8.NavigationService>(
      () => _i8.NavigationService(gh<_i3.AppRouter>()));
  gh.singleton<_i9.ThemeBloc>(_i9.ThemeBloc());
  gh.lazySingleton<_i10.UserProvider>(() => _i10.UserProvider(
        dioClient: gh<_i6.DioHelper>(),
        firebaseDataBase: gh<_i7.FirebaseDataBase>(),
      ));
  gh.singleton<_i11.UserRepository>(
      _i11.UserRepository(gh<_i10.UserProvider>()));
  gh.factory<_i12.LoginBloc>(
      () => _i12.LoginBloc(userRepository: gh<_i11.UserRepository>()));
  return getIt;
}
