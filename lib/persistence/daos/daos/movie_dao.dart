import 'package:hive/hive.dart';
import 'package:movie_app/data.vos/vos/movie_vo.dart';
import 'package:movie_app/persistence/daos/hive_constants.dart';
import 'package:stream_transform/stream_transform.dart';

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
    return getMovieBox()
        .watch()
        .map((event) => getAllMovie()
            .where((element) => element.isNowPlaying ?? false)
            .toList())
        .startWith(getAllMovie()
            .where((element) => element.isNowPlaying ?? false)
            .toList());
  }

  List<MovieVO> getPopularMoviesList() {
    return getAllMovie().where((e) => e.isPopular ?? false).toList();
  }

  Stream<List<MovieVO>> getPopularMoviesStream() {
    return getMovieBox()
        .watch()
        .map((event) => getAllMovie()
            .where((element) => element.isPopular ?? false)
            .toList())
        .startWith(getAllMovie()
            .where((element) => element.isPopular ?? false)
            .toList());
  }

  Stream<List<MovieVO>> getTopRatedMoviesStream() {
    return getMovieBox()
        .watch()
        .map((event) => getAllMovie()
            .where((element) => element.isTopRated ?? false)
            .toList())
        .startWith(getAllMovie()
            .where((element) => element.isTopRated ?? false)
            .toList());
  }

  Stream<MovieVO> getMovieDetailsStream(int movieId) {
    return Stream.value(getMovieById(movieId)!)
        .where((event) => event.isForDetails ?? false);
  }

  Box<MovieVO> getMovieBox() {
    return Hive.box<MovieVO>(boxName_MovieVO);
  }
}
