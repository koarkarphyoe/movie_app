import 'package:hive/hive.dart';
import 'package:movie_app/data.vos/vos/credit_vo.dart';
import 'package:movie_app/persistence/daos/hive_constants.dart';
import 'package:stream_transform/stream_transform.dart';

class CreditsDao {
  static final CreditsDao _singleton = CreditsDao._internal();
  factory CreditsDao() {
    return _singleton;
  }
  CreditsDao._internal();

  void saveAllCredits(List<CreditVO> mCredits, int movieId) async {
    Map<int, CreditVO> creditMap = Map.fromIterable(mCredits,
        key: (credit) => credit.id, value: (credit) => credit);
    await getCreditsBox().putAll(creditMap);
  }

  List<CreditVO> getAllCredits(int movieId) {
    return getCreditsBox().values.toList();
  }

  //Reactive Programming
  Stream<List<CreditVO>> getAllCreditsListStream(int movieId) {
    return getCreditsBox()
        .watch()
        .map((event) => getAllCredits(movieId)
            .where((element) => element.movieId == movieId)
            .toList())
        .startWith(getAllCredits(movieId)
            .where((element) => element.movieId == movieId)
            .toList());
  }

  Box<CreditVO> getCreditsBox() {
    return Hive.box<CreditVO>(boxName_CreditVO);
  }
}
