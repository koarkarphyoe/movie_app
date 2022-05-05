import 'package:hive/hive.dart';
import 'package:movie_app/persistence/daos/hive_constants.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../data.vos/vos/movie_vo.dart';


///Banner and popular section movies will not override in hive's database
///If use in MovieDao,will override in database and will not show banner and popular movies
class MovieByGenresDao {
  static final MovieByGenresDao _singleton = MovieByGenresDao._internal();

  factory MovieByGenresDao() {
    return _singleton;
  }
  MovieByGenresDao._internal();

  void saveMovieListByGenreId(List<MovieVO> movieList, int genreId) async {
    Map<int, MovieVO> movieMap = Map.fromIterable(movieList,
        key: (movie) => movie.id, value: (movie) => movie);
    await getMovieByGenreBox().putAll(movieMap);
  }

  List<MovieVO> getAllMovie() {
    return getMovieByGenreBox().values.toList();
  }

  Stream<List<MovieVO>> getMovieListByGenreId(int genreId) {
    return getMovieByGenreBox()
        .watch()
        .map((event) => getAllMovie()
            .where((element) => element.genreId == genreId)
            .toList())
        .startWith(getAllMovie()
            .where((element) => element.genreId == genreId)
            .toList());
  }



   Box<MovieVO> getMovieByGenreBox() {
    return Hive.box<MovieVO>(boxName_MovieByGenre);
  }

}
