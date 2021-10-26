import 'package:movie_app/data.vos/vos/actor_known_for_vo.dart';
import 'package:movie_app/data.vos/vos/actor_vo.dart';
import 'package:movie_app/data.vos/vos/results_vo.dart';

import '../movie_vo.dart';

abstract class MovieModel {
  Future<List<MovieVO>> getNowPlayingMovies(int page);
  Future<List<ResultsVO>> getPopularMovies(int page);
  Future<List<ActorVO>> getActors(int page);
  Future<List<MovieVO>> getTopRated(int page);
}
