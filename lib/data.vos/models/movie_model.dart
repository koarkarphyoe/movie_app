import 'package:movie_app/data.vos/vos/actor_vo.dart';
import 'package:movie_app/data.vos/vos/credit_vo.dart';
import 'package:movie_app/data.vos/vos/genre_vo.dart';
import 'package:movie_app/data.vos/vos/movie_vo.dart';

abstract class MovieModel {
  //Network
  void getNowPlayingMovies(
      int page); 
  void getPopularMovies(int page);
  void getTopRated(int page);
  void getActors(int page);
  void getMovieByGenre(int genreId);
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
  Stream<MovieVO?> getMovieDetailsFromDatabase(int movieId);
  Stream<List<MovieVO>> getMovieListByGenreFromDatabase(int genreId);
}
