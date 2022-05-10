import 'package:hive/hive.dart';
import 'package:movie_app/data.vos/vos/movie_vo.dart';
import 'package:stream_transform/stream_transform.dart';

import '../hive_constants.dart';

class MovieDetailsDao {
  static final MovieDetailsDao _singleton = MovieDetailsDao._internal();
  factory MovieDetailsDao() {
    return _singleton;
  }
  MovieDetailsDao._internal();

  void saveSingleMovie(MovieVO movie) async {
    await getMovieDetailsBox().put(movie.id, movie);
  }

  MovieVO? getMovie(int movieId) {
    return getMovieDetailsBox().get(movieId);
  }

  Stream<MovieVO?> getMovieDetailsStream(int movieId) {
    return getMovieDetailsBox()
        .watch()
        .map((event) => getMovie(movieId))
        .startWith(getMovie(movieId));
  }

  Box<MovieVO> getMovieDetailsBox() {
    return Hive.box<MovieVO>(boxName_MovieDetails);
  }
}
