import 'package:movie_app/data.vos/vos/actor_vo.dart';
import 'package:movie_app/data.vos/vos/credit_vo.dart';
import 'package:movie_app/data.vos/vos/genre_vo.dart';
import 'package:movie_app/data.vos/vos/movie_vo.dart';

abstract class MovieModel {
  //Network
  // Future<List<MovieVO>?>? getNowPlayingMovies(int page); //Before Reactive Programming Implementation
  // Future<List<MovieVO>?>? getPopularMovies(int page); //Before Reactive Programming Implementation
  // Future<List<MovieVO>?>? getTopRated(int page); //Before Reactive Programming Implementation
  void getNowPlayingMovies(int page); //After Reactive Programming Implementation
  void getPopularMovies(int page); //After Reactive Programming Implementation
  void getTopRated(int page);//After Reactive Programming Implementation
  Future<List<ActorVO>?>? getActors(int page);
  Future<List<MovieVO>?>? getMovieByGenre(int genreId);
  Future<List<GenreVO>?>? getGenres();
  Future<List<CreditVO>?>? getCreditsByMovie(int movieId);
  Future<MovieVO>? getMovieDetails(int movieId);

  //Database

  Future<List<MovieVO>?>? getNowPlayingMoviesFromDatabase();
  Future<List<MovieVO>?>? getPopularMoviesFromDatabase();
  Future<List<ActorVO>?>? getActorsFromDatabase();
  Future<List<MovieVO>?>? getTopRatedFromDatabase();
  Future<List<GenreVO>?>? getGenresFromDatabase();
  Future<MovieVO>? getMovieDetailsFromDatabase(int movieId);
}
