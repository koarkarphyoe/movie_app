// ignore: implementation_imports
import 'package:dio/src/dio.dart';
import 'package:movie_app/data.vos/vos/actor_vo.dart';
import 'package:movie_app/data.vos/vos/credit_vo.dart';
import 'package:movie_app/data.vos/vos/genre_vo.dart';
import 'package:movie_app/data.vos/vos/movie_vo.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/network/retrofit_the_movie_api.dart';

import 'movie_data_agent.dart';

class RetrofitDataAgentImpl extends MovieDataAgent {
  /// For Constructor Setup
  // RetrofitDataAgentImpl() {
  //   final dio = Dio();
  //   mApi = TheMovieApi(dio);
  // }

  static final RetrofitDataAgentImpl _singleton =
      RetrofitDataAgentImpl._internal();

  late RetrofitTheMovieApi mApi;

  factory RetrofitDataAgentImpl() {
    return _singleton;
  }

  RetrofitDataAgentImpl._internal() {
    final dio = Dio();
    mApi = RetrofitTheMovieApi(dio);
  }

  @override
  Future<List<MovieVO>> getNowPlayingMovies(int page) {
    return mApi
        .getNowPlayingMovies(apiKey, languageENUS, page.toString())
        .asStream()
        .map((response) => response.results)
        .first;
  }

  @override
  Future<List<MovieVO>> getPopularMovies(int page) {
    return mApi
        .getPopularMovies(apiKey, languageENUS, page.toString())
        .asStream()
        .map((event) => event.results)
        .first;
  }

  @override
  Future<List<ActorVO>> getActors(int page) {
    return mApi
        .getActors(apiKey, languageENUS, page.toString())
        .asStream()
        .map((response) => response.results)
        .first;
  }

  @override
  Future<List<MovieVO>> getTopRated(int page) {
    return mApi
        .getTopRated(apiKey, languageENUS, page.toString())
        .asStream()
        .map((event) => event.results)
        .first;
  }

  @override
  Future<List<GenreVO>> getGenres() {
    return mApi
        .getGenres(apiKey, languageENUS)
        .asStream()
        .map((event) => event.genres)
        .first;
  }

  @override
  Future<List<MovieVO>> getMovieByGenres(int genreId) {
    return mApi
        .getMovieByGenres(genreId.toString(), apiKey, languageENUS)
        .asStream()
        .map((event) => event.results)
        .first;
  }

  @override
  Future<List<CreditVO>> getCreditsByMovie(int movieId) {
    return mApi
        .getCreditsByMovie(
            movieId.toString(), apiKey, languageENUS, 1.toString())
        .asStream()
        .map((event) => event.cast)
        .first;
  }

  @override
  Future<MovieVO> getMovieDetails(int movieId) {
    return mApi.getMovieDetails(
        movieId.toString(), apiKey, languageENUS, 1.toString());
  }
}
