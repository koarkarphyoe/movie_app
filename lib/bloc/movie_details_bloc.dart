import 'package:flutter/cupertino.dart';

import '../data.vos/models/movie_model.dart';
import '../data.vos/models/movie_model_impl.dart';
import '../data.vos/vos/credit_vo.dart';
import '../data.vos/vos/movie_vo.dart';

class MovieDetailsBloc extends ChangeNotifier {
  //state
  MovieVO? mMovie;
  List<CreditVO>? mActorLists;
  List<CreditVO>? mCreatorsLists;

  //Model
  MovieModel mModel = MovieModelImpl();

  MovieDetailsBloc(int movieId) {
    mModel.getMovieDetailsFromDatabase(movieId).listen((event) {
      mMovie = event;
      notifyListeners();
    });

    mModel.getCreditsFromDatabase(movieId)?.listen((event) {
      mActorLists = event?.where((element) => element.isActor()).toList();
      mCreatorsLists = event?.where((element) => element.isCreator()).toList();
      notifyListeners();
    });
  }
}
