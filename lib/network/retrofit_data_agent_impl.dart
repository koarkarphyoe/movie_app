// ignore: implementation_imports
import 'package:dio/src/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:movie_app/data.vos/movie_vo.dart';
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

  late TheMovieApi mApi;

  factory RetrofitDataAgentImpl() {
    return _singleton;
  }

  RetrofitDataAgentImpl._internal() {
    final dio = Dio();
    mApi = TheMovieApi(dio);
  }

  @override
  Future<List<MovieVO>> getNowPlayingMovies(int page) {
    return mApi
        .getNowPlayingMovies(apiKey, languageENUS, page.toString())
        .asStream()
        .map((response) => response.results)
        .first;
  }
}
