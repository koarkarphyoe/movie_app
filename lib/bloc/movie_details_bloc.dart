import 'dart:async';
import '../data.vos/models/movie_model.dart';
import '../data.vos/models/movie_model_impl.dart';
import '../data.vos/vos/credit_vo.dart';
import '../data.vos/vos/movie_vo.dart';

class MovieDetailsBloc {
  //Reactive Stream
  StreamController<MovieVO?> mMovieStreamController =
      StreamController.broadcast();
  StreamController<List<CreditVO>?> mActorListsStreamController =
      StreamController.broadcast();
  StreamController<List<CreditVO>?> mCreatorsListsController =
      StreamController.broadcast();

  //Model
  MovieModel mModel = MovieModelImpl();

  MovieDetailsBloc(int movieId) {
    mModel.getMovieDetailsFromDatabase(movieId).listen((event) {
      mMovieStreamController.sink.add(event);
    });

    mModel.getCreditsFromDatabase(movieId)?.listen((event) {
      mActorListsStreamController.sink
          .add(event?.where((element) => element.isActor()).toList());
      mCreatorsListsController.sink
          .add(event?.where((element) => element.isCreator()).toList());
    });
  }

  void dispose() {
    mMovieStreamController.close();
    mActorListsStreamController.close();
    mCreatorsListsController.close();
  }
}
