import 'package:get_it/get_it.dart';
import 'package:movies/modules/movies/data/data_source/remote/movie_remote_data_source.dart';
import 'package:movies/modules/movies/data/models/movie_model.dart';
import 'package:movies/modules/movies/data/repository/movies_repository.dart';
import 'package:movies/modules/movies/domain/repository/base_movies_repository.dart';
import 'package:movies/modules/movies/domain/use_cases/get_now_playing_usecase.dart';
import 'package:movies/modules/movies/presentation/controller/movies_bloc.dart';

class ServicesLocator {
  static final getIt = GetIt.instance;

  static void init() {
    /// Bloc
    getIt.registerFactory(() => MoviesBloc(getIt()));

    /// DATA SOURCE
    getIt.registerLazySingleton<BaseMovieRemoteDataSource>(
      () => MovieRemoteDataSource(),
    );

    /// USE CASES
    getIt.registerLazySingleton<GetNowPlayingMoviesUseCase>(
          () => GetNowPlayingMoviesUseCase(getIt()),
    );

    /// REPOSITORY
    getIt.registerLazySingleton<BaseMoviesRepository>(
          () => MoviesRepository(getIt()),
    );

  }
}
