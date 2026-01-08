// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:diagnosis_project/Core/DI/register_module.dart' as _i143;
import 'package:diagnosis_project/Feature/Auth/Data/data_source/api_auth_data_source.dart'
    as _i221;
import 'package:diagnosis_project/Feature/Auth/Data/data_source/auth_data_source.dart'
    as _i711;
import 'package:diagnosis_project/Feature/Auth/Data/data_source/Remote/auth_api_remote_data_source.dart'
    as _i257;
import 'package:diagnosis_project/Feature/Auth/Data/data_source/Remote/auth_remote_data_sourse.dart'
    as _i901;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.getShardPref(),
      preResolve: true,
    );
    gh.singleton<_i361.Dio>(() => registerModule.dio);
    gh.singleton<_i901.AuthRemoteDataSource>(
        () => _i257.AuthApiRemoteDataSource(gh<_i361.Dio>()));
    gh.lazySingleton<_i711.AuthDataSource>(() => _i221.ApiAuthDataSource());
    return this;
  }
}

class _$RegisterModule extends _i143.RegisterModule {}
