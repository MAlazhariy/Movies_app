import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movies/core/constance/api_constance.dart';
import 'package:movies/core/error/exceptions/server_exception.dart';
import 'package:movies/core/network/server_error_model.dart';
import 'package:movies/modules/movies/data/models/movie_model.dart';


abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  // todo: try exception

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response =
        await Dio().get(ApiConstants.nowPlayingMoviesPath).catchError((error) {
      log('⚠ error when getNowPlayingMovies: ${error.toString()}');
    });

    if (response.statusCode == 200) {
      return List<MovieModel>.of(
        (response.data['results'] as List).map((e) {
          return MovieModel.fromJson(e);
        }),
      );
    }

    throw ServerException(model: ServerErrorModel.fromJson(response.data));
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response =
        await Dio().get(ApiConstants.popularMoviesPath).catchError((error) {
      log('⚠ error when getPopularMovies: ${error.toString()}');
    });

    if (response.statusCode == 200) {
      return List<MovieModel>.of(
        (response.data['results'] as List).map((e) {
          return MovieModel.fromJson(e);
        }),
      );
    }

    throw ServerException(model: ServerErrorModel.fromJson(response.data));
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response =
    await Dio().get(ApiConstants.topRatedMoviesPath).catchError((error) {
      log('⚠ error when getTopRatedMovies: ${error.toString()}');
    });

    if (response.statusCode == 200) {
      return List<MovieModel>.of(
        (response.data['results'] as List).map((e) {
          return MovieModel.fromJson(e);
        }),
      );
    }

    throw ServerException(model: ServerErrorModel.fromJson(response.data));
  }
}
