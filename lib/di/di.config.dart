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
import 'package:ontari_mobile/core/network/dio.helper.dart' as _i7;
import 'package:ontari_mobile/core/routes/router.dart' as _i4;
import 'package:ontari_mobile/core/service/navigation_service.dart' as _i9;
import 'package:ontari_mobile/data/database/firebase_database.dart' as _i8;
import 'package:ontari_mobile/data/remote/provider/user.provider.dart' as _i10;
import 'package:ontari_mobile/data/remote/repository/user.repository.dart'
    as _i11;
import 'package:ontari_mobile/modules/auth/bloc/auth_bloc/auth_bloc.dart'
    as _i5;
import 'package:ontari_mobile/modules/auth/bloc/login_bloc/login_bloc.dart'
    as _i12;
import 'package:ontari_mobile/modules/core/blocs/app_bloc/app_bloc.dart' as _i3;
import 'package:ontari_mobile/modules/core/blocs/dashboard_bloc/dashboard_bloc.dart'
    as _i6;

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
  gh.singleton<_i3.AppBloc>(_i3.AppBloc());
  gh.lazySingleton<_i4.AppRouter>(() => _i4.AppRouter());
  gh.singleton<_i5.AuthBloc>(_i5.AuthBloc());
  gh.factory<_i6.DashBoardBloc>(() => _i6.DashBoardBloc());
  gh.lazySingleton<_i7.DioHelper>(() => _i7.DioHelper());
  gh.singleton<_i8.FirebaseDataBase>(_i8.FirebaseDataBase());
  gh.lazySingleton<_i9.NavigationService>(
      () => _i9.NavigationService(gh<_i4.AppRouter>()));
  gh.lazySingleton<_i10.UserProvider>(() => _i10.UserProvider(
        dioClient: gh<_i7.DioHelper>(),
        firebaseDataBase: gh<_i8.FirebaseDataBase>(),
      ));
  gh.singleton<_i11.UserRepository>(
      _i11.UserRepository(gh<_i10.UserProvider>()));
  gh.factory<_i12.LoginBloc>(
      () => _i12.LoginBloc(userRepository: gh<_i11.UserRepository>()));
  return getIt;
}
