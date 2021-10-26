import 'package:dio/dio.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/network/responses/get_actors_response.dart';
import 'package:movie_app/network/responses/get_now_playing_response.dart';
import 'package:movie_app/network/responses/get_popular_movies_response.dart';
import 'package:movie_app/network/responses/top_rated_response.dart';
import 'package:retrofit/retrofit.dart';
part 'retrofit_the_movie_api.g.dart';

@RestApi(baseUrl: baseURLDio)
abstract class RetrofitTheMovieApi {
  factory RetrofitTheMovieApi(Dio dio) = _RetrofitTheMovieApi;

  @GET(endPointGetNowPlaying)
  Future<GetNowPlayingResponse> getNowPlayingMovies(
    @Query(paramAPIKEY) String paramAPIKEY,
    @Query(paramLanguage) String paramLanguage,
    @Query(paramPage) String paramPage,
  );

  @GET(endPointGetPopular)
  Future<GetPopularMoviesResponse> getPopularMovies(
    @Query(paramAPIKEY) String paramAPIKEY,
    @Query(paramLanguage) String paramLanguage,
    @Query(paramPage) String paramPage,
  );

  @GET(endPointGetActors)
  Future<GetActorsResponse> getActors(
    @Query(paramAPIKEY) String paramAPIKEY,
    @Query(paramLanguage) String paramLanguage,
    @Query(paramPage) String paramPage,
  );

  @GET(endPointGetTopRated)
  Future<TopRatedResponse> getTopRated(
    @Query(paramAPIKEY) String paramAPIKEY,
    @Query(paramLanguage) String paramLanguage,
    @Query(paramPage) String paramPage,
  );
}
