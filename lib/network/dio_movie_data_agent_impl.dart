// import 'package:flutter/cupertino.dart';
// import 'package:movie_app/data.vos/movie_vo.dart';
// import 'package:movie_app/network/api_constants.dart';
// import 'package:movie_app/network/movie_data_agent.dart';

// import 'package:dio/dio.dart';

// class DioMovieDataAgentImpl extends MovieDataAgent {
//   @override
//   void getNowPlayingMovies(int page) {
//     Map<String, String> queryParameters = {
//       paramAPIKEY: apiKey,
//       paramLanguage: languageENUS,
//       paramPage: page.toString(),
//     };
//     Dio()
//         .get("$baseURLDio$endPoint", queryParameters: queryParameters)
//         .then((value) => {debugPrint("Now Playing ===> ${value.toString()}")})
//         .catchError((error) {
//       debugPrint("Error===> ${error.toString()}");
//     });
//   }
// }
