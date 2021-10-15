import 'package:dio/dio.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/network/responses/get_now_playing_response.dart';
import 'package:retrofit/retrofit.dart';
part 'retrofit_the_movie_api.g.dart';

@RestApi(baseUrl: baseURLDio)
abstract class TheMovieApi {
  factory TheMovieApi(Dio dio) = _TheMovieApi;

  @GET(endPoint)
  Future<GetNowPlayingResponse> getNowPlayingMovies(
    @Query(paramAPIKEY) String paramAPIKEY,
    @Query(paramLanguage) String paramLanguage,
    @Query(paramPage) String paramPage,
  );
}
