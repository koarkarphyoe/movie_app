import 'package:dio/src/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/network/retrofit_the_movie_api.dart';

import 'movie_data_agent.dart';

class RetrofitDataAgentImpl extends MovieDataAgent {
  late TheMovieApi mApi;

  /// For Constructor Setup
  RetrofitDataAgentImpl() {
    final dio = Dio();
    mApi = TheMovieApi(dio);
  }

  @override
  void getNowPlayingMovies(int page) {
    mApi
        .getNowPlayingMovies(apiKey, languageENUS, page.toString())
        .then((value) => {debugPrint("Now Playing ====> ${value.toString()}")})
        .catchError((error) {
      debugPrint("Error=====> ${error.toString()}");
    });
  }
}
