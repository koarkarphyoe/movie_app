import 'package:movie_app/data.vos/movie_vo.dart';
import 'package:movie_app/data.vos/vos/actor_vo.dart';
import 'package:movie_app/data.vos/vos/genre_vo.dart';

abstract class MovieDataAgent {
  Future<List<MovieVO>> getNowPlayingMovies(int page);
  Future<List<MovieVO>> getPopularMovies(int page);
  Future<List<ActorVO>> getActors(int page);
  Future<List<MovieVO>> getTopRated(int page);
  Future<List<GenreVO>> getGenres();
  Future<List<MovieVO>> getMovieByGenres(int genreId);
}
