import 'package:movies/modules/movies/domain/entity/movie.dart';
import 'package:movies/modules/movies/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:movies/core/error/exceptions/failure.dart';


class GetPopularMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);

  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseMoviesRepository.getPopularMovies();
  }
}
