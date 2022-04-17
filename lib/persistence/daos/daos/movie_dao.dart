import 'package:hive/hive.dart';
import 'package:movie_app/data.vos/vos/movie_vo.dart';
import 'package:movie_app/persistence/daos/hive_constants.dart';

class MovieDao {
  static final MovieDao _singleton = MovieDao._internal();

  factory MovieDao() {
    return _singleton;
  }

  MovieDao._internal();

  // save and get all movie list

  void saveAllMovie(List<MovieVO> movieList) async {
    Map<int, MovieVO> movieMap = Map.fromIterable(movieList,
        key: (movie) => movie.id, value: (movie) => movie);
    await getMovieBox().putAll(movieMap);
  }

  List<MovieVO> getAllMovie() {
    return getMovieBox().values.toList();
  }

  // save and get movie by id for each movie

  void saveSingleMovie(MovieVO movie) async {
    await getMovieBox().put(movie.id, movie);
  }

  // why movieId use? ,Movies are saved by id in saveAllMovie() and saveSingleMovie()
  MovieVO? getMovieById(int movieId) {
    return getMovieBox().get(movieId);
  }

  //Reactive Programming
  Stream<void> getAllMoviesEventStream() {
    return getMovieBox().watch();
  }

  Stream<List<MovieVO>> getNowPlayingMoviesStream() {
    return Stream.value(getAllMovie()
        .where((element) => element.isNowPlaying ?? false)
        .toList());
  }

  Stream<List<MovieVO>> getPopularMoviesStream() {
    return Stream.value(
        getAllMovie().where((element) => element.isPopular ?? false).toList());
  }

  Stream<List<MovieVO>> getTopRatedMoviesStream() {
    return Stream.value(
        getAllMovie().where((element) => element.isTopRated ?? false).toList());
  }

  Stream<MovieVO> getMovieDetailsStream(int movieId) {
    return Stream.value(getMovieById(movieId)!);
  }

  Box<MovieVO> getMovieBox() {
    return Hive.box<MovieVO>(boxName_MovieVO);
  }
}
