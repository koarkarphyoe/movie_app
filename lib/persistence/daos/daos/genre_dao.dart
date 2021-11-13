import 'package:hive/hive.dart';
import 'package:movie_app/data.vos/vos/genre_vo.dart';
import 'package:movie_app/persistence/daos/hive_constants.dart';

class GenreDao {
  static final GenreDao _singleton = GenreDao._internal();

  factory GenreDao() {
    return _singleton;
  }

  GenreDao._internal();

  void saveAllGenre(List<GenreVO> genreList) async {
    Map<int, GenreVO> genreMap = Map.fromIterable(genreList,
        key: (genre) => genre.id, value: (genre) => genre);
    await getGenreBox().putAll(genreMap);
  }

  List<GenreVO> getAllGenre() {
    return getGenreBox().values.toList();
  }

  Box<GenreVO> getGenreBox() {
    return Hive.box<GenreVO>(boxName_GenreVO);
  }
}
