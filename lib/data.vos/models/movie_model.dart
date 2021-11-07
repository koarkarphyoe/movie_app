import 'package:movie_app/data.vos/vos/actor_vo.dart';
import 'package:movie_app/data.vos/vos/base_vo.dart';
import 'package:movie_app/data.vos/vos/credit_vo.dart';
import 'package:movie_app/data.vos/vos/genre_vo.dart';

import '../movie_vo.dart';

abstract class MovieModel {
  Future<List<MovieVO>> getNowPlayingMovies(int page);
  Future<List<MovieVO>> getPopularMovies(int page);
  Future<List<ActorVO>> getActors(int page);
  Future<List<MovieVO>> getTopRated(int page);
  Future<List<MovieVO>> getMovieByGenres(int genreId);
  Future<List<GenreVO>> getGenres();
  Future<List<CreditVO>> getCreditsByMovie(int movieId);
  Future<MovieVO> getMovieDetails(int movieId);
}
