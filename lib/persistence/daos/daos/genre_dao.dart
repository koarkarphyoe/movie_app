import 'package:hive/hive.dart';
import 'package:movie_app/data.vos/vos/genre_vo.dart';
import 'package:movie_app/persistence/daos/hive_constants.dart';
import 'package:stream_transform/stream_transform.dart';

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

  ///Reactive Programming
  Stream<void> getAllGenreEventStrem() {
    return getGenreBox().watch();
  }

  // Stream<List<GenreVO>> getAllGenreListStream() {
  //   return Stream.value(getAllGenre().toList());
  // }
  Stream<List<GenreVO>> getAllGenreListStream() {
    return getGenreBox()
        .watch()
        .map((event) => getAllGenre())
        .startWith(getAllGenre());
  }

  Box<GenreVO> getGenreBox() {
    return Hive.box<GenreVO>(boxName_GenreVO);
  }
}
