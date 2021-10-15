
import '../movie_vo.dart';

abstract class MovieModel {
  Future<List<MovieVO>> getNowPlayingMovies(int page);

}
