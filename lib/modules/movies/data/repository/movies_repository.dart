import 'package:dartz/dartz.dart';
import 'package:movies/core/error/exceptions/failure.dart';
import 'package:movies/core/error/exceptions/server_exception.dart';
import 'package:movies/modules/movies/data/data_source/remote/movie_remote_data_source.dart';
import 'package:movies/modules/movies/domain/entity/movie.dart';
import 'package:movies/modules/movies/domain/repository/base_movies_repository.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    var result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.model.message));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    var result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.model.message));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    var result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.model.message));
    }
  }
}
