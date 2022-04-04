import 'package:movie_app/data.vos/models/movie_model.dart';
import 'package:movie_app/data.vos/vos/actor_vo.dart';
import 'package:movie_app/data.vos/vos/credit_vo.dart';
import 'package:movie_app/data.vos/vos/genre_vo.dart';
import 'package:movie_app/data.vos/vos/movie_vo.dart';
import 'package:movie_app/network/movie_data_agent.dart';
import 'package:movie_app/network/retrofit_data_agent_impl.dart';
import 'package:movie_app/persistence/daos/daos/actor_dao.dart';
import 'package:movie_app/persistence/daos/daos/genre_dao.dart';
import 'package:movie_app/persistence/daos/daos/movie_dao.dart';
import 'package:stream_transform/stream_transform.dart';

class MovieModelImpl extends MovieModel {
  MovieDataAgent mDataAgent = RetrofitDataAgentImpl();

  static final MovieModelImpl _singleton = MovieModelImpl._internal();
  factory MovieModelImpl() {
    return _singleton;
  }
  MovieModelImpl._internal();

  //Daos
  MovieDao mMovieDao = MovieDao();
  ActorDao mActorDao = ActorDao();
  GenreDao mGenreDao = GenreDao();

  // Network Section

  // Before integration Persistence Layer's Entities and Daos,called data from network directly and show in View layer
  // @override
  // Future<List<MovieVO>> getNowPlayingMovies(int page) {
  //   return mDataAgent.getNowPlayingMovies(page);
  // }

  // After integration Persistence Layers
  @override
  void getNowPlayingMovies(int page) {
     mDataAgent.getNowPlayingMovies(page).then((movies) async {
      // e is MovieVO element
      List<MovieVO> nowPlayingMovies = movies.map((e) {
        e.isNowPlaying = true;
        e.isPopular = false;
        e.isTopRated = false;
        return e;
      }).toList();
      mMovieDao.saveAllMovie(nowPlayingMovies);
      return Future.value(movies);
    });
  }

  //Before Reactive Programming Implementation
  // @override
  // Future<List<MovieVO>> getPopularMovies(int page) {
  //   return mDataAgent.getPopularMovies(page).then((value) async {
  //     List<MovieVO> popularMovies = value.map((e) {
  //       e.isNowPlaying = false;
  //       e.isPopular = true;
  //       e.isTopRated = false;
  //       return e;
  //     }).toList();

  //     mMovieDao.saveAllMovie(popularMovies);

  //     return Future.value(value);
  //   });
  // }

  //After Reactive Programming Implementation
  @override
  void getPopularMovies(int page) {
    mDataAgent.getPopularMovies(page).then((value) async {
      List<MovieVO> popularMovies = value.map((e) {
        e.isNowPlaying = false;
        e.isPopular = true;
        e.isTopRated = false;
        return e;
      }).toList();
      mMovieDao.saveAllMovie(popularMovies);
    });
  }

  @override
  Future<List<ActorVO>> getActors(int page) {
    return mDataAgent.getActors(page).then((value) async {
      mActorDao.saveAllActors(value);

      return Future.value(value);
    });
  }

  @override
  void getTopRated(int page) {
    mDataAgent.getTopRated(page).then((value) async {
      List<MovieVO> mTopRated = value.map((e) {
        e.isNowPlaying = false;
        e.isPopular = false;
        e.isTopRated = true;
        return e;
      }).toList();
      mMovieDao.saveAllMovie(mTopRated);
    });
  }

  @override
  Future<List<GenreVO>> getGenres() {
    return mDataAgent.getGenres().then((value) async {
      mGenreDao.saveAllGenre(value);

      return Future.value(value);
    });
  }

  @override
  Future<List<MovieVO>> getMovieByGenres(int genreId) {
    return mDataAgent.getMovieByGenres(genreId);
  }

  @override
  Future<List<CreditVO>> getCreditsByMovie(int movieId) {
    return mDataAgent.getCreditsByMovie(movieId);
  }

  @override
  Future<MovieVO> getMovieDetails(int movieId) {
    return mDataAgent.getMovieDetails(movieId).then((value) async {
      mMovieDao.saveSingleMovie(value);
      return Future.value(value);
    });
  }

  // Database Section or Persistence Layer (whith Hive) and Reactive Programming

  @override
  Future<List<ActorVO>?>? getActorsFromDatabase() {
    return Future.value(mActorDao.getAllActors());
  }

  @override
  Future<List<GenreVO>?>? getGenresFromDatabase() {
    return Future.value(mGenreDao.getAllGenre());
  }

  @override
  Future<MovieVO>? getMovieDetailsFromDatabase(int movieId) {
    return Future.value(mMovieDao.getMovieById(movieId));
  }

  @override
  Future<List<MovieVO>?>? getNowPlayingMoviesFromDatabase() {
    this.getNowPlayingMovies(1);
    return mMovieDao
        .getAllMoviesEventStream()
        .startWith(mMovieDao.getNowPlayingMoviesStream())
        .combineLatest(mMovieDao.getNowPlayingMoviesStream(),
            (p0, p1) => p1 as List<MovieVO>)
        .first;
  }

  @override
  Future<List<MovieVO>?>? getPopularMoviesFromDatabase() {
    this.getPopularMovies(1);
    return mMovieDao
        .getAllMoviesEventStream()
        //will start from the database's data in UI
        .startWith(mMovieDao.getPopularMoviesStream())
        .combineLatest(
            mMovieDao.getPopularMoviesStream(),
            //p0 means getAllMoviesEventStream(),p1 means getPopularMoviesStream()
            (event, movieList) => movieList as List<MovieVO>)
        .first;
  }

  @override
  Future<List<MovieVO>?>? getTopRatedFromDatabase() {
    this.getTopRated(1);
    return mMovieDao
        .getAllMoviesEventStream()
        .startWith(mMovieDao.getTopRatedMoviesStream())
        .combineLatest(mMovieDao.getTopRatedMoviesStream(),
            (event, movieList) => movieList as List<MovieVO>)
        .first;
  }
}
