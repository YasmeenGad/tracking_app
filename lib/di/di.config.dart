// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter/material.dart' as _i409;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/app_cubit/app_cubit.dart' as _i693;
import '../core/networking/api/api_manager.dart' as _i282;
import '../core/networking/common/regestet_context_module.dart' as _i125;
import '../core/networking/network_factory.dart' as _i377;
import '../features/auth/data/data_sources/contracts/apply_driver_online_data_source.dart'
    as _i832;
import '../features/auth/data/data_sources/impl/apply_driver_online_data_source_impl.dart'
    as _i603;
import '../features/auth/data/repositories/apply_driver_repo_impl.dart'
    as _i622;
import '../features/auth/domain/contracts/apply_driver_repo.dart' as _i804;
import '../features/auth/domain/use_cases/apply_driver_usecase.dart' as _i94;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkFactory = _$NetworkFactory();
    final registerModule = _$RegisterModule();
    gh.factory<_i693.AppCubit>(() => _i693.AppCubit());
    gh.factory<_i361.LogInterceptor>(
        () => networkFactory.providerInterceptor());
    gh.singleton<_i409.GlobalKey<_i409.NavigatorState>>(
        () => registerModule.navigatorKey);
    gh.lazySingleton<_i361.Dio>(() => networkFactory.provideDio());
    gh.singleton<_i282.ApiManager>(() => _i282.ApiManager(gh<_i361.Dio>()));
    gh.factory<_i832.ApplyDriverOnlineDataSource>(
        () => _i603.ApplyDriverOnlineDataSourceImpl(gh<_i282.ApiManager>()));
    gh.factory<_i804.ApplyDriverRepo>(() =>
        _i622.ApplyDriverRepoImpl(gh<_i832.ApplyDriverOnlineDataSource>()));
    gh.factory<_i94.ApplyDriverUseCase>(
        () => _i94.ApplyDriverUseCase(gh<_i804.ApplyDriverRepo>()));
    return this;
  }
}

class _$NetworkFactory extends _i377.NetworkFactory {}

class _$RegisterModule extends _i125.RegisterModule {}
