import 'package:movie_app/data.vos/models/movie_model.dart';
import 'package:movie_app/data.vos/movie_vo.dart';
import 'package:movie_app/data.vos/vos/actor_vo.dart';
import 'package:movie_app/data.vos/vos/genre_vo.dart';
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

  @override
  Future<List<MovieVO>> getPopularMovies(int page) {
    return mDataAgent.getPopularMovies(page);
  }

  @override
  Future<List<ActorVO>> getActors(int page) {
    return mDataAgent.getActors(page);
  }

  @override
  Future<List<MovieVO>> getTopRated(int page) {
    return mDataAgent.getTopRated(page);
  }

  @override
  Future<List<GenreVO>> getGenres() {
    return mDataAgent.getGenres();
  }

  @override
  Future<List<MovieVO>> getMovieByGenres(int genreId) {
    return mDataAgent.getMovieByGenres(genreId);
  }
}
