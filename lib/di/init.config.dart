// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:alice/alice.dart' as _i3;
import 'package:alice/core/alice_dio_interceptor.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../app/app_bloc/app_bloc.dart' as _i10;
import '../app/app_bloc/src/di/bloc_module.dart' as _i16;
import '../app/navigation/app_router.dart' as _i5;
import '../app/navigation/navigation_module.dart' as _i12;
import '../data/database/app_storage.dart' as _i6;
import '../data/database/di/storage_module.dart' as _i13;
import '../data/network/network.dart' as _i7;
import '../data/network/src/provider/di/networ_module.dart' as _i11;
import '../domain/repository/di/repository_module.dart' as _i14;
import '../domain/repository/repository.dart' as _i8;
import '../domain/usecase/di/usecase_module.dart' as _i15;
import '../domain/usecase/usecase.dart' as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkServiceModule = _$NetworkServiceModule();
    final navigationModule = _$NavigationModule();
    final appStorageModule = _$AppStorageModule();
    final repositoryModule = _$RepositoryModule();
    final usecaseModule = _$UsecaseModule();
    final appCubitModule = _$AppCubitModule();
    gh.lazySingleton<_i3.Alice>(() => networkServiceModule.provideAlice());
    gh.lazySingleton<_i4.AliceDioInterceptor>(
        () => networkServiceModule.provideInterceptor(gh<_i3.Alice>()));
    gh.lazySingleton<_i5.AppRouter>(() => navigationModule.provideAppRouter());
    gh.lazySingleton<_i6.AppStorage>(
        () => appStorageModule.provideAppStorage());
    gh.lazySingleton<_i7.Dio>(
        () => networkServiceModule.provideDio(gh<_i4.AliceDioInterceptor>()));
    gh.lazySingleton<_i7.AuthProvider>(
        () => networkServiceModule.provideAuthProvider(
              gh<_i7.Dio>(),
              gh<_i6.AppStorage>(),
            ));
    gh.lazySingleton<_i8.AuthRepository>(
        () => repositoryModule.provideAuthRepository(gh<_i7.AuthProvider>()));
    gh.lazySingleton<_i9.AuthUsecase>(
        () => usecaseModule.provideAuthUsecase(gh<_i8.AuthRepository>()));
    gh.factory<_i10.LoginCubit>(
        () => appCubitModule.provideLoginCubit(gh<_i7.AuthProvider>()));
    gh.factory<_i10.AuthCubit>(
        () => appCubitModule.provideAuthCubit(gh<_i9.AuthUsecase>()));
    return this;
  }
}

class _$NetworkServiceModule extends _i11.NetworkServiceModule {}

class _$NavigationModule extends _i12.NavigationModule {}

class _$AppStorageModule extends _i13.AppStorageModule {}

class _$RepositoryModule extends _i14.RepositoryModule {}

class _$UsecaseModule extends _i15.UsecaseModule {}

class _$AppCubitModule extends _i16.AppCubitModule {}
