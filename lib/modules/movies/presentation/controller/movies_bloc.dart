
import 'package:bloc/bloc.dart';
import 'package:movies/modules/movies/data/data_source/remote/movie_remote_data_source.dart';
import 'package:movies/modules/movies/data/repository/movies_repository.dart';
import 'package:movies/modules/movies/domain/use_cases/get_now_playing_usecase.dart';
import 'package:movies/modules/movies/presentation/controller/movies_events.dart';
import 'package:movies/modules/movies/presentation/controller/movies_states.dart';

import '../../domain/repository/base_movies_repository.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesStates>{

  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase) : super(MoviesInitState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      BaseMovieRemoteDataSource baseMovieRemoteDataSource = MovieRemoteDataSource();
      BaseMoviesRepository baseMoviesRepository = MoviesRepository(baseMovieRemoteDataSource);
      final result = await GetNowPlayingMoviesUseCase(baseMoviesRepository).execute();
      print(result);
    });
  }

}