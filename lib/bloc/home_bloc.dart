import 'package:flutter/cupertino.dart';

import '../data.vos/models/movie_model.dart';
import '../data.vos/models/movie_model_impl.dart';
import '../data.vos/vos/actor_vo.dart';
import '../data.vos/vos/genre_vo.dart';
import '../data.vos/vos/movie_vo.dart';

class HomeBloc extends ChangeNotifier {
  //State
  List<MovieVO>? mNowPlayingMovieList;
  List<ActorVO>? mActorList;
  List<MovieVO>? mPopularMovieList;
  List<MovieVO>? topRated;
  List<GenreVO>? mGenreList;
  List<MovieVO>? mMovieByGenre;

  /// Create Object for Model Components
  MovieModel mModel = MovieModelImpl();

  HomeBloc() {
    mModel.getNowPlayingMoviesFromDatabase()?.listen((event) {
      mNowPlayingMovieList = event;
      notifyListeners();
    });

    mModel.getActorsFromDatabase()?.listen((event) {
      mActorList = event;
      notifyListeners();
    });

    mModel.getPopularMoviesFromDatabase()?.listen((event) {
      mPopularMovieList = event;
      notifyListeners();
    });

    mModel.getTopRatedFromDatabase()?.listen((event) {
      topRated = event;
      notifyListeners();
    });

    mModel.getGenresFromDatabase()?.listen((event) {
      mGenreList = event;
      if (mGenreList != null) {
        _getMoviesGenreAndRefresh(mGenreList!.first.id);
      } else {
        [];
      }
      notifyListeners();
    });
  }
  void onTapGenre(int genreId) {
    _getMoviesGenreAndRefresh(genreId);
  }

  void _getMoviesGenreAndRefresh(int genreId) {
    mModel.getMovieListByGenreFromDatabase(genreId).listen((event) {
      mMovieByGenre = event;
      notifyListeners();
    });
  }
}
