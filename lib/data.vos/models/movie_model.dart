import 'package:movie_app/data.vos/vos/actor_vo.dart';
import 'package:movie_app/data.vos/vos/credit_vo.dart';
import 'package:movie_app/data.vos/vos/genre_vo.dart';
import 'package:movie_app/data.vos/vos/movie_vo.dart';

abstract class MovieModel {
  //Network
  // Future<List<MovieVO>?>? getNowPlayingMovies(int page); //Before Reactive Programming Implementation
  // Future<List<MovieVO>?>? getPopularMovies(int page); //Before Reactive Programming Implementation
  // Future<List<MovieVO>?>? getTopRated(int page); //Before Reactive Programming Implementation
  void getNowPlayingMovies(
      int page); //After Reactive Programming Implementation
  void getPopularMovies(int page); //After Reactive Programming Implementation
  void getTopRated(int page); //After Reactive Programming Implementation
  void getActors(int page);
  Future<List<MovieVO>> getMovieByGenre(int genreId);
  void getGenres();
  void getCreditsByMovie(int movieId);
  void getMovieDetails(int movieId);

  //Database

  Stream<List<MovieVO>?>? getNowPlayingMoviesFromDatabase();
  Stream<List<MovieVO>?>? getPopularMoviesFromDatabase();
  Stream<List<ActorVO>?>? getActorsFromDatabase();
  Stream<List<MovieVO>?>? getTopRatedFromDatabase();
  Stream<List<GenreVO>?>? getGenresFromDatabase();
  Stream<List<CreditVO>?>? getCreditsFromDatabase(int movieId);
  Stream<MovieVO>? getMovieDetailsFromDatabase(int movieId,{bool isPopular});
}
