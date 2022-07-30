import 'package:dartz/dartz.dart';
import 'package:movies/core/error/exceptions/failure.dart';
import 'package:movies/modules/movies/domain/entity/movie.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
}
