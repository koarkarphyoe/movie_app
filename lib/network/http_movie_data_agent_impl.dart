import 'package:flutter/cupertino.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/network/movie_data_agent.dart';

class HttpMovieDataAgentImpl extends MovieDataAgent {
  @override
  void getNowPlayingMovies(int page) {
    Map<String, String> queryParameters = {
      paramAPIKEY: apiKey,
      paramLanguage: languageEN_US,
      paramPage: page.toString(),
    };
    var url = Uri.http(baseURLHTTP, endPoint, queryParameters);
    http
        .get(url)
        .then((value) =>
            {debugPrint("Now Playing ====> ${value.body.toString()}")})
        .catchError((error) {
      debugPrint("Error=====> ${error.toString()}");
    });
  }
}
