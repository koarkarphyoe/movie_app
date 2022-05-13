import 'dart:async';
import 'package:movie_app/data.vos/models/movie_model.dart';
import 'package:movie_app/data.vos/models/movie_model_impl.dart';
import '../data.vos/vos/actor_vo.dart';
import '../data.vos/vos/genre_vo.dart';
import '../data.vos/vos/movie_vo.dart';

class HomeBloc {
//Reactive Stream
  StreamController<List<MovieVO>?> mNowPlayingMovieListStreamController =
      StreamController();
  StreamController<List<ActorVO>?> mActorListStreamController =
      StreamController();
  StreamController<List<MovieVO>?> mPopularMovieListStreamController =
      StreamController();
  StreamController<List<MovieVO>?> topRatedStreamController =
      StreamController();
  StreamController<List<GenreVO>?> mGenreListStreamController =
      StreamController();
  StreamController<List<MovieVO>?> mMovieByGenreStreamController =
      StreamController();

  //Model
  MovieModel mMovieModel = MovieModelImpl();

  HomeBloc() {
    //Now Playing Movie Database
    mMovieModel.getNowPlayingMoviesFromDatabase()?.listen((event) {
      mNowPlayingMovieListStreamController.sink.add(event);
    }).onError((error) {});

    // Actor Database
    mMovieModel.getActorsFromDatabase()?.listen((event) {
      mActorListStreamController.sink.add(event);
    }).onError((error) {});

    mMovieModel.getPopularMoviesFromDatabase()?.listen((event) {
      mPopularMovieListStreamController.sink.add(event);
    }).onError((error) {});

    mMovieModel.getTopRatedFromDatabase()?.listen((event) {
      topRatedStreamController.sink.add(event);
    }).onError((error) {});

    mMovieModel.getGenresFromDatabase()?.listen((event) {
      mGenreListStreamController.sink.add(event);
      getMoviesGenreAndRefresh(event!.first.id);
    }).onError((error) {});
  }

  //tap genre and get movie list
  void getMoviesGenreAndRefresh(int genreId) {
    mMovieModel.getMovieListByGenreFromDatabase(genreId).listen((event) {
      mMovieByGenreStreamController.sink.add(event);
    }).onError((error) {});
  }

  // void onTapGenre(int genreId) {
  //   getMoviesGenreAndRefresh(genreId);
  // }

  void dispose() {
    mNowPlayingMovieListStreamController.close();
    mActorListStreamController.close();
    mPopularMovieListStreamController.close();
    topRatedStreamController.close();
    mGenreListStreamController.close();
    mMovieByGenreStreamController.close();
  }
}
