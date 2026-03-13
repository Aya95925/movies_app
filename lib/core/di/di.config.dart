// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../feature/movies/data/mappers/movie_mapper.dart' as _i982;
import '../../feature/movies/data/repositories/home_repo/data_source/home_remote_data_source.dart'
    as _i707;
import '../../feature/movies/data/repositories/home_repo/data_source/home_remote_data_source_impl.dart'
    as _i782;
import '../../feature/movies/data/repositories/home_repo/home_repo_impl.dart'
    as _i56;
import '../../feature/movies/domain/repositories/home_repo.dart' as _i47;
import '../../feature/movies/domain/usecase/get_movies_use_case.dart' as _i526;
import '../../feature/movies/ui/screens/navigation/tabs/home/cubit/home_cubit.dart'
    as _i556;
import '../../feature/network/api_client/api_client.dart' as _i493;
import 'git_it_module.dart' as _i710;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final gitItModule = _$GitItModule();
    gh.factory<_i895.Connectivity>(() => gitItModule.createConnectivity());
    gh.factory<_i982.MovieMapper>(() => _i982.MovieMapper());
    gh.singleton<_i361.Dio>(() => gitItModule.createDio());
    gh.singleton<_i493.ApiClient>(() => _i493.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i707.HomeRemoteDataSource>(
      () => _i782.HomeRemoteDataSourceImpl(gh<_i493.ApiClient>()),
    );
    gh.factory<_i47.HomeRepo>(
      () => _i56.HomeRepoImpl(
        gh<_i707.HomeRemoteDataSource>(),
        gh<_i895.Connectivity>(),
        gh<_i982.MovieMapper>(),
      ),
    );
    gh.factory<_i526.GetMoviesUseCase>(
      () => _i526.GetMoviesUseCase(gh<_i47.HomeRepo>()),
    );
    gh.factory<_i556.HomeCubit>(
      () => _i556.HomeCubit(gh<_i526.GetMoviesUseCase>()),
    );
    return this;
  }
}

class _$GitItModule extends _i710.GitItModule {}
