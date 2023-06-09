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
import 'package:ontari_mobile/core/network/dio.helper.dart' as _i4;
import 'package:ontari_mobile/core/routes/router.dart' as _i3;
import 'package:ontari_mobile/core/service/navigation_service.dart' as _i5;
import 'package:ontari_mobile/data/remote/provider/user.provider.dart' as _i7;
import 'package:ontari_mobile/data/remote/repository/user.repository.dart'
    as _i8;
import 'package:ontari_mobile/modules/core/blocs/bloc/theme_bloc.dart' as _i6;

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
  gh.lazySingleton<_i4.DioHelper>(() => _i4.DioHelper());
  gh.lazySingleton<_i5.NavigationService>(
      () => _i5.NavigationService(gh<_i3.AppRouter>()));
  gh.singleton<_i6.ThemeBloc>(_i6.ThemeBloc());
  gh.lazySingleton<_i7.UserProvider>(
      () => _i7.UserProvider(dioClient: gh<_i4.DioHelper>()));
  gh.singleton<_i8.UserRepository>(_i8.UserRepository(gh<_i7.UserProvider>()));
  return getIt;
}
