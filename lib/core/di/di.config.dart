// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:flutter_application_new/core/api_client/api_client.dart'
    as _i992;
import 'package:flutter_application_new/core/di/di_module.dart' as _i8;
import 'package:flutter_application_new/feature/auth/data/datasource/auth_remote_data_source.dart'
    as _i869;
import 'package:flutter_application_new/feature/auth/data/datasource/auth_remote_data_source_impl.dart'
    as _i1027;
import 'package:flutter_application_new/feature/auth/data/repository/auth_repo_impl.dart'
    as _i182;
import 'package:flutter_application_new/feature/auth/domain/repository/auth_repo.dart'
    as _i297;
import 'package:flutter_application_new/feature/auth/domain/usecases/check_auth_status_usecase.dart'
    as _i946;
import 'package:flutter_application_new/feature/auth/domain/usecases/forgot_password_usecase.dart'
    as _i186;
import 'package:flutter_application_new/feature/auth/domain/usecases/login_usecase.dart'
    as _i334;
import 'package:flutter_application_new/feature/auth/domain/usecases/register_usecase.dart'
    as _i518;
import 'package:flutter_application_new/feature/auth/domain/usecases/sign_in_with_google_usecase.dart'
    as _i10;
import 'package:flutter_application_new/feature/auth/domain/usecases/sign_out_usecase.dart'
    as _i201;
import 'package:flutter_application_new/feature/auth/presentation/screens/forget_password/cubit/forgot_password_cubit.dart'
    as _i426;
import 'package:flutter_application_new/feature/auth/presentation/screens/login/cubit/login_cubit.dart'
    as _i7;
import 'package:flutter_application_new/feature/auth/presentation/screens/register/cubit/register_cubit.dart'
    as _i690;
import 'package:flutter_application_new/feature/movies/data/datasource/movies_remote_datasource.dart'
    as _i604;
import 'package:flutter_application_new/feature/movies/data/datasource/movies_remote_datasource_impl.dart'
    as _i331;
import 'package:flutter_application_new/feature/movies/data/mappers/movie_mapper.dart'
    as _i757;
import 'package:flutter_application_new/feature/movies/data/repository/movies_repo_impl.dart'
    as _i795;
import 'package:flutter_application_new/feature/movies/domain/repository/movies_repo.dart'
    as _i900;
import 'package:flutter_application_new/feature/movies/domain/usecase/get_movie_details_usecase.dart'
    as _i524;
import 'package:flutter_application_new/feature/movies/domain/usecase/get_movies_from_firestore_usecase.dart'
    as _i256;
import 'package:flutter_application_new/feature/movies/domain/usecase/get_movies_usecase.dart'
    as _i677;
import 'package:flutter_application_new/feature/movies/domain/usecase/get_user_profile_stats_usecase.dart'
    as _i663;
import 'package:flutter_application_new/feature/movies/domain/usecase/save_movie_to_firestore_usecase.dart'
    as _i830;
import 'package:flutter_application_new/feature/movies/domain/usecase/watch_list_us.dart'
    as _i365;
import 'package:flutter_application_new/feature/movies/ui/presentation/screens/browse/cubit/browse_cubit.dart'
    as _i1030;
import 'package:flutter_application_new/feature/movies/ui/presentation/screens/details/cubit/movie_detail_cubit.dart'
    as _i645;
import 'package:flutter_application_new/feature/movies/ui/presentation/screens/home/cubit/home_cubit.dart'
    as _i631;
import 'package:flutter_application_new/feature/movies/ui/presentation/screens/profaile/cubit/profile_cubit.dart'
    as _i364;
import 'package:flutter_application_new/feature/movies/ui/presentation/screens/search/cubit/search_cubit.dart'
    as _i926;
import 'package:flutter_application_new/feature/splash/presentation/cubit/splash_cubit.dart'
    as _i612;
import 'package:flutter_application_new/feature/watchlist/data/repository/watchlist_repo_impl.dart'
    as _i718;
import 'package:flutter_application_new/feature/watchlist/presentation/cubit/watchlist_cubit.dart'
    as _i1015;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final diModule = _$DiModule();
    gh.factory<_i757.MovieMapper>(() => _i757.MovieMapper());
    gh.factory<_i718.WatchlistRepo>(() => _i718.WatchlistRepo());
    gh.lazySingleton<_i59.FirebaseAuth>(() => diModule.firebaseAuth);
    gh.lazySingleton<_i974.FirebaseFirestore>(() => diModule.firestore);
    gh.lazySingleton<_i116.GoogleSignIn>(() => diModule.googleSignIn);
    gh.lazySingleton<_i361.Dio>(() => diModule.createDio());
    gh.lazySingleton<_i895.Connectivity>(() => diModule.createConnectivity());
    gh.lazySingleton<_i992.ApiClient>(() => _i992.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i1015.WatchlistCubit>(
      () => _i1015.WatchlistCubit(gh<_i718.WatchlistRepo>()),
    );
    gh.factory<_i604.MoviesRemoteDataSource>(
      () => _i331.MoviesRemoteDataSourceImpl(
        gh<_i992.ApiClient>(),
        gh<_i974.FirebaseFirestore>(),
        gh<_i59.FirebaseAuth>(),
      ),
    );
    gh.factory<_i900.MoviesRepo>(
      () => _i795.MoviesRepoImpl(
        gh<_i604.MoviesRemoteDataSource>(),
        gh<_i757.MovieMapper>(),
        gh<_i895.Connectivity>(),
      ),
    );
    gh.factory<_i869.AuthRemoteDataSource>(
      () => _i1027.AuthRemoteDataSourceImpl(
        gh<_i59.FirebaseAuth>(),
        gh<_i116.GoogleSignIn>(),
      ),
    );
    gh.factory<_i297.AuthRepo>(
      () => _i182.AuthRepoImpl(
        gh<_i869.AuthRemoteDataSource>(),
        gh<_i895.Connectivity>(),
      ),
    );
    gh.factory<_i946.CheckAuthStatusUseCase>(
      () => _i946.CheckAuthStatusUseCase(gh<_i297.AuthRepo>()),
    );
    gh.factory<_i186.ForgotPasswordUseCase>(
      () => _i186.ForgotPasswordUseCase(gh<_i297.AuthRepo>()),
    );
    gh.factory<_i334.LoginUseCase>(
      () => _i334.LoginUseCase(gh<_i297.AuthRepo>()),
    );
    gh.factory<_i518.RegisterUseCase>(
      () => _i518.RegisterUseCase(gh<_i297.AuthRepo>()),
    );
    gh.factory<_i10.SignInWithGoogleUseCase>(
      () => _i10.SignInWithGoogleUseCase(gh<_i297.AuthRepo>()),
    );
    gh.factory<_i201.SignOutUseCase>(
      () => _i201.SignOutUseCase(gh<_i297.AuthRepo>()),
    );
    gh.factory<_i524.GetMovieDetailsUseCase>(
      () => _i524.GetMovieDetailsUseCase(gh<_i900.MoviesRepo>()),
    );
    gh.factory<_i256.GetMoviesFromFirestoreUseCase>(
      () => _i256.GetMoviesFromFirestoreUseCase(gh<_i900.MoviesRepo>()),
    );
    gh.factory<_i677.GetMoviesUseCase>(
      () => _i677.GetMoviesUseCase(gh<_i900.MoviesRepo>()),
    );
    gh.factory<_i663.GetUserProfileStatsUseCase>(
      () => _i663.GetUserProfileStatsUseCase(gh<_i900.MoviesRepo>()),
    );
    gh.factory<_i830.SaveMovieToFirestoreUseCase>(
      () => _i830.SaveMovieToFirestoreUseCase(gh<_i900.MoviesRepo>()),
    );
    gh.factory<_i426.ForgotPasswordCubit>(
      () => _i426.ForgotPasswordCubit(gh<_i186.ForgotPasswordUseCase>()),
    );
    gh.factory<_i645.DetailsCubit>(
      () => _i645.DetailsCubit(
        gh<_i524.GetMovieDetailsUseCase>(),
        gh<_i677.GetMoviesUseCase>(),
        gh<_i830.SaveMovieToFirestoreUseCase>(),
      ),
    );
    gh.factory<_i690.RegisterCubit>(
      () => _i690.RegisterCubit(gh<_i518.RegisterUseCase>()),
    );
    gh.factory<_i7.LoginCubit>(
      () => _i7.LoginCubit(
        gh<_i334.LoginUseCase>(),
        gh<_i10.SignInWithGoogleUseCase>(),
      ),
    );
    gh.factory<_i365.AddToWatchlistUseCase>(
      () =>
          _i365.AddToWatchlistUseCase(gh<_i830.SaveMovieToFirestoreUseCase>()),
    );
    gh.factory<_i365.AddToHistoryUseCase>(
      () => _i365.AddToHistoryUseCase(gh<_i830.SaveMovieToFirestoreUseCase>()),
    );
    gh.factory<_i1030.BrowseCubit>(
      () => _i1030.BrowseCubit(gh<_i677.GetMoviesUseCase>()),
    );
    gh.factory<_i631.HomeCubit>(
      () => _i631.HomeCubit(gh<_i677.GetMoviesUseCase>()),
    );
    gh.factory<_i926.SearchCubit>(
      () => _i926.SearchCubit(gh<_i677.GetMoviesUseCase>()),
    );
    gh.factory<_i612.SplashCubit>(
      () => _i612.SplashCubit(gh<_i946.CheckAuthStatusUseCase>()),
    );
    gh.factory<_i364.ProfileCubit>(
      () => _i364.ProfileCubit(
        gh<_i201.SignOutUseCase>(),
        gh<_i663.GetUserProfileStatsUseCase>(),
        gh<_i256.GetMoviesFromFirestoreUseCase>(),
        gh<_i59.FirebaseAuth>(),
      ),
    );
    return this;
  }
}

class _$DiModule extends _i8.DiModule {}
