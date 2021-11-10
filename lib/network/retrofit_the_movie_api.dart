import 'package:dio/dio.dart';
import 'package:movie_app/data.vos/vos/movie_vo.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/network/responses/get_actors_response.dart';
import 'package:movie_app/network/responses/get_credits_by_movie_response.dart';
import 'package:movie_app/network/responses/get_genres_response.dart';
import 'package:movie_app/network/responses/get_movie_by_genre_response.dart';
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
    @Query(paramAPIKEY) String apiKeyParam,
    @Query(paramLanguage) String languageParam,
    @Query(paramPage) String pageParam,
  );

  @GET(endPointGetPopular)
  Future<GetPopularMoviesResponse> getPopularMovies(
    @Query(paramAPIKEY) String apiKeyParam,
    @Query(paramLanguage) String languageParam,
    @Query(paramPage) String pageParam,
  );

  @GET(endPointGetActors)
  Future<GetActorsResponse> getActors(
    @Query(paramAPIKEY) String apiKeyParam,
    @Query(paramLanguage) String languageParam,
    @Query(paramPage) String pageParam,
  );

  @GET(endPointGetTopRated)
  Future<TopRatedResponse> getTopRated(
    @Query(paramAPIKEY) String apiKeyParam,
    @Query(paramLanguage) String languageParam,
    @Query(paramPage) String pageParam,
  );

  @GET(endPointGetGenre)
  Future<GetGenresResponse> getGenres(
    @Query(paramAPIKEY) String apiKeyParam,
    @Query(paramLanguage) String languageParam,
  );

  @GET(endPointGetMovieByGenre)
  Future<GetMovieByGenreResponse> getMovieByGenres(
    @Query(paramGenreId) String genreId,
    @Query(paramAPIKEY) String apiKeyParam,
    @Query(paramLanguage) String languageParam,
  );

  @GET("$endPointGetMovieDetails/{movie_id}")
  Future<MovieVO> getMovieDetails(
    @Path("movie_id") String movieId,
    @Query(paramAPIKEY) String apiKeyParam,
    @Query(paramLanguage) String languageParam,
    @Query(paramPage) String pageParam,
  );

  @GET("$endPointGetCreditsByMovie/{movie_id}/credits")
  Future<GetCreditsByMovieResponse> getCreditsByMovie(
    @Path("movie_id") String movieId,
    @Query(paramAPIKEY) String apiKeyParam,
    @Query(paramLanguage) String languageParam,
    @Query(paramPage) String pageParam,
  );
}
