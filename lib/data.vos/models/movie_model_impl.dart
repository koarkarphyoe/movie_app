import 'package:movie_app/data.vos/models/movie_model.dart';
import 'package:movie_app/data.vos/vos/actor_vo.dart';
import 'package:movie_app/data.vos/vos/credit_vo.dart';
import 'package:movie_app/data.vos/vos/genre_vo.dart';
import 'package:movie_app/data.vos/vos/movie_vo.dart';
import 'package:movie_app/network/movie_data_agent.dart';
import 'package:movie_app/network/retrofit_data_agent_impl.dart';
import 'package:movie_app/persistence/daos/daos/actor_dao.dart';
import 'package:movie_app/persistence/daos/daos/credits_dao.dart';
import 'package:movie_app/persistence/daos/daos/genre_dao.dart';
import 'package:movie_app/persistence/daos/daos/movie_by_genres_dao.dart';
import 'package:movie_app/persistence/daos/daos/movie_dao.dart';

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
  CreditsDao mCreditDao = CreditsDao();
  MovieByGenresDao movieByGenresDao = MovieByGenresDao();

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
      // return Future.value(movies);
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
  void getActors(int page) {
    mDataAgent.getActors(page).then((value) async {
      mActorDao.saveAllActors(value);
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
  void getGenres() {
    mDataAgent.getGenres().then((value) async {
      mGenreDao.saveAllGenre(value);
    });
  }

  @override
  Future<List<MovieVO>> getMovieByGenre(int genreId) {
    return mDataAgent.getMovieByGenres(genreId).then((value) {
      List<MovieVO> mTopRated = value.map((e) {
        e.genreId = genreId;
        print(e.genreId.toString());
        return e;
      }).toList();
      movieByGenresDao.saveMovieListByGenreId(mTopRated, genreId);
      return Future.value(value);
    });
  }

  @override
  void getCreditsByMovie(int movieId) {
    mDataAgent.getCreditsByMovie(movieId).then((value) async {
      mCreditDao.saveAllCredits(value);
    });
  }

  @override
  void getMovieDetails(int movieId) {
    mDataAgent.getMovieDetails(movieId).then((value) {
      //must to reassign value.isPopular=true bcoz network data will overwrite on database with same movieId on memory
      value.isPopular = true;
      //optional!,no need to reassign under boolean data
      // value.isNowPlaying = true;
      // value.isTopRated = true;

      mMovieDao.saveSingleMovie(value);
    });
  }

  // Database Section or Persistence Layer (whith Hive) and Reactive Programming

  @override
  Stream<List<ActorVO>?>? getActorsFromDatabase() {
    this.getActors(1);
    return mActorDao.getAllActorsListStream();
  }

  @override
  Stream<List<GenreVO>?>? getGenresFromDatabase() {
    getGenres();
    return mGenreDao.getAllGenreListStream();
  }

  @override
  Stream<MovieVO>? getMovieDetailsFromDatabase(int movieId) {
    getMovieDetails(movieId);
    return mMovieDao.getMovieDetailsStream(movieId);
  }

  @override
  Stream<List<MovieVO>?>? getNowPlayingMoviesFromDatabase() {
    getNowPlayingMovies(1);
    return mMovieDao.getNowPlayingMoviesStream();
  }

  @override
  Stream<List<MovieVO>?>? getPopularMoviesFromDatabase() {
    getPopularMovies(1);
    return mMovieDao.getPopularMoviesStream();
  }

  @override
  Stream<List<MovieVO>?>? getTopRatedFromDatabase() {
    getTopRated(1);
    return mMovieDao.getTopRatedMoviesStream();
  }

  @override
  Stream<List<CreditVO>?>? getCreditsFromDatabase(int movieId) {
    getCreditsByMovie(movieId);
    return mCreditDao.getAllCreditsListStream();
  }

  @override
  Stream<List<MovieVO>> getMovieListByGenreFromDatabase(int genreId) {
    getMovieByGenre(genreId);
    return movieByGenresDao.getMovieListByGenreId(genreId);
  }
}
