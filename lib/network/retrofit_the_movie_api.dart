import 'package:dio/dio.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:retrofit/retrofit.dart';
part 'retrofit_the_movie_api.g.dart';

@RestApi(baseUrl: baseURLDio)
abstract class TheMovieApi {
  factory TheMovieApi(Dio dio) = _TheMovieApi;

  @GET(endPoint)
  Future getNowPlayingMovies(
    @Query(paramAPIKEY) String apiKey,
    @Query(paramLanguage) String languageENUS,
    @Query(paramPage) String page,
  );
}
