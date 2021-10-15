import 'package:movie_app/data.vos/models/movie_model.dart';
import 'package:movie_app/data.vos/movie_vo.dart';
import 'package:movie_app/network/movie_data_agent.dart';
import 'package:movie_app/network/retrofit_data_agent_impl.dart';

class MovieModelImpl extends MovieModel {
  MovieDataAgent mDataAgent = RetrofitDataAgentImpl();

  static final MovieModelImpl _singleton = MovieModelImpl._internal();
  factory MovieModelImpl() {
    return _singleton;
  }
  MovieModelImpl._internal();

  @override
  Future<List<MovieVO>> getNowPlayingMovies(int page) {
    return mDataAgent.getNowPlayingMovies(page);
  }
}
