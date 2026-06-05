// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:e_commerce/core/di/register_module.dart' as _i257;
import 'package:e_commerce/features/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i371;
import 'package:e_commerce/features/auth/data/data_sources/local/auth_shared_pref_local_data_source.dart'
    as _i365;
import 'package:e_commerce/features/auth/data/data_sources/remote/auth_api_remote_data_source.dart'
    as _i195;
import 'package:e_commerce/features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i881;
import 'package:e_commerce/features/auth/data/repositories/auth_repository_impl.dart'
    as _i22;
import 'package:e_commerce/features/auth/domain/repositories/auh_repository.dart'
    as _i542;
import 'package:e_commerce/features/auth/domain/use_cases/login.dart' as _i115;
import 'package:e_commerce/features/auth/domain/use_cases/register.dart'
    as _i906;
import 'package:e_commerce/features/auth/domain/use_cases/resend_otp.dart'
    as _i209;
import 'package:e_commerce/features/auth/domain/use_cases/verify_email.dart'
    as _i853;
import 'package:e_commerce/features/auth/presentation/cubit/auth_cubit.dart'
    as _i172;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.sharedPref,
      preResolve: true,
    );
    gh.singleton<_i361.Dio>(() => registerModule.dio);
    gh.singleton<_i881.AuthRemoteDataSource>(
      () => _i195.AuthApiRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.singleton<_i371.AuthLocalDataSource>(
      () => _i365.AuthSharedPrefLocalDataSource(gh<_i460.SharedPreferences>()),
    );
    gh.singleton<_i542.AuthRepository>(
      () => _i22.AuthRepositoryImpl(
        gh<_i881.AuthRemoteDataSource>(),
        gh<_i371.AuthLocalDataSource>(),
      ),
    );
    gh.singleton<_i115.Login>(() => _i115.Login(gh<_i542.AuthRepository>()));
    gh.singleton<_i906.Register>(
      () => _i906.Register(gh<_i542.AuthRepository>()),
    );
    gh.singleton<_i209.ResendOtp>(
      () => _i209.ResendOtp(gh<_i542.AuthRepository>()),
    );
    gh.singleton<_i853.VerifyEmail>(
      () => _i853.VerifyEmail(gh<_i542.AuthRepository>()),
    );
    gh.singleton<_i172.AuthCubit>(
      () => _i172.AuthCubit(
        gh<_i906.Register>(),
        gh<_i115.Login>(),
        gh<_i853.VerifyEmail>(),
        gh<_i209.ResendOtp>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i257.RegisterModule {}
